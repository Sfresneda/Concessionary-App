//
//  CatalogListPresenterTests.swift
//  ConcessionaryAppVIPERTests
//
//  Created by Sergio Fresneda on 1/29/20.
//  Copyright © 2020 fresneda. All rights reserved.
//

import XCTest
@testable import ConcessionaryAppVIPER

class CatalogListPresenterTests: XCTestCase {
    var view: CatalogListViewMock!
    var interactor: CatalogListInteractorMock!
    var presenter: CatalogListPresenterContract!
    var entity: CatalogListEntity!
    var wireframe: CatalogListWireframeMock!
    
    override func setUp() {
        self.view = CatalogListViewMock.init()
        self.interactor = CatalogListInteractorMock.init()
        self.entity = CatalogListEntity.init()
        self.presenter = CatalogListPresenter.init(entity: self.entity)
        self.wireframe = CatalogListWireframeMock.init()
        
        self.view.presenter = self.presenter
        
        self.interactor.presenter = self.presenter
        
        self.presenter.view = self.view
        self.presenter.interactor = self.interactor
        self.presenter.wireframe = self.wireframe
        
        self.wireframe.presenter = self.presenter
    }

    override func tearDown() {
        self.view = nil
        self.interactor = nil
        self.presenter = nil
        self.entity = nil
        self.wireframe = nil
    }
    
    func test_loadCatalogList() {
        self.test_setBrand()
        self.presenter.loadCatalogList()
        
        XCTAssertTrue(self.wireframe.isCalledShowLoader)
        XCTAssertTrue(self.interactor.isCalledGetCatalogListRequest)
        XCTAssertTrue(self.wireframe.isCalledHideLoader)
        XCTAssertNotNil(self.presenter.getCar(at: IndexPath.init(row: 0, section: 0)))
    }
    
    func test_selectedItem() {
        self.test_loadCatalogList()
        
        self.presenter.selectedItem(with: IndexPath.init(row: 0, section: 0))
        XCTAssertTrue(self.wireframe.isCalledPushCarDetail)
    }
    
    func test_sortButtonPressed() {
        self.test_loadCatalogList()
        
        self.presenter.sortButtonPressed()
        
        XCTAssertTrue(self.view.isCalledUpdateSortButtonTitle)
        XCTAssertTrue(self.view.isCalledReloadTableView)
        
        let firstCar = self.presenter.getCar(at: IndexPath.init(row: 0, section: 0))
        XCTAssertNotNil(firstCar)
        
        self.presenter.sortButtonPressed()
        let secondCar = self.presenter.getCar(at: IndexPath.init(row: 0, section: 0))
        XCTAssertNotNil(secondCar)
        
        XCTAssertNotEqual(firstCar, secondCar)
    }
    
    func test_selectBrand() {
        self.presenter.selectBrand()
        
        XCTAssertTrue(self.wireframe.isCalledShowBrandPicker)
    }
    
    func test_setBrand() {
        self.presenter.setBrand(newBrand: .volvo)
        
        XCTAssertTrue(self.wireframe.isCalledShowLoader)
        XCTAssertTrue(self.wireframe.isCalledHideLoader)
    }
    
    func test_getBrand() {
        XCTAssertNil(self.presenter.getBrand())
        
        self.test_setBrand()
        XCTAssertNotNil(self.presenter.getBrand())
    }
    
    func test_getSort() {
        let nilSort: SortOrder? = self.presenter.getSort()
        XCTAssertNil(nilSort)
        self.test_loadCatalogList()
        self.test_sortButtonPressed()
        
        let notNilSort: SortOrder? = self.presenter.getSort()
        XCTAssertNotNil(notNilSort)
    }
    
    func test_getCar() {
        let nilCar: Car? = self.presenter.getCar(at: IndexPath.init(row: 0, section: 0))
        XCTAssertNil(nilCar)
        
        self.test_loadCatalogList()
        let notNilCar: Car? = self.presenter.getCar(at: IndexPath.init(row: 0, section: 0))
        XCTAssertNotNil(notNilCar)
    }
    
    func test_getCarsNumber() {
        let empty = self.presenter.getCarsNumber()
        XCTAssertEqual(empty, 0)
        
        self.test_loadCatalogList()
        let nonEmpty = self.presenter.getCarsNumber()
        XCTAssertGreaterThan(nonEmpty, 0)
    }
}
