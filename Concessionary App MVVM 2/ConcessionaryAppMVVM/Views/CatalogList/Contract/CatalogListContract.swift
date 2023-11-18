//
//  CatalogListContract.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation
import UIKit

protocol CatalogListViewProtocol: AnyObject {
    var viewModel: CatalogListViewModelProtocol! { get }
}
protocol CatalogListViewModelProtocol {
    var view: CatalogListViewProtocol? { get }

    func loadCatalogList()

    func sortItems()
    func selectedItem(with indexPath: IndexPath)

    func showBrandSelector()
    func setBrand(newBrand: CarBrand)
}
protocol CatalogListRepositoryProtocol {
    func getCarsFor(brand: CarBrand) async throws -> [Car]
}
