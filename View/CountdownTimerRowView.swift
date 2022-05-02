//
//  File.swift
//  
//
//  Created by Gerard Gomez on 5/2/22.
//

import SwiftUI

struct CountdownTimerRowView: View {
    @EnvironmentObject private var model: CountdownViewModel
    let countdown: Countdown
    var body: some View {
        HStack {
            TextDateTitleView(date: model.timerFunction(from: countdown.date).year, pluralTime: "Years", singularTime: "Year")
            TextDateTitleView(date: model.timerFunction(from: countdown.date).month, pluralTime: "Months", singularTime: "Month")
            TextDateTitleView(date: model.timerFunction(from: countdown.date).day, pluralTime: "Days", singularTime: "Day")
            TextDateTitleView(date: model.timerFunction(from: countdown.date).hour, pluralTime: "Hours", singularTime: "Hour")
            TextDateTitleView(date: model.timerFunction(from: countdown.date).minute, pluralTime: "Minutes", singularTime: "Minute")
            TextDateTitleView(date: max(model.timerFunction(from: countdown.date).second ?? 0, 0), pluralTime: "Seconds", singularTime: "Second")
            
        }
        .padding(.bottom)
    }
}
