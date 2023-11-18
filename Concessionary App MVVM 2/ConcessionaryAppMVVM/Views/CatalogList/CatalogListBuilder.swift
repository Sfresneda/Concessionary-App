//
//  CatalogListBuilder.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

final class CatalogListBuilder {
    static func buildCarList() -> CatalogListView<Car> {
        let repository = CatalogListRepository()
        let view: CatalogListView<Car> = CatalogListView()
        let viewModel = CatalogListViewModel(repository: repository, view: view)

        view.viewModel = viewModel

        return view
    }
}
