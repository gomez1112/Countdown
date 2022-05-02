//
//  File.swift
//  
//
//  Created by Gerard Gomez on 5/2/22.
//

import SwiftUI

struct EditingCountdownView: View {
    @EnvironmentObject private var model: CountdownViewModel
    @Binding var isPresentingEditView: Bool
    @Binding var countdown: Countdown
    var body: some View {
        NavigationView {
            DetailEditView(data: $model.newCountdownData)
                .navigationTitle(countdown.title)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            isPresentingEditView = false
                            model.resetNewCountdown()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Done") {
                            isPresentingEditView = false
                            countdown.update(from: model.newCountdownData)
                            model.resetNewCountdown()
                            
                            
                        }
                        .disabled(model.newCountdownData.title.isEmpty)
                    }
                }
            
        }
    }
}
