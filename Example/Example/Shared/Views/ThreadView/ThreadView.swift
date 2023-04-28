import SwiftUI
import Lens

struct ThreadView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ThreadViewModel

    static func scene(publication: Publication) -> ThreadView {
        let viewModel = ThreadViewModel(publication: publication)

        return ThreadView(viewModel: viewModel)
    }

    var body: some View {
        Text("Hello detail view!")
            .navigationBarTitle("Thread")
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }

    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(.blue)
        }
    }
}
