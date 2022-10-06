//
//  AlarmViewModel.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/10/04.
//

import Foundation
import Combine

final class AlarmViewModel: ObservableObject {
    
    let storage: AlarmStorage
    
//    let alarms: CurrentValueSubject<[Alarm], Never>
    @Published var alarms: [Alarm] = []
    let selectedAlarm: CurrentValueSubject<Alarm?, Never>
    var subscriptions = Set<AnyCancellable>()
    
//    init(alarms: [Alarm] = Alarm.list, selectedAlarm: Alarm? = nil) {
    init(storage: AlarmStorage, selectedAlarm: Alarm? = nil) {
//        self.alarms = CurrentValueSubject(alarms)
        self.storage = storage
        self.selectedAlarm = CurrentValueSubject(selectedAlarm)
        bind()
        fetch()
    }
    
    private func bind() {
        $alarms.sink { alarms in
            let new = alarms.sorted(by: {$0.time < $1.time})
            print("---> [AlarmViewModel] List Changed: \n\(new)")
            self.persist(alarms: new)
        }.store(in: &subscriptions)
    }
    
    func didSelect(at indexPath: IndexPath) {
        let alarm = alarms[indexPath.item]
        selectedAlarm.send(alarm)
    }
    
    func addNewAlarm(newAlarm: Alarm) {
        
        if alarms.contains(newAlarm) {
            print("*** you already have same alarms")
            return
        }
        else {
//            print("---> [addNewAlarm] before: \(alarms)")
            self.alarms.append(contentsOf: [newAlarm])
            let new = self.alarms.sorted(by: {$0.time < $1.time})
            self.alarms = new
            self.persist(alarms: self.alarms)
            print("---> [addNewAlarm] \(alarms)")
            self.fetch()
        }
        
    }
    
    func persist(alarms: [Alarm]) {
        guard alarms.isEmpty == false else {
//            self.storage.persist(Alarm.list);
            return
        }
        self.storage.persist(alarms)
    }
    
    func fetch() {
        self.alarms = storage.fetch()
    }
    

}
