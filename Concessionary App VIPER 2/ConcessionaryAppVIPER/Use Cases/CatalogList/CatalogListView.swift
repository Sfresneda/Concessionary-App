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
    
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var selectBrandButton: UIBarButtonItem!
    
    // MARK: - Contract Vars
    var presenter: CatalogListPresenterContract?
    
    // MARK: - Vars
    private var cellIdentifier = CarCellTableViewCell.reusableIdentifier
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter?.selectBrand()    }
    
    // MARK: - Setup
    func setupView() {
        
        self.selectBrandButton.title = "Select Brand"
        self.sortButton.title = "Sort"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = true
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: "CarCellTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: - Contract Methods
    func vc() -> UIViewController {
        return self
    }
    
    func reloadTableView() {
        if let brand = self.presenter?.getBrand() {
            self.title = brand.rawValue
        }
        
        // Scroll to top
        if 0 != self.tableView.numberOfRows(inSection: 0) {
            self.tableView.scrollToRow(at: IndexPath.init(row: 0, section: 0),
                                       at: .top,
                                       animated: true)
        }
        
        self.tableView.reloadData()
    }
    
    func updateSortButtonTitle(_ newTitle: String) {
        self.sortButton.title = newTitle
    }
    
    // MARK: - Actions
    @IBAction func sortButtonPressed(_ action: Any) {
        self.presenter?.sortButtonPressed()
    }
    @IBAction func selectBrandButtonPressed(_ action: Any){
        self.presenter?.selectBrand()
    }
}

extension CatalogListView: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Mandatory Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getCarsNumber() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier) as? CarCellTableViewCell,
            let wrappedPresenter = self.presenter,
            let car = wrappedPresenter.getCar(at: indexPath) else { return UITableViewCell.init() }
        
        cell.viewModel = CarCellViewModel.init(car: car)
        cell.setup()
        cell.separatorInset = .zero
        
        return cell
    }
    
    // MARK: - Optional Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.selectedItem(with: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    // Parallax cell effect
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let visibleCells = self.tableView.visibleCells as? [CarCellTableViewCell] {
            for parallaxCell in visibleCells {
                let yOffset = ((self.tableView.contentOffset.y - parallaxCell.frame.origin.y) / parallaxCell.bounds.height) * 15.0
                parallaxCell.offset(offset: CGPoint.init(x: 0, y: yOffset))
            }
        }
    }
}
