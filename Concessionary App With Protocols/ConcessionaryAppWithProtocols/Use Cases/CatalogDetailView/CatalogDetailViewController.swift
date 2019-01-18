//
//  CatalogDetailViewController.swift
//  ConcessionaryAppWithCoordinator
//
//  Created by fresneda on 1/17/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class CatalogDetailViewController: UIViewController, Storyboarded {

    // MARK: - Outlets
    @IBOutlet weak var dataStack: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!
    
    @IBOutlet weak var emptyDataLabel: UILabel!

    // MARK: - Vars
    weak var coordinator: MainCoordinator?
    var carBrand: brandEnum?
    var cardDetailData: Car?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let car = self.cardDetailData else { return }
        self.nameLabel.text = car.name
        self.priceLabel.text = "\(car.price)€"
        self.carImageView.contentMode = .scaleAspectFill
        self.retrieveImageAndAnimate(_image: car.images.first as? UIImage)
        
        guard let brand = self.carBrand else { return }
        self.title = brand.rawValue.capitalized
        
        self.dataStack.alpha = 1
        self.emptyDataLabel.alpha = 0
    }
    
    private func retrieveImageAndAnimate(_image: UIImage?) {
        guard let carImage = _image else { return }
        self.carImageView.image = carImage

        UIView.animate(withDuration: 0.5, delay: 0.3, options: .curveEaseIn, animations: {
            self.carImageView.alpha = 1
        }, completion: nil)
    }
}
