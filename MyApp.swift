import SwiftUI

@main
struct MyApp: App {
    //Instatiate source of truth
    @StateObject private var model: CountdownViewModel
    
    /// new in Swift 5.6, will be required in swift 5.7
    init() {
        _model = StateObject(wrappedValue: CountdownViewModel())
    }
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CountdownsView()
            }
            .environmentObject(model)
            .navigationViewStyle(.stack)
            .task {
                await model.load()
            }
        }
    }
}
