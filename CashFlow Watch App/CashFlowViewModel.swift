//
//  CashFlowViewModel.swift
//  CashFlow Watch App
//
//  Created by Hualiteq International on 2026/1/12.
//

import Foundation
import Observation

@Observable
class CashFlowViewModel {
    
    var recordsMockData: [Record] = [
        Record(date: .now, icon: "🦋", description: "Butterfily", amount: 40, type: .spending),
        Record(date: .now, icon: "🪿", description: "Meal", amount: 100, type: .spending),
        Record(date: .now, icon: "🍊", description: "Orange", amount: 80, type: .spending)
    ]
   
    
    func save(record: Record) {
        recordsMockData.append(record)
    }
    
    func delete(record: Record) {
        recordsMockData.removeAll { $0.id == record.id }
    }
}
