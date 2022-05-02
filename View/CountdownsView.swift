import SwiftUI

struct CountdownsView: View {
    @Environment(\.scenePhase) var scenePhase
    @EnvironmentObject private var model: CountdownViewModel
    @State private var isPresentingNewCountdownView = false
    
    var body: some View {
        CountdownListView()
        .navigationTitle("Countdown")
        .toolbar {
            Button(action: {
                isPresentingNewCountdownView = true
            }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Countdown")
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                model.save()
                print("Saved")
            }
        }
        .task {
            guard model.isFirstAppearance else { return }
            await model.load()
            model.isFirstAppearance = false
        }
        .sheet(isPresented: $isPresentingNewCountdownView) {
            AddingCountdownView(isPresentingNewCountdownView: $isPresentingNewCountdownView)
        }
    }
}

struct CountdownsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CountdownsView()
        }
        .environmentObject(CountdownViewModel())
    }
}
