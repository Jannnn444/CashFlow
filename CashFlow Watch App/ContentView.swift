//
//  ContentView.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan on 2026/1/11.
//

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
        NavigationStack {
            ZStack(alignment: .top) {
                Rectangle()
                    .frame(width: 180, height: 200)
                    .cornerRadius(20)
                
                VStack {
                    ScrollView {
                        if !isAnySpenseCreated {
                            Text("Create your first spense!")
                                .foregroundStyle(.black)
                                .padding(.top, 40)
                        }
                        
                        if isAnySpenseCreated {
                            VStack {
                                ForEach(cashViewModel.recordsMockData) { record in
                                    RowView(record: record)
                                }
                            }.padding()
                                .task {
                                    try? await Task.sleep(for: .seconds(5))
                                }
                        }
                    }
                    .padding()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingingCreatePage = true
                        isAnySpenseCreated = true
                    } label: {
                        Image(systemName: "plus")
                            .imageScale(.medium)
                            .foregroundStyle(.tint)
                    }
                }
            }
            .sheet(isPresented: $showingingCreatePage) {
                CreatePage(
                    isPresented: $showingingCreatePage,
                    viewModel: cashViewModel
                )
            }
        }
    }
}

#Preview {
    ContentView()
}
