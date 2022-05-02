import SwiftUI

struct DetailView: View {
    @EnvironmentObject private var model: CountdownViewModel
    @State private var isPresentingEditView = false
    @Binding var countdown: Countdown
    
    var body: some View {
        DetailListView(countdown: $countdown)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                model.newCountdownData = countdown.data
            }
            
        }
        .sheet(isPresented: $isPresentingEditView) {
            EditingCountdownView(isPresentingEditView: $isPresentingEditView, countdown: $countdown)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(countdown: .constant(Countdown.countdowns[0]))
                .environmentObject(CountdownViewModel())
        }
    }
}
