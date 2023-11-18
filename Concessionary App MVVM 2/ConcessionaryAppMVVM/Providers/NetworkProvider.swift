//
//  NetworkProvider.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

protocol NetworkProvider {
    func getCars(for brand: CarBrand) async throws -> [Car]
}
