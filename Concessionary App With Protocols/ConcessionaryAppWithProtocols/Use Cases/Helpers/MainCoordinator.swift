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
        vc.coordinator = self
        
        navigationController.pushViewController(vc, animated: false)
    }
    
    func viewDetail(_carData: Car, _brand: brandEnum) {
        let vc = CatalogDetailViewController.instantiate()
        vc.coordinator = self
        vc.cardDetailData = _carData
        vc.carBrand = _brand
        navigationController.pushViewController(vc, animated: true)
    }
    
}
