//
//  CatalogListWireframe.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation
import UIKit

protocol CatalogListWireframeDelegate {
    func hideView()
}

class CatalogListWireframe: CatalogListWireframeContract {
    
    // MARK: - Vars
    var delegate: CatalogListWireframeDelegate?
    
    // MARK: - Contract Vars
    weak var view: CatalogListView?
    
    // MARK: - Contract Methods
    func pushCarDetail(car: Car) {
        let viewController = CatalogDetailBuilder.build(with: car)
        self.view?.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func showBrandPicker() {
        let viewController = BrandPickerViewController.init(nibName: "BrandPicker", bundle: nil)
        viewController.modalPresentationStyle = .custom
        viewController.modalTransitionStyle = .crossDissolve
        viewController.delegate = self
        self.view?.present(viewController, animated: true, completion: nil)
    }
    
    func showLoader() {
        let viewController = LoaderViewController.init(nibName: "Loader", bundle: nil)
        viewController.modalPresentationStyle = .custom
        viewController.modalTransitionStyle = .crossDissolve
        self.delegate = viewController.self
        self.view?.present(viewController, animated: true, completion: nil)
    }
    
    func hideLoader() {
        self.delegate?.hideView()
    }
}

extension CatalogListWireframe: BrandPickerDelegate {
    
    // MARK: - Mandatory Methods
    func onDeinit(brand: BrandEnum) {
        self.view?.presenter.setBrand(newBrand: brand)
    }
}
