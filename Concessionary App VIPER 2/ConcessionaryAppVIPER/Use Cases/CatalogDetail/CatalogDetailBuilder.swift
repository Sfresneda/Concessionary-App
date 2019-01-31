//
//  CatalogDetailBuilder.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation
import UIKit

class CatalogDetailBuilder {
    
    // MARK: - Setup
    static func build(with car: Car) -> UIViewController {
        let viewController = CatalogDetailView.init(nibName: String(describing: CatalogDetailView.self), bundle: nil)
        let interactor = CatalogDetailInteractor()
        let presenter = CatalogDetailPresenter()
        let wireframe = CatalogDetailWireframe()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        presenter.car = car
        wireframe.view = viewController
        
        // help to force view load (avoid ex. nil on outlets)
        _ = viewController.view
        
        return viewController
    }
}
