//
//  CatalogDetailViewController.swift
//  ConcessionaryAppWithCoordinator
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class CatalogDetailViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var dataStack: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var emptyDataLabel: UILabel!

    // MARK: - Model
    var viewModel: CatalogDetailViewModel {
        get{
            return self.model as! CatalogDetailViewModel
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.retrieveImageAndAnimate()
    }
    
    // MARK: - Setup
    private func setupView(){
        if self.viewModel.isReachableCarData {
            self.nameLabel.text = self.viewModel.carName
            self.priceLabel.text = self.viewModel.carPrice
            self.title = "\(self.viewModel.brandName) \(self.viewModel.carName)"
            self.dataStack.alpha = 1
            self.emptyDataLabel.alpha = 0
        }
        
        self.emptyDataLabel.text = self.viewModel.emptyText
    }
    
    private func retrieveImageAndAnimate() {
        self.carImageView.contentMode = .scaleAspectFill
        self.carImageView.image = self.viewModel.carImage

        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseIn, animations: {
            self.carImageView.alpha = 1
        }, completion: nil)
    }
}
