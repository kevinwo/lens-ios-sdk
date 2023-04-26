import SwiftUI

struct CreateProfileView: View {
    @ObservedObject var viewModel: CreateProfileViewModel

    static func scene(onCreateProfile: @escaping (String) -> Void) -> some View {
        let viewModel = CreateProfileViewModel(onCreateProfile: onCreateProfile)
        let view = CreateProfileView(viewModel: viewModel)

        return view
    }

    var body: some View {
        VStack {
            HeadingText("Create a profile")
            SubheadingText("Your profile uniquely identifies you and your content to others on Lens. You'll be able to customize it later.")

            Spacer()

            TextField(
                "",
                text: $viewModel.handle,
                prompt: Text("coolhandle")
            )
            .textFieldStyle(.roundedBorder)
            .autocapitalization(.none)
            .autocorrectionDisabled(true)
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
        CreateProfileView.scene(onCreateProfile: { _ in })
    }
}
