import Foundation

/// Countdown model, history and isActive property not yet finished.
struct Countdown: Identifiable, Codable, Equatable {
    var id = UUID()
    var title = ""
    var date = Date()
    var theme = Theme.magenta
    var isFavorite = false
    var isActive = true
    var history: [History] = []
    
    
    
    /// Initializes the model
    /// - Parameters:
    ///   - id: each countdown is unique
    ///   - title: each countdown must have a name
    ///   - date: each countdowm must have an ending date
    ///   - theme: use to color the countdown rows
    ///   - isFavorite: favorite countdown
    ///   - isActive: active or inactive countdown
    init(id: UUID = UUID(), title: String, date: Date, theme: Theme, isFavorite: Bool, isActive: Bool) {
        self.id = id
        self.title = title
        self.date = date
        self.theme = theme
        self.isFavorite = isFavorite
        self.isActive = isActive
    }
    /// Model conforms to equatable in order to delete countdown from the array
    /// - Parameters:
    ///   - lhs: id
    ///   - rhs: id
    /// - Returns: Bool
    static func == (lhs: Countdown, rhs: Countdown) -> Bool {
        lhs.id == rhs.id
    }
    
    /// Model to add and edit countdown
    struct Data {
        var title = ""
        var date = Date()
        var theme = Theme.bubblegum
        var isFavorite = false
        var isActive = true
    }
    /// Computed property that returns data
    var data: Data {
        Data(title: title, date: date, theme: theme, isFavorite: isFavorite, isActive: isActive)
    }
    
    /// Update countdown when making an edit
    /// - Parameter data: pass data into the function to the countdown model
    mutating func update(from data: Data) {
        title = data.title
        date = data.date
        theme = data.theme
        isFavorite = data.isFavorite
        isActive = data.isActive
    }
    
    /// initializer for countdown model to get data from edit or new countdown
    /// - Parameter data: data from edit or new countdown
    init(data: Data) {
        id = UUID()
        title = data.title
        date = data.date
        theme = data.theme
        isFavorite = data.isFavorite
        isActive = data.isActive
    }
}
