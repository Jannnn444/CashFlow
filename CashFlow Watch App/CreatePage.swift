//
//  CreatePage.swift
//
//  CreatPage.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan    on 2026/1/11.
//

import Foundation
import SwiftUI

struct CreatePage: View {
    @Binding var isPresented: Bool
    @Bindable var viewModel: CashFlowViewModel // same view model from parent
    
    @State private var icon: String = ""
    @State private var description: String = ""
    @State private var amount: String = ""  // ✅ Change to String for TextField
        
    
    var body: some View {
        VStack {
            Text("New Expense")
                .font(.headline)
            
            HStack {
                TextField(":)", text: $icon)
                    .frame(width: 30, height: 50)
                    .font(.body)
                    
                TextField("Item",text: $description)
                    .frame(width: 100, height: 50)
                    .font(.body)
                
            }
            TextField("Amount", text: $amount)
                .frame(width: 100, height: 50)
                .font(.body)
            
            HStack {
                Button("Back") {
                    isPresented = false
                }
                .frame(width: 60, height: 50)
                .foregroundStyle(.black)
                .font(.body)
                
                Button("Save") {
                    isPresented = false
                    saveRecord()
                }
                .frame(width: 60, height: 50)
                .foregroundStyle(.black)
                .font(.body)
            }
        }
        .padding()
    }
    
    private func saveRecord() {
        let newRecord = Record(
            date: .now,
            icon: icon.isEmpty ? "💰" : icon,
            description: description,
            amount: Double(amount) ?? 0,  // !!! Convert String to Double
            type: .spending
        )
        
        viewModel.save(record: newRecord)
        isPresented = false //dismiss after saving
    }
}
