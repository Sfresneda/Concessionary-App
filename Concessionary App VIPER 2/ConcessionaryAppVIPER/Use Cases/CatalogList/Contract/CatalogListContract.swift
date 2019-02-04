//
//  CatalogListContract.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

// MARK: - Presenter
protocol CatalogListPresenterContract: class {
    var interactor: CatalogListInteractor! { get set }
    var view: CatalogListView? { get set }
    var wireframe: CatalogListWireframe! { get set }
    
    func loadCatalogList()
    func requestData(responseObject: Array<Car>)
    
    func sortButtonPressed(for state: SortOrder)
    func selectedItem(with indexPath: IndexPath)
    
    func selectBrand()
    func setBrand(newBrand: BrandEnum)
    func getBrand() -> BrandEnum?
}

// MARK: - Interactor
protocol CatalogListInteractorContract: class {
    var presenter: CatalogListPresenter? { get set }
    
    func getCatalogListRequest(cars: Dictionary<String, Double>?, completion: (Array<Car>) -> Void)
}

// MARK: - View
protocol CatalogListViewContract: class {
    var presenter: CatalogListPresenter! { get set }
    
    func setupView()
    func refreshTableView()
    func updateSortButtonTitle()
}

// MARK: - Wireframe
protocol CatalogListWireframeContract: class {
    var view: CatalogListView? { get set }
    
    func pushCarDetail(car: Car)
    func showBrandPicker()
    func showLoader()
    func hideLoader()
}
