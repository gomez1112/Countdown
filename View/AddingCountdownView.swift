//
//  File.swift
//  
//
//  Created by Gerard Gomez on 5/2/22.
//

import SwiftUI

struct AddingCountdownView: View {
    @EnvironmentObject private var model: CountdownViewModel
    @Binding var isPresentingNewCountdownView: Bool
    var body: some View {
        NavigationView {
            DetailEditView(data: $model.newCountdownData)
                .navigationTitle(model.newCountdownData.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewCountdownView = false
                            model.resetNewCountdown()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            model.add()
                            isPresentingNewCountdownView = false
                        }
                        .disabled(model.newCountdownData.title.isEmpty)
                    }
                    
                }
        }
    }
}

