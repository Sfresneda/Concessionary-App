//
//  MainCoordinator.swift
//  ConcessionaryAppWithCoordinator
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    var children: [Coordinator] = [Coordinator]()
    
    init(_navigationController: UINavigationController) {
        self.navigationController = _navigationController
    }
    
    func start() {
        let vc = CatalogViewController.instantiate()
        vc.model = CatalogViewModel()
        vc.model?.coordinator = self
        
        self.navigationController.navigationBar.prefersLargeTitles = true
        
        self.navigationController.pushViewController(vc, animated: false)
    }
    
    func viewDetail(_carData: Car, _brand: BrandEnum) {
        let vc = CatalogDetailViewController.instantiate()
        vc.model = CatalogDetailViewModel()
        vc.model?.coordinator = self
        
        guard let detailModel = vc.model as? CatalogDetailViewModel else { return }
        detailModel.car = _carData
        detailModel.brand = _brand
        
        self.navigationController.pushViewController(vc, animated: true)
    }
    
}
