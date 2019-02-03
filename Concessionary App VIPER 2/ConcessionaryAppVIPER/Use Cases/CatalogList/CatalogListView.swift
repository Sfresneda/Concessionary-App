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
    }
    
    // MARK: - Contract Methods
    func setupView() {
        
        self.selectBrandButton.title = "Select Brand"
        self.sortButton.title = "Sort"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = true
        self.tableView.tableFooterView = UIView()
        self.tableView.register(UINib.init(nibName: "CarCellTableViewCell", bundle: nil), forCellReuseIdentifier: self.cellIdentifier)
    }
    
    func refreshTableView() {
        if let brand = self.presenter.getBrand() {
            self.title = brand.rawValue
        }
        
        // Scroll to top
        self.tableView.setContentOffset(CGPoint.init(x: 0, y: -1), animated: true)
        self.tableView.reloadData()
    }
    
    func updateSortButtonTitle(){
        self.sortButton.title = "\(self.viewModel.sortOrder.rawValue) Sort"
    }
    
    // MARK: - Actions
    @IBAction func sortButtonPressed(_ action: Any) {
        self.presenter.sortButtonPressed()
    }
    @IBAction func selectBrandButtonPressed(_ action: Any){
        self.presenter.selectBrand()
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
        
        cell.separatorInset = .zero
        
        return cell
    }
    
    // MARK: - Optional Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.selectedItem(with: indexPath)
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
