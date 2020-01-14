//
//  CarCellTableViewCell.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/29/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class CarCellTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var carImageView: UIImageView!
    @IBOutlet weak var carNameLabel: UILabel!
    @IBOutlet weak var carPriceLabel: UILabel!
    
    // MARK: - Vars
    var viewModel: CarCellViewModel?
    
    static var reusableIdentifier: String {
        return CarCellTableViewCell.description()
    }
    
    // MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Setup
    func setup() {
        guard let vm = self.viewModel else { return }
        self.carImageView.image = UIImage.init(named: vm.carImage)
        self.carImageView.contentMode = .scaleToFill
        
        self.carNameLabel.text = vm.carName
        self.carPriceLabel.text = vm.carPrice
    }
    
    // MARK: - Helper
    func offset(offset: CGPoint) {
        self.carImageView.frame = CGRect.init(x: offset.x, y: offset.y, width: self.carImageView.bounds.width, height: self.carImageView.bounds.height)
    }
}
