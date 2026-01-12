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
                    isAnySpenseCreated = true
                }) {
                    // UI
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                        .padding()
                }
                .frame(width: 80, height: 80)
                .padding()
                
                if !isAnySpenseCreated {
                    Text("Create your first spense!")
                        .foregroundStyle(.black)
                } else {
                    
                    ForEach(cashViewModel.recordsMockData) { record in
                        RowView(record: record)
                    }.task {
                        try? await Task.sleep(for: .seconds(50)) // let mock data slower show
                    }
                }
                
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

/* todo list: 
 
  1. Write Save()
  2. by diffent enum shows transaction color
 
*/
