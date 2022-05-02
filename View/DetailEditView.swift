import SwiftUI

struct DetailEditView: View {
    @Binding var data: Countdown.Data
    var body: some View {
        Form {
            Section(header: Text("Countdown Info")) {
                TextField("Title", text: $data.title)
                DatePicker("Countdown Date", selection: $data.date)
                Toggle("Favorite", isOn: $data.isFavorite)
                Toggle("Active", isOn: $data.isActive)
            }
            ThemePicker(selection: $data.theme)
        }

    }
}

struct DetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(data: .constant(Countdown.countdowns[0].data))
    }
}
