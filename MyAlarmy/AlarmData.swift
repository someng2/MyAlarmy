//
//  AlarmData.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/09/28.
//

import Foundation

struct Alarm: Hashable {
    let ampm: String
    let time: String
}

extension Alarm {
    static let list = [
        Alarm(ampm: "오전", time: "9:00"),
        Alarm(ampm: "오전", time: "10:00"),
        Alarm(ampm: "오전", time: "11:00"),
        Alarm(ampm: "오후", time: "6:00"),
        Alarm(ampm: "오전", time: "9:30"),
    ]
}
