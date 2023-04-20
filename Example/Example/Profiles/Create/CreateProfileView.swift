import SwiftUI

struct CreateProfileView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = CreateProfileViewModel()

    var body: some View {
        VStack {
            Text("Create a profile")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.primary)
                .padding()

            Spacer()

            TextField(
                "Something",
                text: $viewModel.handle,
                prompt: Text("coolhandle")
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.none)
            .textContentType(.none)
            .multilineTextAlignment(.center)
            .disabled(viewModel.isCreating)
            .padding()

            Spacer()

            if (viewModel.isCreating) {
                ProgressView()
            } else {
                Button("Create Profile") {
                    Task { await viewModel.didTapCreateButton() }
                }
                .padding()
            }
        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
