import SwiftUI

struct CardView: View {
    @EnvironmentObject private var model: CountdownViewModel
    let countdown: Countdown
    
    var body: some View {
        VStack {
            HStack {
                Text(countdown.title)
                    .font(.title)
                    .fontWeight(.heavy)
                    .accessibilityAddTraits(.isHeader)
                
                if countdown.isFavorite {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            .padding()
            CountdownTimerRowView(countdown: countdown)
        }
        .foregroundColor(countdown.theme.accentColor)
        .onAppear(perform: {
            let _ = model.timer
        })
        .onDisappear {
            model.timer.invalidate()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(countdown: Countdown.countdowns[0])
            .environmentObject(CountdownViewModel())
    }
}
