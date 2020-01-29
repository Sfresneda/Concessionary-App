//
//  CatalogListContract.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Presenter
protocol CatalogListPresenterContract: class {
    var view: CatalogListViewContract? { get set }
    var interactor: CatalogListInteractorContract? { get set }
    var wireframe: CatalogListWireframeContract? { get set }
    
    func loadCatalogList()
    
    func sortButtonPressed()
    func selectedItem(with indexPath: IndexPath)
    
    func selectBrand()
    func setBrand(newBrand: BrandEnum)
    func getBrand() -> BrandEnum?
    
    func getSort() -> SortOrder?
    
    func getCar(at indexPath: IndexPath) -> Car?
    func getCarsNumber() -> Int
}

// MARK: - Interactor
protocol CatalogListInteractorContract: class {
    var presenter: CatalogListPresenterContract? { get set }
    
    func getCatalogListRequest(brand: BrandEnum, success: ((Cars) -> Void), failure: ((Error) -> Void))
}

// MARK: - View
protocol CatalogListViewContract: class {
    var presenter: CatalogListPresenterContract? { get set }
    
    func vc() -> UIViewController
    func reloadTableView()
    func updateSortButtonTitle(_ newTitle: String)
}

// MARK: - Wireframe
protocol CatalogListWireframeContract: class {
    var view: CatalogListViewContract? { get set }
    var presenter: CatalogListPresenterContract? { get set }
    
    func pushCarDetail(car: Car)
    func showBrandPicker()
    func showLoader()
    func hideLoader()
    func showError(localizedString: String)
}
