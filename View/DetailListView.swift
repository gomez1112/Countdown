//
//  File.swift
//  
//
//  Created by Gerard Gomez on 5/2/22.
//

import SwiftUI

struct DetailListView: View {
    @Binding var countdown: Countdown
    var body: some View {
        List {
            Section(header: Text("Countdown Name")) {
                HStack {
                    Text(countdown.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                    Spacer()
                    if countdown.isFavorite {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                }
            }
            Section(header: Text("Countdown ending on")) {
                Text(countdown.date.formatted())
            }
            HStack {
                Label("Theme", systemImage: "paintpalette")
                Spacer()
                Text(countdown.theme.name)
                    .padding(4)
                    .foregroundColor(countdown.theme.accentColor)
                    .background(countdown.theme.mainColor)
                    .cornerRadius(4)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

