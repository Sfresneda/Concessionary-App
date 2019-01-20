//
//  ViewController.swift
//  ConcessionaryAppWithProtocols
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class CatalogViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var carsTableView: UITableView!
    
    // MARK: - Model
    var viewModel: CatalogViewModel {
        get{
            return self.model as! CatalogViewModel
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.initData()
        self.setupView()
    }
    
    // MARK: - Setup
    private func setupView() {
        self.title = self.viewModel.catalogNavBarTitle
        self.sortButton.title = self.viewModel.sortButtonTitle
        self.setupTableView()
    }
    
    private func setupTableView() {
        self.carsTableView.delegate = self
        self.carsTableView.dataSource = self
        
        self.carsTableView.tableFooterView = UIView()
        
        self.carsTableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func sortList(_ action: Any){
        self.sortButton.title = self.viewModel.sortButtonTitle
        
        self.viewModel.toggleSortButton()
        
        for (index, _) in self.viewModel.catalog.enumerated(){
            self.carsTableView.reloadRows(at: [IndexPath.init(row: index, section: 0)], with: UITableView.RowAnimation.left)
        }
    }
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - MANDATORY METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.catalog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.viewModel.generateCell(for: indexPath)
    }
    
    // MARK: - OPTIONAL METHODS
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.init(self.viewModel.cellHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.model!.coordinator?.viewDetail(
            _carData: self.viewModel.catalog[indexPath.row],
            _brand: self.viewModel.brand
        )
    }
}
