import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel

    static func scene(id: String) -> some View {
        let viewModel = ProfileViewModel(id: id)

        return ProfileView(viewModel: viewModel)
    }

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                ProgressView()
            case .profile(let profile):
                HeadingText(profile.handle)
            case .noProfile:
                Text("Looks like you still need a profile!")

                PrimaryButton("Create a profile") {
                    // TODO: Open account view
                }
            }
        }
        .onAppear {
            Task { await viewModel.onAppear() }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView.scene(id: "1")
    }
}
