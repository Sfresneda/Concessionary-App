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
        self.interactor.getCatalogListRequest()
    }
    
    func selectedItem(with indexPath: IndexPath) {
        self.wireframe.pushCarDetail(car: self.viewModel.catalog[indexPath.row])
    }
    
    func sortButtonPressed() {
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
        self.view?.refreshTableView()
    }
}
