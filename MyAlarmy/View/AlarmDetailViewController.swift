//
//  AlarmDetailViewController.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/10/04.
//

import UIKit
import Combine

class AlarmDetailViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    
    var subscriptions = Set<AnyCancellable>()
    var viewModel: AlarmDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    private func bind() {
        viewModel.alarm
            .receive(on: RunLoop.main)
            .sink { [unowned self] alarm in
                let format = DateFormatter()
                format.dateFormat = "HH:mm"
                self.datePicker.setDate(format.date(from: alarm.time)!, animated: true)
            }.store(in: &subscriptions)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
}
