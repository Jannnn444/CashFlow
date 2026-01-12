//
//  ContentView.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan on 2026/1/11.
//

import SwiftUI

struct ContentView: View {
    @State var isAnySpenseCreated: Bool = false
    @State var showingingCreatePage = false
    
    @State private var cashViewModel = CashFlowViewModel()

    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 180, height: 200)
                .cornerRadius(20)
            
            VStack {
                Button(action: {
                    showingingCreatePage = true
                }) {
                    // UI
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .padding()
                }
                .frame(width: 80, height: 80)
                .padding()
                
//                if !isAnySpenseCreated {
//                    Text("Create your first spense!")
//                        .foregroundStyle(.black)
//                } else {
                    ForEach(cashViewModel.recordsMockData) { record in
                        RowView(record: record)
                    }
//                }
                
            }
            .padding()
        }
        .sheet(isPresented: $showingingCreatePage) {
            CreatePage(isPresented: $showingingCreatePage, onSave: {
                isAnySpenseCreated = true
            })
        }
    }
}

#Preview {
    ContentView()
}
