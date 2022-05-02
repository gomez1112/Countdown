//
//  File.swift
//  
//
//  Created by Gerard Gomez on 5/2/22.
//

import SwiftUI

struct TextDateTitleView: View {
    let date: Int?
    let pluralTime: String
    let singularTime: String
    var body: some View {
        Group {
            Spacer()
            VStack {
                Text("\(date ?? 0)")
                Text(date ?? 0 > 0 ? pluralTime : singularTime)
                    .font(.caption)
            }
            .font(.title)
            Spacer()
        }
        
    }
}
