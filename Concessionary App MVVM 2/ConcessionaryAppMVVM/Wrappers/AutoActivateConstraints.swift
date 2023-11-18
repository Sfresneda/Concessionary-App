//
//  AutoActivateConstraints.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation
import UIKit

@propertyWrapper
struct AutoActivateConstraints {
    private var constraints: [NSLayoutConstraint]?

    var wrappedValue: [NSLayoutConstraint]? {
        get {
            return constraints
        }
        set {
            constraints?.forEach { $0.isActive = false }
            constraints = newValue
            constraints?.forEach { $0.isActive = true }
        }
    }

    init(wrappedValue: [NSLayoutConstraint]?) {
        self.constraints = wrappedValue
    }
}

