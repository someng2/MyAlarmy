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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    
}
