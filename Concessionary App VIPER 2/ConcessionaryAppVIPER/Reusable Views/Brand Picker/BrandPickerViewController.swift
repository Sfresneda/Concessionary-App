//
//  BrandPickerViewController.swift
//  ConcessionaryAppVIPER
//
//  Created by fresneda on 1/30/19.
//  Copyright © 2019 fresneda. All rights reserved.
//

import UIKit

protocol BrandPickerDelegate {
    func onDeinit(brand: BrandEnum)
}

class BrandPickerViewController: UIViewController {

    @IBOutlet weak var alertWindow: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var brandPicker: UIPickerView!
    @IBOutlet weak var acceptButton: UIButton!
    
    var delegate: BrandPickerDelegate?
    private let pickerOptions = BrandEnum.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.alertWindow.layer.cornerRadius = 10
        self.alertWindow.clipsToBounds = true
        
        self.brandPicker.delegate = self
        self.brandPicker.dataSource = self
        
        self.titleLabel.text = "Select Brand"
        
        self.acceptButton.setTitle("Select", for: .normal)
    }
    
    @IBAction func buttonPressed(_ action: Any) {
        self.dismiss(animated: true, completion: {
            #if DEBUG
            print("dismiss")
            #endif
        })
    }
    
    deinit {
        self.delegate?.onDeinit(brand: BrandEnum.allCases[self.brandPicker.selectedRow(inComponent: 0)])
        #if DEBUG
        print("deinit")
        #endif
    }
}

extension BrandPickerViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerOptions.count-1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerOptions[row].rawValue
    }
}
