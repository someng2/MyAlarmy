//
//  AlarmStorage.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/10/04.
//

import Foundation

public class AlarmStorage {
    
    func persist(_ alarms: [Alarm]) {
        Storage.store(alarms, to: .documents, as: "alarm_list.json")
    }
    
    func fetch() -> [Alarm] {
        let list = Storage.retrive("alarm_list.json", from: .documents, as: [Alarm].self) ?? []
        return list
    }
}
