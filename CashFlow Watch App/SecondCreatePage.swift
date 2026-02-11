//
//  SecondCreatePage.swift
//  CashFlow Watch App
//
//  Created by Hualiteq International on 2026/1/15.
//

import Foundation
import SwiftUI

struct SecondCreatePage: View {
    @Bindable var viewModel: CashFlowViewModel
    
    @State private var name: String
    @State private var gender: String
    @State private var age: Int
    @State private var greeting: String
    @State private var transactoionFee: Int
    @State private var options: OptionGenre
    
    enum OptionGenre {
        case genreA
        case genreB
    }
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Create new order ")
                    .font(.title)
                Text("Simple UIUX")
                    .foregroundStyle(.blue)
                    .padding(.horizontal, 20)
                VStack {
                TextField("Gender", text: $name)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .background(Color.gray)
                        .cornerRadius(12)
                    VStack {
                        Image(systemName: "sun.fill")
                            .font(.title2)
                            .foregroundColor(.green)
                            .multilineTextAlignment(.center)
                        TextField("NAme", text: $name)
                            .font(.title)
                            .foregroundColor(.red)
                            .cornerRadius(12)
                    }
                }
            }
        }
    }
}
