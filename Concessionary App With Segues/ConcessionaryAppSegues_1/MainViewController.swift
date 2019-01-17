//
//  ViewController.swift
//  CocessionaryAppSegues_1
//
//  Created by fresneda on 1/14/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, ConcessionaryProtocol, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Outlets
    @IBOutlet weak var sortButton: UIBarButtonItem!
    @IBOutlet weak var carsTableView: UITableView!

    
    // MARK: - Vars
    private var name: String!
    private var order: sortOrder = .desc
    
    var brand: brandEnum!
    var catalog: Array<Car>!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initData()
        self.setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewSegue" {
            if let vc = segue.destination as? DetailViewController {
                let indexpath = self.carsTableView.indexPathForSelectedRow
                vc.cardDetailData = self.catalog[indexpath!.row]
                vc.carBrand = self.brand
            }
        }
    }

    // MARK: - Setup
    private func initData() {
        self.brand = .volvo
        self.catalog = Array()
        
        let cars: Array<Car> = Array(
            arrayLiteral:
            Car.init(_name: "V60", _price: 30000),
            Car.init(_name: "V90", _price: 55000),
            Car.init(_name: "XC40", _price: 40000),
            Car.init(_name: "XC60", _price: 50000),
            Car.init(_name: "XC90", _price: 70000),
            Car.init(_name: "V40", _price: 26000)
        )
        
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

    // MARK: - ConcesionarieProtocol
    func setCar(_cars: Array<Car>) {
        _cars.forEach { (newCar) in
            self.catalog.append(newCar)
        }
    }
    
    func showCatalog() {
        print("--\(String(describing: self.name))'s Concessionary catalog, \(self.brand.rawValue) Concessionary--")
        self.catalog.forEach { (car) in
            car.description()
        }
        
    }
    func fillCatalog(_newCar: Car) {
        self.catalog.append(_newCar)
    }
    
    func sortCatalog(order: sortOrder) -> Array<Car> {
        return self.catalog.sorted{ (el1, el2) -> Bool in
            order == sortOrder.asc ? el1.price < el2.price : el1.price > el2.price
        }
    }

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
        self.performSegue(withIdentifier: "toDetailViewSegue", sender: nil)
    }
}

