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
        let view = CatalogListView.init(nibName: String(describing: CatalogListView.self), bundle: nil)
        let entity = CatalogListEntity()
        let interactor = CatalogListInteractor()
        let presenter = CatalogListPresenter()
        let wireframe = CatalogListWireframe()
        
        view.presenter = presenter

        interactor.presenter = presenter

        presenter.view = view
        presenter.entity = entity
        presenter.interactor = interactor
        presenter.wireframe = wireframe

        wireframe.view = view
        wireframe.presenter = presenter
        
        return view
    }
}
