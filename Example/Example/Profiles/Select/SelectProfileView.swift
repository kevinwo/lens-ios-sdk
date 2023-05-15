import SwiftUI

struct SelectProfileView: View {
    @ObservedObject var viewModel: SelectProfileViewModel

    static func scene(onSelectProfile: @escaping () -> Void) -> some View {
        let viewModel = SelectProfileViewModel(onSelectProfile: onSelectProfile)
        let view = SelectProfileView(viewModel: viewModel)

        return view
    }

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                Spacer()
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                Spacer()
            case .profiles(let profiles):
                HeadingText("Select a profile")
                    .foregroundColor(.white)

                List {
                    ForEach(profiles, id: \.id) { profile in
                        Button {
                            viewModel.didSelectProfile(with: profile.id)
                        } label: {
                            Text(profile.handle.asPrettyHandle)
                        }
                    }
                }
                .listStyle(.plain)


                Button("Create a new profile") {
                    withAnimation {
                        viewModel.didTapCreateProfileButton()
                    }
                }
                .buttonStyle(.bordered)
                .foregroundColor(.white)
            case .noProfile:
                CreateProfileView.scene(onCreateProfile: { handle in
                    Task { await viewModel.didCreateProfile(with: handle) }
                })
                .opacity(1)
                .transition(.opacity)
            }
        }
        .onAppear {
            Task { await viewModel.onAppear() }
        }
    }
}

struct SelectProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SelectProfileView.scene(onSelectProfile: {})
    }
}
