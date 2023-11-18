//
//  SortMode.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation

enum SortMode {
    case asc
    case desc

    func compare<T: Comparable>(_ lhs: T, _ rhs: T) -> Bool {
        switch self {
        case .asc :
            return lhs > rhs
        case .desc:
            return lhs < rhs
        }
    }
}
