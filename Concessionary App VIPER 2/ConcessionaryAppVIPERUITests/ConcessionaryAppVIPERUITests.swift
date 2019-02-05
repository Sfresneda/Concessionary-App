//
//  ConcessionaryAppVIPERUITests.swift
//  ConcessionaryAppVIPERUITests
//
//  Created by fresneda on 2/4/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import XCTest

extension BrandEnum: CaseIterable{}
enum BrandEnum: String {
    case audi = "Audi"
    case mercedes = "Mercedes"
    case volvo = "Volvo"
}

class ConcessionaryAppVIPERUITests: XCTestCase {

    
    let tableViewLabel: String = "Cars TableView"
    let carCellLabel: String = "Car Cell"
    
    let selectBrandButtonLabel: String = "Select Brand Button"
    let sortCarsButtonLabel: String = "Sort Button"
    
    let acceptBrandButtonLabel: String = "Accept Brand Button"
    let brandPickerLabel: String = "Brand Picker"
    
    let k_load_timeout: Double = 3.5
    
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {}
    
    // MARK: - Catalog List Test
    func test_list_fillTableView(){
        let app = XCUIApplication()
        self.helper_fillTableView(app: app)
        
        let predicate = NSPredicate(format: "exists == true")
        let query = app.tables[self.tableViewLabel].cells[self.carCellLabel]
        self.helper_wait(for: query, with: predicate)
        
        XCTAssert(query.exists)
    }
    
    func test_list_fillTableViewAndCheckCell(){
        let app = XCUIApplication()
        self.helper_fillTableView(app: app)
        
        let predicate = NSPredicate(format: "exists == true")
        let query = app.tables[self.tableViewLabel].cells[self.carCellLabel].staticTexts["Audi V40"]
        self.helper_wait(for: query, with: predicate)

        XCTAssert(query.exists)
    }
    
    func test_list_fillTableViewWithAllBrands() {
        let app = XCUIApplication()
        var exist: [Bool] = Array()
        
        for brand in BrandEnum.allCases {
            self.helper_fillTableView(app: app, brandOption: brand.rawValue)
            
            let predicate = NSPredicate(format: "exists == true")
            let query = app.tables[self.tableViewLabel].cells[self.carCellLabel].staticTexts["\(brand.rawValue) V40"]
            self.helper_wait(for: query, with: predicate)
            
            if query.exists {
                exist.append(query.exists)
            }
        }
        XCTAssert(exist.filter{ value in value}.count == BrandEnum.allCases.count)
    }
   

    // MARK: - Helpers
    func helper_fillTableView(app: XCUIApplication, brandOption: String? = nil){
        app.buttons[self.selectBrandButtonLabel].tap()
        if let brand = brandOption {
            app.pickerWheels.element.adjust(toPickerWheelValue: brand)
        }
        app.buttons[self.acceptBrandButtonLabel].tap()
    }
    
    func helper_wait(for query: Any, with predicate: NSPredicate){
        expectation(for: predicate, evaluatedWith: query, handler: nil)
        waitForExpectations(timeout: self.k_load_timeout, handler: nil)
    }
}
