////
////  NewAlarmViewModel.swift
////  MyAlarmy
////
////  Created by 백소망 on 2022/10/06.
////
//
//import Foundation
//import Combine
//
//final class NewAlarmViewModel: ObservableObject {
//    
//    @Published var alarms: [Alarm]
//    @Published var alarm: Alarm = Alarm(time: "")
//    
//    @Published var time: String = ""
//    
//    var subscriptions = Set<AnyCancellable>()
//    
//    init(alarms: [Alarm]) {
//        self.alarms = alarms
//        
//        $alarms
//            .sink { alarms in
//                print("---> NewAlarmViewModel: \(alarms)")
//            }.store(in: &subscriptions)
//    }
//    
//    func update(time: String) {
//        self.alarm.time = time
//    }
//    
//    func completed(newAlarm: Alarm) {
//        guard newAlarm.time.isEmpty == false else {return}
//        
//        print("전체 리스트 추가하기")
//        self.alarms.append(newAlarm)
//        
//    }
//}
