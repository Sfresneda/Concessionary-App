//
//  CatalogModel.swift
//  ConcessionaryAppMVC
//
//  Created by fresneda on 1/20/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class CatalogModel: BaseViewModel, CatalogViewModel {

    // MARK: - ViewModel Protocol
    var brand: BrandEnum!
    var catalog: Array<Car>!
    var cellHeight: CGFloat! = 100.0
    
    func setCar(_cars: Array<Car>) {
        _cars.forEach { (newCar) in
            self.catalog.append(newCar)
        }
    }
    
    func fillCatalog(_newCar: Car) {
        self.catalog.append(_newCar)
    }
    
    func sortCatalog(order: sortOrder) -> Array<Car> {
        return self.catalog.sorted{ (el1, el2) -> Bool in
            self.catalogSortOrder == sortOrder.asc ? el1.price < el2.price : el1.price > el2.price
        }
    }
    
    func initData() {
        self.brand = .volvo
        self.catalog = Array()
        
        var cars: Array<Car> = Array()
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

    func getSortButtonTitle() -> String {
        return "Sort \(self.catalogSortOrder.rawValue)"
    }
    
    func toggleSortButton() {
        self.catalogSortOrder = self.catalogSortOrder == sortOrder.asc
            ? sortOrder.desc : sortOrder.asc
        
        self.catalog = self.sortCatalog(order: self.catalogSortOrder)
    }
    
    func generateCell(for indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell.init(style: .subtitle, reuseIdentifier: self.cellIdentifier)
        
        cell.textLabel?.text = "\(self.getCarName(_indexPath: indexPath)) - \(self.getFormatedCarPrice(_indexPath: indexPath))"
        cell.detailTextLabel?.text = self.brand.rawValue
        
        cell.imageView?.image = UIImage.init(named: self.getCarName(_indexPath: indexPath).lowercased())
        cell.imageView?.contentMode = .scaleAspectFill
        
        return cell
    }


    // MARK: - Vars
    private var order: sortOrder = .desc
    private let cellIdentifier: String = "CarCell"
    private let carsData: Dictionary<String, Double> = Dictionary(
        dictionaryLiteral:
        ("V60", 30000),
        ("V90", 55000),
        ("XC40", 40000),
        ("XC60", 50000),
        ("XC90", 70000),
        ("V40", 26000)
    )
    
    // MARK: - Helpers
    private var catalogSortOrder: sortOrder {
        get{
            return self.order
        }
        set(value) {
            self.order = value
        }
    }
    
    private func getCarName(_indexPath: IndexPath) -> String {
        return self.catalog[_indexPath.row].name
    }
    private func getFormatedCarPrice(_indexPath: IndexPath) -> String {
        return "\(self.catalog[_indexPath.row].price.formatWithoutDecimals)€"
    }
}
