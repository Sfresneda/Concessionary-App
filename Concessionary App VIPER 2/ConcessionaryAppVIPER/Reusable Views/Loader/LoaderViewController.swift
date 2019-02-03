//
//  LoaderViewController.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/31/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class LoaderViewController: UIViewController, CatalogListWireframeDelegate {

    // MARK: - Outlets
    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var activityLoader: UIActivity!
    
    // MARK: - Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.blurView.layer.cornerRadius = 10
        self.blurView.clipsToBounds = true
    }
    
    // MARK: - Helper
    func hideView() {
        self.dismiss(animated: true, completion: nil)
    }
}
