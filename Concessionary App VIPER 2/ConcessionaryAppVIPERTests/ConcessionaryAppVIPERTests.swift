//
//  ConcessionaryAppVIPERTests.swift
//  ConcessionaryAppVIPERTests
//
//  Created by fresneda on 2/4/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import XCTest

@testable import ConcessionaryAppVIPER

class ConcessionaryAppVIPERTests: XCTestCase {
    
    var presenter: CatalogListPresenter!
    var interactor: CatalogListInteractor!
    var view: CatalogListView!
    /*
    let carsTestData: Dictionary<String, Double> = Dictionary(
        dictionaryLiteral:
        ("V60", 30000),
        ("V90", 55000),
        ("V40", 26000)
    )

    override func setUp() {
        self.view = CatalogListBuilder.build() as? CatalogListView
        self.interactor = self.view.presenter.interactor
        self.presenter = self.view.presenter
    }

    override func tearDown() { }

    // MARK: - Catalog List Presenter Test
    func test_presenter_setgetBrand() {
        self.presenter.setBrand(newBrand: .volvo)
        let brand = self.presenter.getBrand()
        XCTAssert(brand == .volvo)
    }
    
    func test_presenter_sync_setgetCatalog() {
        self.presenter.requestData(responseObject: Array())
        let emptyArray = self.presenter.entity.catalog
        XCTAssert(emptyArray.count == 0)
    }
    
    // MARK: - Catalog List View Test
    func test_view_titleView(){
        self.presenter.setBrand(newBrand: .volvo)
        self.view.reloadTableView()
        let title1 = self.view.title
        
        self.presenter.setBrand(newBrand: .audi)
        self.view.reloadTableView()
        let title2 = self.view.title
        
        XCTAssert(title1 != title2)
    }
    
    func test_view_numberOfCells(){
        let data = self.interactor.bindModels(carsData: self.carsTestData, brand: .volvo)
        self.presenter.requestData(responseObject: data)
        self.view.reloadTableView()
        let numberOfCells = self.view.tableView(self.view.tableView, numberOfRowsInSection: 0)

        XCTAssert(numberOfCells == self.carsTestData.count)
    }
    
    func test_view_sortASC(){
        self.interactor.getCatalogListRequest(cars: self.carsTestData) { (data) in
            self.presenter.requestData(responseObject: data)
            self.view.reloadTableView()
            self.presenter.sortButtonPressed(for: .asc)
            let cell = self.view.tableView.cellForRow(at: IndexPath.init(row: 0, section: 0)) as! CarCellTableViewCell
            XCTAssert(Double(cell.carPriceLabel.text!) == self.carsTestData.first?.value)
        }
    }*/
}
