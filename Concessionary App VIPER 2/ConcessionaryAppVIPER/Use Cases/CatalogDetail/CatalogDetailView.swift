//
//  CatalogDetailView.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import Foundation
import UIKit

class CatalogDetailView: UIViewController, CatalogDetailViewContract {
    
    // MARK: - Outlets
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    
    // MARK: - Contract Vars
    var presenter: CatalogDetailPresenter!
    
    // MARK: - Vars
    var viewModel: CatalogDetailEntity {
        return self.presenter.viewModel
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter.viewDidLoad()
        self.setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.viewModel.car.description()
    }
    
    // MARK: - Contract Methods
    func setupView() {
        guard let car = self.viewModel.car else {
            self.presenter.dismissView()
            return
        }
        
        self.title = "\(car.brand.rawValue) \(car.name)"
        self.carImageView.image = UIImage.init(named: car.imageNames.first!)
        self.carImageView.contentMode = .scaleAspectFill
        self.carImageView.clipsToBounds = true
        
        self.carName.text = "\(car.brand.rawValue) \(car.name)"
        
        self.orderButton.setTitle("Order now for \(car.price.formatWithoutDecimals)€", for: .normal)
        self.orderButton.layer.cornerRadius = 5
    }
    
    // MARK: - Actions
    @IBAction func orderButtonPressed(_ action: Any) {
        self.presenter.orderNowButtonPressed()
    }
    
    @IBAction func fullScreenButtonPressed(_ action: Any) {
        self.presenter.showFullScreen()
    }
}
