import SwiftUI

struct SelectProfileView: View {
    @ObservedObject var viewModel = SelectProfileViewModel()

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                Spacer()
                ProgressView()
                Spacer()
            case .profiles(let profiles):
                List {
                    ForEach(profiles, id: \.id) { profile in
                        Text(profile.id)
                    }
                }
            case .noProfile:
                CreateProfileView()
            }
        }
        .onAppear {
            Task { await viewModel.onAppear() }
        }
    }
}

struct SelectProfileView_Previews: PreviewProvider {
    static var previews: some View {
        SelectProfileView()
    }
}
