//
//  CatalogDetailWireframe.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation
import UIKit

class CatalogDetailWireframe: CatalogDetailWireframeContract {
    
    // MARK: - Contract Vars
    weak var view: CatalogDetailView?
    
    // MARK: - Contract Methods
    func completeOrder() {
        self.showInfo(title: nil, content: "Your Order has been Successfully Completed")
    }
    
    func showFullScreen(model: Car) {
        let viewController = FullScreenViewController.init(_image: UIImage.init(named: model.imageNames.first!)!)
        viewController.modalPresentationStyle = .custom
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationCapturesStatusBarAppearance = true
        
        self.view?.present(viewController, animated: true, completion: nil)
    }
    func showInfo(title: String?, content: String?) {
        let viewController = InfoViewController.init(_title: nil, _content: "Your Order has been Successfully Completed")
        viewController.modalTransitionStyle = .crossDissolve
        viewController.modalPresentationStyle = .custom

        viewController.delegate = self
        
        self.view?.present(viewController, animated: true, completion: nil)
    }
}

extension CatalogDetailWireframe: infoViewDelegate {
    func dismiss() {
        self.view?.navigationController?.popViewController(animated: true)
    }
}
