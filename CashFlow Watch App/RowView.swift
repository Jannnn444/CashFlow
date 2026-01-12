//
//  RowView.swift
//  StickerMoneyBook Watch App
//
//  Created by Jan    on 2026/1/11.
//

import Foundation
import SwiftUI

struct RowView: View {
    @Binding var record: [Record]
    
    var body: some View {
        HStack {
            ForEach(record) { r in
                Text(r.icon)
                Text(r.description)
            }
        }
    }
}
