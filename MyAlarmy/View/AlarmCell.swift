//
//  AlarmCell.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/09/28.
//

import UIKit

class AlarmCell: UICollectionViewCell {
    
    @IBOutlet weak var ampmLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func configure(_ alarm: Alarm) {
 
        let arr = alarm.time.split(separator: ":")
        let hour = Int(arr[0])!
        if hour > 12 {
            self.ampmLabel.text = "오후"
            print("before: \(alarm.time)")
            self.timeLabel.text = "\(hour-12):\(arr[1])"
        }
        else {
            self.ampmLabel.text = "오전"
            self.timeLabel.text = alarm.time
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 20
    }
    
}
