//
//  AlarmStorage.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/10/04.
//

import Foundation

public class AlarmStorage {
    
    func persist(_ items: [Alarm]) {
        Storage.store(items, to: .documents, as: "alarm_list.json")
    }
    
    func fetch() -> [Alarm] {
        let list = Storage.retrive("alarm_list.json", from: .documents, as: [Alarm].self) ?? []
        return list
    }
}
