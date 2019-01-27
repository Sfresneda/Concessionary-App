//
//  Double.swift
//  ConcessionaryAppMVC
//
//  Created by fresneda on 1/20/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation

extension Double {
    
    var formatWithTwoDecimals: String {
        return self.toStringWith("%.2f")
    }
    
    var formatWithoutDecimals: String {
        return self.toStringWith("%.0f")
    }
    
    private func toStringWith(_ format: String) -> String {
        return String.init(format: format, self as CVarArg)
    }
}
