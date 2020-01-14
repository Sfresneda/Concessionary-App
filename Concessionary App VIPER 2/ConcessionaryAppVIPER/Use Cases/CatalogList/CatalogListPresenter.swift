//
//  CatalogListPresenter.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

class CatalogListPresenter: CatalogListPresenterContract {

    // MARK: - Vars
    weak var view: CatalogListView?
    var interactor: CatalogListInteractor?
    var entity: CatalogListEntity?
    var wireframe: CatalogListWireframe?

    
    // MARK: - Contract
    func loadCatalogList() {
        guard let wrappedBrand = self.entity?.brand else { return }
        self.wireframe?.showLoader()
        self.interactor?.getCatalogListRequest(brand: wrappedBrand,
                                               success: {
                                                self.entity?.catalog = $0
                                                self.wireframe?.hideLoader()
                                                self.view?.reloadTableView()
        },
                                               failure: {
                                                self.wireframe?.showError(localizedString: $0.localizedDescription)
        })
    }
    
    func selectedItem(with indexPath: IndexPath) {
        guard let wrappedEntity = self.entity else { return }
        self.wireframe?.pushCarDetail(car: wrappedEntity.catalog[indexPath.row])
    }
    
    func sortButtonPressed() {
        guard let wrappedEntity = self.entity,
            let wrappedSort = self.getSort() else { return }

        let newSort: SortOrder = wrappedSort == .asc ? .desc : .asc
        self.entity?.sortOrder = newSort
        self.entity?.catalog =
            wrappedEntity.catalog.sorted {
                (el1, el2) -> Bool in
                wrappedEntity.sortOrder == SortOrder.asc ?
                    el1.price < el2.price:
                    el1.price > el2.price
            }

        self.view?.updateSortButtonTitle(String(newSort.rawValue + " Sort"))
        self.view?.reloadTableView()
    }
    
    func requestData(responseObject: Array<Car>) {
        self.entity?.catalog = responseObject
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2),
                                      execute: {
                                        self.wireframe?.hideLoader()
                                        self.view?.reloadTableView()
                                        
        })
    }
    
    func selectBrand() {
        self.wireframe?.showBrandPicker()
    }
    
    func setBrand(newBrand: BrandEnum) {
        self.entity?.brand = newBrand
        self.loadCatalogList()
    }
    
    func getBrand() -> BrandEnum? {
        return self.entity?.brand
    }
    
    func getSort() -> SortOrder? {
        return self.entity?.sortOrder
    }
    
    func getCar(at indexPath: IndexPath) -> Car? {
        guard let wrappedEntity = self.entity else { return nil }
        return wrappedEntity.catalog[indexPath.row]
    }
    func getCarsNumber() -> Int {
        return self.entity?.catalog.count ?? 0
    }
}
