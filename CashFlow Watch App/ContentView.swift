//
//  ContentView.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan on 2026/1/11.
//

import SwiftUI

struct ContentView: View {
    @State private var cashViewModel = CashFlowViewModel()
    @State var showingingCreatePage = false
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 16) {
                    if !cashViewModel.recordsMockData.isEmpty {

                    }
                    
                    if cashViewModel.recordsMockData.isEmpty {
                        EmptyStateView()
                    } else{
                        VStack {
                            ForEach(cashViewModel.recordsMockData) { record in
                                RowView(record: record)
                                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                        Button(role: .destructive) {
                                            cashViewModel.delete(record: record)
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showingingCreatePage = true
                        
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

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "chart.bar.doc.horizontal")
                .font(.system(size: 40))
                .foregroundColor(.secondary)
            Text("No transactions yet")
                .font(.headline)
                .foregroundStyle(.primary)
            Text("Tap + to add first expense or income")
                .font(.caption)
                .multilineTextAlignment(.center)
                .foregroundColor(.secondary)
                .padding()
        }
        .padding(.top,40)
    }
}

struct SummaryView: View {
    @Bindable var viewModel: CashFlowViewModel
    var body: some View {
        VStack(spacing: 12) {
            VStack(spacing: 4) {
                Text("Balance")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}




