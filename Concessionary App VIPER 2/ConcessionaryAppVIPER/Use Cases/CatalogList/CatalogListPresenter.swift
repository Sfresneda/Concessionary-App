//
//  CatalogListPresenter.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

class CatalogListPresenter: CatalogListPresenterContract {
    
    // MARK: - Contract Vars
    var interactor: CatalogListInteractor!
    weak var view: CatalogListView?
    var wireframe: CatalogListWireframe!

    // MARK: - Vars
    var viewModel = CatalogListEntity()
    
    // MARK: - Contract Methods
    func loadCatalogList() {
        self.wireframe.showLoader()
        self.interactor.getCatalogListRequest(completion: { cars in
            self.requestData(responseObject: cars)
        })
    }
    
    func selectedItem(with indexPath: IndexPath) {
        self.wireframe.pushCarDetail(car: self.viewModel.catalog[indexPath.row])
    }
    
    func sortButtonPressed() {
        guard let _ = self.getBrand() else { return }
        self.viewModel.catalog =
            self.viewModel.catalog.sorted {
                (el1, el2) -> Bool in
                self.viewModel.sortOrder == SortOrder.asc ? el1.price < el2.price : el1.price > el2.price
            }

        self.viewModel.sortOrder = self.viewModel.sortOrder == SortOrder.asc ? SortOrder.desc : SortOrder.asc
        self.view?.updateSortButtonTitle()
        self.view?.refreshTableView()
    }
    
    func requestData(responseObject: Array<Car>) {
        self.viewModel.catalog = responseObject
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.wireframe.hideLoader()
            self.view?.refreshTableView()
        })
    }
    
    func selectBrand() {
        self.wireframe.showBrandPicker()
    }
    
    func setBrand(newBrand: BrandEnum) {
        self.viewModel.brand = newBrand
        self.loadCatalogList()
    }
    
    func getBrand() -> BrandEnum? {
        return self.viewModel.brand
    }
}
