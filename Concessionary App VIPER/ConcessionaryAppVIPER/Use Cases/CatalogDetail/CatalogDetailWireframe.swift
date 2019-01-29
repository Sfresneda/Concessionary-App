//
//  CatalogDetailWireframe.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

class CatalogDetailWireframe: CatalogDetailWireframeContract {
    
    // MARK: - Contract Vars
    weak var view: CatalogDetailView?
    
    // MARK: - Contract Methods
    func completeOrder() {
        self.view?.navigationController?.popViewController(animated: true)
    }
}
