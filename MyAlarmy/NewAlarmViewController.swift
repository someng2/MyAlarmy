//
//  NewAlarmViewController.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/09/30.
//

import UIKit

class NewAlarmViewController: UIViewController {

    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    
    @IBOutlet weak var addMissonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addMissonButton.layer.cornerRadius = 10
        self.addMissonButton.layer.borderWidth = 1
        self.addMissonButton.layer.borderColor = UIColor.opaqueSeparator.cgColor
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
}
