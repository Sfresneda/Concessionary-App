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
    weak var view: CatalogListView?
    var presenter: CatalogListPresenter?
    
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
    
    func showError(localizedString: String) {
        let alert = UIAlertController.init(title: "Error", message: localizedString, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "Accept", style: .default, handler: nil))
    }
}

extension CatalogListWireframe: BrandPickerDelegate {
    
    // MARK: - Mandatory Methods
    func onDeinit(brand: BrandEnum) {
        self.presenter?.setBrand(newBrand: brand)
    }
}
