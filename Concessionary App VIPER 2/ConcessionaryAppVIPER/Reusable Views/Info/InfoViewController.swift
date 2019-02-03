//
//  InfoViewController.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 2/3/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

protocol infoViewDelegate {
    func dismiss()
}

class InfoViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var blurView: UIView!
    
    // MARK: - Vars
    private var infoTitle: String?
    private var infoContent: String?
    private var duration: Int!
    
    var delegate: infoViewDelegate?
    
    // MARK: - Cycle Life
    init(_title: String?, _content: String?, _duration: Int = 2) {
        super.init(nibName: "Info", bundle: nil)
        
        self.infoTitle = _title
        self.infoContent = _content
        self.duration = _duration
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = self.infoTitle ?? ""
        self.contentLabel.text = self.infoContent ?? ""
        
        self.blurView.layer.cornerRadius = 10
        self.blurView.clipsToBounds = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(self.duration), execute: {
            self.dismiss(animated: true, completion: {
                self.delegate?.dismiss()
            })
        })
    }
}
