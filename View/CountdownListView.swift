//
//  File.swift
//  
//
//  Created by Gerard Gomez on 5/2/22.
//

import SwiftUI

struct CountdownListView: View {
    @EnvironmentObject private var model: CountdownViewModel
    var body: some View {
        List {
            ForEach($model.countdowns) { $countdown in
                NavigationLink {
                    DetailView(countdown: $countdown)
                    
                } label: {
                    CardView(countdown: countdown)
                }
                .swipeActions {
                    Button("Delete", role: .destructive) {
                        model.deleteCountdown(countdown)
                    }
                }
                .swipeActions(edge: .leading, allowsFullSwipe: true) {
                    Button {
                        countdown.isFavorite.toggle()
                    } label: {
                        Image(systemName: countdown.isFavorite ? "pin.slash" : "pin")

                    }
                    .tint(countdown.isFavorite ? .gray : .yellow)
                }
                
                .listRowBackground(countdown.theme.mainColor)
            }
        }
    }
}
