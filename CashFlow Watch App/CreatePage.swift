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
    let onSave: () -> Void
    
    @State private var icon: String = ""
    @State private var description: String = ""
    
    @State var cashviewcontroller = CashFlowViewModel()
    
    var body: some View {
        VStack {
            Text("New Expense")
                .font(.headline)
            
            HStack {
                TextField(":)", text: $icon)
                    .frame(width: 50, height: 50)
                    .font(.body)
                TextField("Catefory",text: $description)
            }
            
            HStack {
                Button("Back") {
                    isPresented = false
                }
                .frame(width: 50, height: 50)
                .foregroundStyle(.black)
                .font(.body)
                
                Button("Save") {
                    onSave()
                    isPresented = false
                    let record = Record(date: .now, icon: icon, description: description, amount: 0, type: .spending)
                    cashviewcontroller.save(record: record)
                }
                .frame(width: 50, height: 50)
                .foregroundStyle(.black)
                .font(.body)
            }
        }
        .padding()
    }
}
