//
//  AlarmData.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/09/28.
//

import Foundation

struct Alarm: Hashable, Codable {
    var id: UUID = UUID()
    let time: String
}

extension Alarm {
    private var dateComponent: DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        
        let date = formatter.date(from: self.time) ?? Date()
        let dc = calendar.dateComponents([.hour, .minute], from: date)
        return dc
    }
    
    var monthlyIdentifier: String {
        return "\(dateComponent.hour!)-\(dateComponent.minute!)"
    }
}

extension Alarm {
    static let list = [
        Alarm(time: "09:00"),
        Alarm(time: "19:40"),
        Alarm( time: "11:00"),
        Alarm(time: "18:00"),
        Alarm(time: "09:30"),
    ]
}
