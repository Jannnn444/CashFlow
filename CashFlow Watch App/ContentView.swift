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
        ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: 180, height: 200)
                    .cornerRadius(20)
                
                VStack {
                    ScrollView {
                    Button(action: {
                        showingingCreatePage = true
                        isAnySpenseCreated = true
                    }) {
                        
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
                CreatePage(
                    isPresented: $showingingCreatePage,
                    viewModel: cashViewModel  // Pass the SAME viewModel!
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
