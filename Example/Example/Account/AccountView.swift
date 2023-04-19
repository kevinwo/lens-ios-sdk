import SwiftUI

struct AccountView: View {
    var body: some View {
        VStack {
            Text("Welcome to Lens")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)

            Spacer()

            Button("Get Started") {
                // TODO
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
