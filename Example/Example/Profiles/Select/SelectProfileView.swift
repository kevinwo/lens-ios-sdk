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
                List {
                    ForEach(profiles, id: \.id) { profile in
                        Text(profile.id)
                    }
                }
            case .noProfile:
                CreateProfileView.scene(onCreateProfile: { handle in
                    viewModel.didSelectProfile(with: handle)
                })
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
