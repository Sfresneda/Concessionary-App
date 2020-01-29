//
//  CatalogListWireframeMock.swift
//  ConcessionaryAppVIPERTests
//
//  Created by Sergio Fresneda on 1/29/20.
//  Copyright © 2020 fresneda. All rights reserved.
//

import Foundation

@testable import ConcessionaryAppVIPER

class CatalogListWireframeMock: CatalogListWireframeContract {
    var view: CatalogListViewContract?
    var presenter: CatalogListPresenterContract?
    
    var isCalledPushCarDetail: Bool = false
    var isCalledShowBrandPicker: Bool = false
    var isCalledShowLoader: Bool = false
    var isCalledHideLoader: Bool = false
    var isCalledShowError: Bool = false
    
    func pushCarDetail(car: Car) {
        self.isCalledPushCarDetail = true
    }
    
    func showBrandPicker() {
        self.isCalledShowBrandPicker = true
    }
    
    func showLoader() {
        self.isCalledShowLoader = true
    }
    
    func hideLoader() {
        self.isCalledHideLoader = true
    }
    
    func showError(localizedString: String) {
        self.isCalledShowError = true
    }
}
