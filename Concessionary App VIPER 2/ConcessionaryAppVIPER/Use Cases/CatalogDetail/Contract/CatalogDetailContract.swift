//
//  CatalogDetailContract.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

protocol CatalogDetailPresenterContract: class {
    var interactor: CatalogDetailInteractor! { get set }
    var view: CatalogDetailView? { get set }
    var wireframe: CatalogDetailWireframe! { get set }
    
    func viewDidLoad()
    func orderNowButtonPressed()
    func dismissView()
}

protocol CatalogDetailInteractorContract: class {
    var presenter: CatalogDetailPresenter? { get set }
}

protocol CatalogDetailViewContract: class {
    var presenter: CatalogDetailPresenter! { get set }
    
    func setupView()
}

protocol CatalogDetailWireframeContract: class {
    var view: CatalogDetailView? { get set }
    
    func completeOrder()
}
