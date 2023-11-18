//
//  CatalogListView.swift
//  ConcessionaryAppMVVM
//
//  Created by Sergio Fresneda on 18/11/23.
//

import Foundation
import UIKit

final class CatalogListView<DataSourceModel: Hashable>: UIViewController {

    private var ui: CatalogListUI

    private var snapshot = NSDiffableDataSourceSnapshot<String, DataSourceModel>()
    private lazy var dataSource: UITableViewDiffableDataSource<String, DataSourceModel> = {
        UITableViewDiffableDataSource<String, DataSourceModel>(
            tableView: ui.tableView,
            cellProvider: { (tableView, indexPath, car) -> UITableViewCell? in
                let cell = tableView.dequeueReusableCell(withIdentifier: "CarCell", for: indexPath)
                //                cell.configure(with: car)
                return cell
            }
        )
    }()

    var viewModel: CatalogListViewModelProtocol!

    init(ui: CatalogListUI) {
        self.ui = ui
        super.init(nibName: nil, bundle: nil)
    }

    convenience init() {
        let ui = CatalogListUI()
        self.init(ui: ui)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        viewModel?.loadCatalogList()
    }
}

private extension CatalogListView {
    func setupView() {
        ui.selectBrandButtonAction = { [weak self] in
            self?.viewModel?.showBrandSelector()
        }
        ui.sortButtonAction = { [weak self] in
            self?.viewModel?.sortItems()
        }
        ui.buildUI(on: view,
                   delegate: nil)
    }
}

extension CatalogListView: CatalogListViewProtocol {}
