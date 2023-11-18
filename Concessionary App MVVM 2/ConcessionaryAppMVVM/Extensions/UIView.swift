//
//  UIView.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation
import UIKit

extension UIView {
    static func initForAutoLayout<T: UIView>() -> T {
        let view = Self.init(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false

        guard let newViewInstance = view as? T else {
            fatalError("unexpected behavior")
        }

        return newViewInstance
    }

    func addSubviews(_ views: UIView...) {
        views.forEach { view in
            self.addSubview(view)
        }
    }
}
