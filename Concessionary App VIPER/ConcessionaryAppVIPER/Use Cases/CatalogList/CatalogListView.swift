//
//  CatalogListView.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation
import UIKit

class CatalogListView: UIViewController, CatalogListViewContract {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    
    // MARK: - Contract Vars
    var presenter: CatalogListPresenter!
    
    // MARK: - Vars
    private var cellIdentifier = "CarCell"
    
    var viewModel: CatalogListEntity {
        return presenter.viewModel
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.loadCatalogList()
    }
    
    // MARK: - Contract Methods
    func setupView() {
        self.title = Bundle.main.infoDictionary![kCFBundleNameKey as String] as? String
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = true
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: "CarCellTableViewCell", bundle: nil), forCellReuseIdentifier: self.cellIdentifier)
        self.updateSortButtonTitle()
    }
    
    func refreshTableView() {
        self.tableView.reloadData()
    }
    
    func updateSortButtonTitle(){
        self.sortButton.title = "\(self.viewModel.sortOrder.rawValue) Sort"
    }
    
    // MARK: - Actions
    @IBAction func sortButtonPressed(_ action: Any) {
        self.presenter.sortButtonPressed()
    }
}

extension CatalogListView: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Mandatory Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.catalog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as! CarCellTableViewCell
        
        let car = self.viewModel.catalog[indexPath.row]
        
        cell.carName.text = "\(car.brand.rawValue) \(car.name)"
        cell.carPrice.text = "\(car.price.formatWithoutDecimals) €"
        
        cell.carImage.image = UIImage.init(named: car.imageNames.first!)
        cell.carImage.contentMode = .scaleAspectFill
        cell.carImage.clipsToBounds = true
        
        return cell
    }
    
    // MARK: - Optional Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.selectedItem(with: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
