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
    weak var view: CatalogListViewContract?
    var interactor: CatalogListInteractorContract?
    var entity: CatalogListEntity!
    var wireframe: CatalogListWireframeContract?

    init(entity: CatalogListEntity) {
        self.entity = entity
    }
    
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
        self.wireframe?.pushCarDetail(car: self.entity.catalog[indexPath.row])
    }
    
    func sortButtonPressed() {
        let newSort: SortOrder = self.getSort() == .asc ? .desc : .asc
        self.entity.sortOrder = newSort
        self.entity.catalog =
            self.entity.catalog.sorted {
                (el1, el2) -> Bool in
                self.entity.sortOrder == SortOrder.asc ?
                    el1.price < el2.price:
                    el1.price > el2.price
            }

        self.view?.updateSortButtonTitle(String(newSort.rawValue + " Sort"))
        self.view?.reloadTableView()
    }
    
    func selectBrand() {
        self.wireframe?.showBrandPicker()
    }
    
    func setBrand(newBrand: BrandEnum) {
        self.entity.brand = newBrand
        self.loadCatalogList()
    }
    
    func getBrand() -> BrandEnum? {
        return self.entity.brand
    }
    
    func getSort() -> SortOrder? {
        return self.entity.sortOrder
    }
    
    func getCar(at indexPath: IndexPath) -> Car? {
        guard !self.entity.catalog.isEmpty else { return nil }
        return self.entity.catalog[indexPath.row]
    }
    func getCarsNumber() -> Int {
        return self.entity?.catalog.count ?? 0
    }
}
