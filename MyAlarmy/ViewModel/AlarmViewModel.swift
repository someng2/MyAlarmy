//
//  AlarmViewModel.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/10/04.
//

import Foundation
import Combine

final class AlarmViewModel: ObservableObject {

//    let storage: AlarmStorage
    
    var subscriptions = Set<AnyCancellable>()
    
    let alarms: CurrentValueSubject<[Alarm], Never>
    let selectedAlarm: CurrentValueSubject<Alarm?, Never>
    
//    let didSelect = PassthroughSubject<Alarm, Never>()
    
    init(alarms: [Alarm], selectedAlarm: Alarm? = nil) {
        self.alarms = CurrentValueSubject(alarms)
        self.selectedAlarm = CurrentValueSubject(selectedAlarm)
    }
    
    func didSelect(at indexPath: IndexPath) {
        let alarm = alarms.value[indexPath.item]
        selectedAlarm.send(alarm)
    }

//    func persist(alarms: [Alarm]) {
//        guard alarms.isEmpty == false else { return }
//        self.storage.persist(alarms)
//    }

//    func fetch() {
//        self.list = storage.fetch()
//    }
}
