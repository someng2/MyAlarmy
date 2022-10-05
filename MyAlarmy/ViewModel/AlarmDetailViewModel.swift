//
//  AlarmDetailViewModel.swift
//  MyAlarmy
//
//  Created by 백소망 on 2022/10/04.
//

import Foundation
import Combine

final class AlarmDetailViewModel {
    
    // Data -> Output
    let alarm : CurrentValueSubject<Alarm, Never>
    
    init(alarm: Alarm) {
        self.alarm = CurrentValueSubject(alarm)
    }
}
