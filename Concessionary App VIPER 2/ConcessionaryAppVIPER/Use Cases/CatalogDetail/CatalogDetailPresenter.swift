//
//  CatalogDetailPresenter.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

class CatalogDetailPresenter: CatalogDetailPresenterContract {
    // MARK: - Contract Vars
    var interactor: CatalogDetailInteractor!
    weak var view: CatalogDetailView?
    var wireframe: CatalogDetailWireframe!

    // MARK: - Vars
    var car: Car?
    var viewModel = CatalogDetailEntity()
    
    // MARK: - Contract Methods
    func viewDidLoad() {
        self.viewModel.car = self.car
    }

    func orderNowButtonPressed() {
        self.wireframe.completeOrder()
    }
    
    func dismissView() {
        self.wireframe.completeOrder()
    }
}
