//
//  NetworkProviderMock.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

struct NetworkProviderMock: NetworkProvider {
    private func loadJSON() throws -> Data {
        guard let path = Bundle.main.path(forResource: "Cars", ofType: "json") else {
            throw NSError(domain: "json file is not reachable", code: 141592)
        }

        return try Data(contentsOf: URL(fileURLWithPath: path))
    }

    func getCars(for brand: CarBrand) async throws -> [Car] {
        try JSONDecoder().decode([Car].self, from: loadJSON())
    }
}
