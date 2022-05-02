import Foundation

/// Model for inactive or deleted countdowns
struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    let title: String
    let isActive: Bool
    
    /// Initializes the History model
    /// - Parameters:
    ///   - id: id
    ///   - date: date
    ///   - title: name
    ///   - isActive: active or inactive
    init(id: UUID = UUID(), date: Date, title: String, isActive: Bool = false) {
        self.id = id
        self.date = date
        self.title = title
        self.isActive = isActive
    }
}
