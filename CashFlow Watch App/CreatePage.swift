//
//  CreatePage.swift
//
//  CreatPage.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan    on 2026/1/11.
//

//
//  CreatePage.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan on 2026/1/11.
//

import Foundation
import SwiftUI

struct CreatePage: View {
    @Binding var isPresented: Bool
    @Bindable var viewModel: CashFlowViewModel
    
    @State private var icon: String = ""
    @State private var description: String = ""
    @State private var amount: String = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Title
                Text("New Expense")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.top, 8)
                
                // Input fields with better styling
                VStack(spacing: 12) {
                    // Icon + Description row
                    HStack(spacing: 8) {
                        TextField(":)", text: $icon)
                            .frame(width: 40, height: 44)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                        
                        TextField("Item", text: $description)
                            .frame(height: 44)
                            .font(.body)
                            .padding(.horizontal, 12)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                    }
                    
                    // Amount field
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Amount")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        
                        HStack {
                            Text("$")
                                .font(.title3)
                                .foregroundStyle(.white)
                            
                            TextField("0.00", text: $amount)
                                .font(.title3.bold())
                                .frame(height: 44)
                        }
                        .padding(.horizontal, 12)
                        .background(Color.white.opacity(0.15))
                        .cornerRadius(8)
                    }
                }
                .padding(.horizontal, 4)
                
                Spacer()
                    .frame(height: 20)
                
                // Action buttons with better design
                HStack(spacing: 10) {
                    Button {
                        isPresented = false
                    } label: {
                        Text("Cancel")
                            .font(.body)
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                    }
                    .buttonStyle(.bordered)
                    .tint(.gray)
                    
                    Button {
                        saveRecord()
                    } label: {
                        Text("Save")
                            .font(.body.bold())
                            .frame(maxWidth: .infinity)
                            .frame(height: 44)
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                }
                .padding(.horizontal, 4)
            }
            .padding()
        }
    }
    
    private func saveRecord() {
        let newRecord = Record(
            date: .now,
            icon: icon.isEmpty ? "💰" : icon,
            description: description,
            amount: Double(amount) ?? 0,
            type: .spending
        )
        
        viewModel.save(record: newRecord)
        isPresented = false
    }
}
