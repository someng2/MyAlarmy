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
        self.ampmLabel.text = alarm.ampm
        self.timeLabel.text = alarm.time
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.masksToBounds = true
        layer.cornerRadius = 20
    }
    
}
