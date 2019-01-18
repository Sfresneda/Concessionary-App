//
//  ViewController.swift
//  ConcessionaryAppWithProtocols
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController, Concessionary, Storyboarded {
    // MARK: - Outlets
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var carsTableView: UITableView!
    
    // MARK: - Vars
    private var name: String!
    private var order: sortOrder = .desc
   
    weak var coordinator: MainCoordinator?

    var brand: brandEnum!
    var catalog: Array<Car>!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initData()
        self.setupTableView()
    }
    
    // MARK: - Setup
    private func initData() {
        self.brand = .volvo
        self.catalog = Array()
        
        var cars: Array<Car> = Array()
        let carsData: Dictionary<String, Double> = Dictionary(
            dictionaryLiteral:
            ("V60", 30000),
            ("V90", 55000),
            ("XC40", 40000),
            ("XC60", 50000),
            ("XC90", 70000),
            ("V40", 26000)
        )
        
        for (name, price) in carsData {
            cars.append(
                Car.init(
                    _name: name,
                    _price: price,
                    _images: Array.init(
                        arrayLiteral: UIImage.init(named: name.lowercased())
                ))
            )
        }
        
        cars.forEach { (car) in
            self.fillCatalog(_newCar: car)
        }
    }
    
    private func setupTableView() {
        self.carsTableView.delegate = self
        self.carsTableView.dataSource = self
        
        self.carsTableView.tableFooterView = UIView()
        
        self.carsTableView.reloadData()
    }
    
    // MARK: - Actions
    @IBAction func sortList(_ action: Any){
        self.sortButton.title = "Sort \(self.order.rawValue)"
        
        self.order = self.order == sortOrder.asc ? sortOrder.desc : sortOrder.asc
        self.catalog = self.sortCatalog(order: self.order)
        for (index, _) in self.catalog.enumerated(){
            self.carsTableView.reloadRows(at: [IndexPath.init(row: index, section: 0)], with: UITableView.RowAnimation.left)
        }
    }
    
    // MARK: - ConcessionaryProtocol
    func setCar(_cars: Array<Car>) {
        _cars.forEach { (newCar) in
            self.catalog.append(newCar)
        }
    }
    
    func showCatalog() {}
    
    func fillCatalog(_newCar: Car) {
        self.catalog.append(_newCar)
    }
    
    func sortCatalog(order: sortOrder) -> Array<Car> {
        return self.catalog.sorted{ (el1, el2) -> Bool in
            order == sortOrder.asc ? el1.price < el2.price : el1.price > el2.price
        }
    }
}

extension CatalogViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: - MANDATORY METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.catalog.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "CarCell")
        cell.textLabel?.text = "\(self.catalog[indexPath.row].name) - \(self.catalog[indexPath.row].price)€"
        cell.detailTextLabel?.text = self.brand.rawValue
        cell.imageView?.image = UIImage.init(named: self.catalog[indexPath.row].name.lowercased())
        cell.imageView?.contentMode = .scaleAspectFill
        
        return cell
    }
    
    // MARK: - OPTIONAL METHODS
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.init(100.0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.coordinator?.viewDetail(_carData: self.catalog[indexPath.row], _brand: self.brand)
    }
}
