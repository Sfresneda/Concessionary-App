//
//  DetailViewController.swift
//  CocessionaryAppSegues_1
//
//  Created by fresneda on 1/14/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var dataStack: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var carImageView: UIImageView!

    @IBOutlet weak var emptyDataLabel: UILabel!

    // MARK: - Vars
    var carBrand: brandEnum?
    var cardDetailData: Car?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let car = self.cardDetailData else { return }
        self.nameLabel.text = car.name
        self.priceLabel.text = "\(car.price)€"
        self.carImageView.image = UIImage.init(named: car.name.lowercased())
        self.carImageView.contentMode = .scaleAspectFill
        
        guard let brand = self.carBrand else { return }
        self.title = brand.rawValue.capitalized
        
        self.dataStack.alpha = 1
        self.emptyDataLabel.alpha = 0
    }

}
