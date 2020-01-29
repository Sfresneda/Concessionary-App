//
//  FullScreenViewController.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 2/2/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var fullScreenImageView: UIImageView!
    
    @IBOutlet weak var closeButtonContainerView: UIView!
    @IBOutlet weak var closeButton: UIButton!
    
    // MARK: - Vars
    private let minZoom: CGFloat = 1.0
    private let maxZoom: CGFloat = 4.0
    private var image: UIImage!

    // MARK: - LifeCycle
    init(_image: UIImage) {
        super.init(nibName: "FullScreen", bundle: nil)
        self.image = _image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        self.scrollView.minimumZoomScale = self.minZoom
        self.scrollView.maximumZoomScale = self.maxZoom
        self.scrollView.showsHorizontalScrollIndicator = false
        self.scrollView.showsVerticalScrollIndicator = false
        
        self.fullScreenImageView.contentMode = .scaleAspectFit
        self.fullScreenImageView.image = self.image
     
        self.closeButtonContainerView.layer.cornerRadius = 6
        self.closeButtonContainerView.clipsToBounds = true
        self.closeButton.setTitle("Close", for: .normal)
        
        self.addCustomGestures()
    }
    
    // MARK: - Helper
    func addCustomGestures() {
        let doubleTapGesture = UITapGestureRecognizer.init(target: self, action: #selector(doubleTap))
        doubleTapGesture.numberOfTapsRequired = 2
        
        let toogleCloseViewGesture = UITapGestureRecognizer.init(target: self, action: #selector(toogleCloseView))
        toogleCloseViewGesture.numberOfTapsRequired = 1
        
        self.scrollView.addGestureRecognizer(doubleTapGesture)
        self.scrollView.addGestureRecognizer(toogleCloseViewGesture)
    }
        
    // MARK: - Actions
    @IBAction func closeButtonPressed(_ action: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func toogleCloseView() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                self.closeButtonContainerView.alpha = self.closeButtonContainerView.alpha == 0 ? 1 : 0
        }, completion: nil)
    }
    
    @objc func doubleTap() {
        if self.scrollView.zoomScale > 1 {
            self.scrollView.setZoomScale(self.minZoom, animated: true)
        }else {
            self.scrollView.setZoomScale(self.maxZoom, animated: true)
        }
    }
}

extension FullScreenViewController: UIScrollViewDelegate {

    // MARK: - Optional Methods
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.fullScreenImageView
    }
}
