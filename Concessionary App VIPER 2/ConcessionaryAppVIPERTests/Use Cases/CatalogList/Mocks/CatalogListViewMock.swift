//
//  CatalogListViewMock.swift
//  ConcessionaryAppVIPERUITests
//
//  Created by Sergio Fresneda on 1/29/20.
//  Copyright © 2020 fresneda. All rights reserved.
//

import Foundation
import UIKit

@testable import ConcessionaryAppVIPER

class CatalogListViewMock: CatalogListViewContract {
    var presenter: CatalogListPresenterContract?
    
    var isCalledReloadTableView: Bool = false
    var isCalledUpdateSortButtonTitle: Bool = false
    var isCalledVC: Bool = false
    
    func reloadTableView() {
        self.isCalledReloadTableView = true
    }
    
    func updateSortButtonTitle(_ newTitle: String) {
        self.isCalledUpdateSortButtonTitle = true
    }
    
    func vc() -> UIViewController {
        self.isCalledVC = true
        return UIViewController.init()
    }
}
