//
//  AlarmData.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/09/28.
//

import Foundation

struct Alarm: Hashable, Codable {
    var id: UUID = UUID()
    var time: String
}

extension Alarm {
    static var list = [
//        Alarm(time: "09:00"),
        Alarm(time: "19:40"),
        Alarm( time: "11:00"),
        Alarm(time: "18:00"),
        Alarm(time: "09:30"),
    ]
}

func save(_ alarms: [Alarm]) {
    let alarm = alarms.map { try? JSONEncoder().encode($0) }
    UserDefaults.standard.set(alarm, forKey: "alarmData")
}

//func load() -> [Alarm] {
//    guard let encodedData = UserDefaults.standard.array(forKey: "alarmData") as? [Alarm] else {
//        return []
//    }
//
//    return encodedData.map { try! JSONDecoder().decode(Alarm.self, from: $0) }
//}
