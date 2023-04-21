import SwiftUI

struct CreateProfileView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = CreateProfileViewModel()

    var body: some View {
        VStack {
            Text("Create a profile")
                .font(.largeTitle)
                .bold()
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()

            Text("Your profile uniquely identifies you and your content to others on Lens. You'll be able to customize it later.")
                .font(.headline)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()

            TextField(
                "",
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

            PrimaryButton("Create Profile", isProgressing: $viewModel.isCreating) {
                Task { await viewModel.didTapCreateButton() }
            }
            .padding()

        }
    }
}

struct CreateProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CreateProfileView()
    }
}
