//
//  CatalogListViewModel.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

final class CatalogListViewModel {
    private var repository: CatalogListRepositoryProtocol
    private var model: CatalogListModel
    weak var view: CatalogListViewProtocol?
    
    init(repository: CatalogListRepositoryProtocol,
         model: CatalogListModel = CatalogListModel(),
         view: CatalogListViewProtocol? = nil) {
        self.repository = repository
        self.model = model
        self.view = view
    }
}

extension CatalogListViewModel: CatalogListViewModelProtocol {
    func loadCatalogList() {
        Task { [weak self] in
            guard let self else { return }
            do {
                self.model.cars = try await self.repository.getCarsFor(brand: model.selectedBrand)
            } catch {
                // handle error
            }
        }
    }
    
    func sortItems() {
        model.cars.sort {
            model.sortMode.compare($0.price, $1.price)
        }
    }
    
    func selectedItem(with indexPath: IndexPath) {
        // do something
    }
    
    func showBrandSelector() {
        // do something
    }
    
    func setBrand(newBrand: CarBrand) {
        model.selectedBrand = newBrand
    }
}
