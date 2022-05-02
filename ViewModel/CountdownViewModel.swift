import Foundation
import SwiftUI

@MainActor
final class CountdownViewModel: ObservableObject {
    @Published var countdowns = [Countdown]()
    @Published var newCountdownData = Countdown.Data()
    @Published var nowDate = Date()
    @Published var isFirstAppearance = true
    
 
    
    func resetNewCountdown() {
        newCountdownData = Countdown.Data()
    }
    func deleteCountdown(_ countdown: Countdown) {
        countdowns.removeAll { $0.id == countdown.id }
        save()
    }
    func add() {
        let newCountdown = Countdown(data: newCountdownData)
        countdowns.append(newCountdown)
        resetNewCountdown()
    }
    
    func load() async {
        do {
            countdowns = try await FileManager.decode([Countdown].self, from: Constants.filename)
        } catch {
            countdowns = []
        }
    }
    func save()  {
        Task {
            do {
                try await FileManager.encode(countdowns, from: Constants.filename)
                
            } catch {
                print("Cannot save")
            }
        }
    }
    
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.nowDate = Date()
        }
    }
    
    func timerFunction(from date: Date) -> (year: Int?, month: Int?, day: Int?, hour: Int?, minute: Int?, second: Int?) {
        let calendar = Calendar(identifier: .gregorian)
        let timeValue = calendar.dateComponents([.year,.month, .day, .hour, .minute, .second], from: nowDate, to: date)
        return (timeValue.year, timeValue.month, timeValue.day, timeValue.hour, timeValue.minute, timeValue.second)
    }
}
