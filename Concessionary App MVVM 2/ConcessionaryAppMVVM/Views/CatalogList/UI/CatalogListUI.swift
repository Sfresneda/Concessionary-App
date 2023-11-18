//
//  CatalogListUI.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation
import UIKit

struct CatalogListUI {

    private(set) var tableView: UITableView = {
        let view: UITableView = .initForAutoLayout()
        return view
    }()

    private var toolBar: UIToolbar = {
        let view: UIToolbar = .initForAutoLayout()
        return view
    }()

    private var sortButton: UIBarButtonItem = {
        let view = UIBarButtonItem()
        return view
    }()

    private var selectBrandButton: UIBarButtonItem = {
        let view = UIBarButtonItem()
        return view
    }()

    @AutoActivateConstraints
    private var constraints: [NSLayoutConstraint]? = []

    var sortButtonAction: (() -> Void)?
    var selectBrandButtonAction: (() -> Void)?

}

extension CatalogListUI {
    mutating func buildUI(on view: UIView,
                          delegate: UITableViewDelegate? = nil) {
        setupView(view, delegate: delegate)

        view.addSubviews(tableView, toolBar)

        addConstraints(view)
    }
}

private extension CatalogListUI {
    func setupView(_ parentView: UIView, delegate: UITableViewDelegate?) {
        tableView.delegate = delegate

        sortButton.primaryAction = UIAction(title: "Sort") { _ in
            sortButtonHasBeenPressed()
        }

        selectBrandButton.primaryAction = UIAction(title: "Select Brand") { _ in
            selectBrandButtonHasBeenPressed()
        }

        toolBar.items = [
            sortButton,
            UIBarButtonItem(systemItem: .flexibleSpace),
            selectBrandButton
        ]
    }
    mutating func addConstraints(_ parentView: UIView) {
        let guide = parentView.safeAreaLayoutGuide

        constraints = [
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: parentView.topAnchor),
            guide.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),

            toolBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            toolBar.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            guide.trailingAnchor.constraint(equalTo: toolBar.trailingAnchor),
            guide.bottomAnchor.constraint(equalTo: toolBar.bottomAnchor)
        ]
    }
}

private extension CatalogListUI {
    func sortButtonHasBeenPressed() {
        sortButtonAction?()
    }

    func selectBrandButtonHasBeenPressed() {
        selectBrandButtonAction?()
    }
}
