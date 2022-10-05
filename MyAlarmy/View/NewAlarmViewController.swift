//
//  NewAlarmViewController.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/09/30.
//

import UIKit

class NewAlarmViewController: UIViewController {

    @IBOutlet weak var timeDifLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var addMissonButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addMissonButton.layer.cornerRadius = 10
        self.addMissonButton.layer.borderWidth = 1
        self.addMissonButton.layer.borderColor = UIColor.opaqueSeparator.cgColor
        
        let now = Date()
        let nextAlarm = Calendar.current.date(byAdding: .minute, value: 1, to: now)!
        self.datePicker.setDate(nextAlarm, animated: true)
        
        self.timeDifLabel.text = "1분"
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        self.timeDifLabel.text = calculateTimeDif(time: self.datePicker.date)
    }
    
    private func calculateTimeDif(time: Date) -> String{
        let format = DateFormatter()
        format.dateFormat = "HH시간 mm분"
        format.locale = Locale(identifier: "ko")
        let now = format.string(from: Date())
        let set = format.string(from: time)
        
        var dif = Int(format.date(from: set)!.timeIntervalSince(format.date(from: now)!))
        if dif < 0 {
            dif += 3600 * 24
        }
        let hour = dif/3600
        let min = (dif%3600) / 60
    
        return (hour > 0 ? ( min > 0 ?  "\(hour)시간 \(min)분" : "\(hour)시간") : (min == 0 ? "24시간" : "\(min)분"))
        
    }
    
    
    
}
