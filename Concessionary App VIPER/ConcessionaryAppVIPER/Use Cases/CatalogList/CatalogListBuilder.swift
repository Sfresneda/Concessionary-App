//
//  CatalogListBuilder.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation
import UIKit

class CatalogListBuilder {
    
    // MARK: - Setup
    static func build() -> UIViewController {
        let viewController = CatalogListView.init(nibName: String(describing: CatalogListView.self), bundle: nil)
        let interactor = CatalogListInteractor()
        let presenter = CatalogListPresenter()
        let wireframe = CatalogListWireframe()
        
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = wireframe
        wireframe.view = viewController
        
        // help to force view load (avoid ex. nil on outlets)
        _ = viewController.view
        
        return viewController
    }
}
