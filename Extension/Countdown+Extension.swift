import Foundation

//Sample data to use for preview purposes
extension Countdown {
    static let countdowns = [
        Countdown(title: "My Wedding", date: Date.now.addingTimeInterval(60*60*24*365*5), theme: Theme.indigo, isFavorite: true, isActive: true),
        Countdown(title: "Baseball game", date: Date.now.addingTimeInterval(60*60*24*5), theme: .poppy, isFavorite: true, isActive: true),
        Countdown(title: "Graduation", date: Date.now.addingTimeInterval(60*60*24*30*3), theme: .oxblood, isFavorite: false, isActive: true)
    ]
}

