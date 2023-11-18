//
//  CatalogListRepository.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

final class CatalogListRepository {
    private var networkProvider: NetworkProvider

    init(networkProvider: NetworkProvider = NetworkProviderMock()) {
        self.networkProvider = networkProvider
    }
}
extension CatalogListRepository: CatalogListRepositoryProtocol {
    func getCarsFor(brand: CarBrand) async throws -> [Car] {
        try await networkProvider.getCars(for: brand)
    }
}
