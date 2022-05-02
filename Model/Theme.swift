import SwiftUI

/// create theme for the color row conforming to CaseIterable to iterate over colors
enum Theme: String, CaseIterable, Identifiable, Codable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    /// Use to give the text easy to see color backgrounds
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow: return .black
        case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    /// Provide color for the countdown rows
    var mainColor: Color {
        switch self {
        case .bubblegum:
            return Color.bubblegum
        case .buttercup:
            return .buttercup
        case .indigo:
            return .myIndigo
        case .lavender:
            return .lavender
        case .magenta:
            return .magenta
        case .navy:
            return .navy
        case .orange:
            return .myOrange
        case .oxblood:
            return .oxblood
        case .periwinkle:
            return .periwinkle
        case .poppy:
            return .poppy
        case .purple:
            return .myPurple
        case .seafoam:
            return .seafoam
        case .sky:
            return .sky
        case .tan:
            return .tan
        case .teal:
            return .myTeal
        case .yellow:
            return .myYellow
        }
    }
    /// get name of the color
    var name: String {
        rawValue.capitalized
    }
    /// Conforming to identifiable, each name is unique
    var id: String {
        name
    }
}
