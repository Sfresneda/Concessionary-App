//
//  CatalogListWireframe.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

class CatalogListWireframe: CatalogListWireframeContract {
    
    // MARK: - Contract Vars
    weak var view: CatalogListView?
    
    // MARK: - Contract Methods
    func pushCarDetail(car: Car) {
        let viewController = CatalogDetailBuilder.build(with: car)
        self.view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
