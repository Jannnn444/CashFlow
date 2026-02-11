//
//  RowView.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan    on 2026/1/11.
//

import Foundation
import SwiftUI

struct RowView: View {
    let record: Record
    
    var body: some View {
        HStack {
            Text(record.icon)
            Text(record.description)
                .font(.footnote)
                .foregroundStyle(.white)
                
            Spacer()
            Text("$\(record.amount, specifier: "%.2f")")
                .font(.footnote)
                .foregroundStyle(.white)
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 5)
    }
}
