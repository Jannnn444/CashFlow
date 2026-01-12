//
//  Model.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan  on 2026/1/11.
//

import Foundation

// MARK: Single User Financial Data

struct UserFinancialData {
    var income: Double
    var outgo: Double
}

// MARK: List - single entries, individual unit of data
struct Record: Identifiable {
    var id = UUID() // this line for mock data, later we get it from api
    var date: Date
    var icon: String
    var description: String
    var amount: Double
    var type: TransactionType
}

enum TransactionType {
    case spending
    case earning
}
