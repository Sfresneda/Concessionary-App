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
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var carPrice: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.carImage.contentMode = .scaleToFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    // MARK: - Helper
    func offset(offset: CGPoint) {
        self.carImage.frame = CGRect.init(x: offset.x, y: offset.y, width: self.carImage.bounds.width, height: self.carImage.bounds.height)
    }
}
