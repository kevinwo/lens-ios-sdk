import Lens
import Kingfisher
import SwiftUI

struct ProfileView: View {
    // MARK: - Properties

    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: ProfileViewModel

    var body: some View {
        VStack {
            switch viewModel.state {
            case .isLoading:
                ProgressView()
            case .profile:
                ScrollView {
                    GeometryReader { geometry in
                        ZStack {
                            MediaView(
                                media: viewModel.coverPictureMedia,
                                preset: .coverPicture(geometry)
                            )
                        }
                    }
                    .frame(height: 125)
                    .edgesIgnoringSafeArea(.top)

                    VStack {
                        HStack {
                            MediaView(
                                media: viewModel.pictureMedia,
                                preset: .profilePicture
                            )
                            .offset(y: -50)
                            .padding(.bottom, -50)

                            Spacer()
                        }

                        HStack {
                            VStack(alignment: .leading) {
                                if let name = viewModel.name {
                                    Text(name)
                                        .font(.title)
                                        .bold()
                                    Text(viewModel.handle)
                                        .foregroundColor(.gray)
                                } else {
                                    Text(viewModel.handle)
                                        .font(.headline)
                                        .bold()
                                }
                            }

                            Spacer()
                        }

                        if let bio = viewModel.bio {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(bio)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                            .padding([.top, .bottom], 4)
                        }
                    }
                    .padding()

                    PublicationsView.view(
                        profileId: viewModel.id,
                        displayType: .lazyVStack
                    )
                    .padding()
                }
            case .noProfile:
                Text("Looks like you still need a profile!")

                PrimaryButton("Create a profile") {
                    // TODO: Open account view
                }
            }
        }
        .onFirstAppear {
            Task { await viewModel.onAppear() }
        }
        .edgesIgnoringSafeArea(.top)
        .navigationBarBackButtonHidden(true)
        #if !os(macOS)
        .navigationBarItems(
            leading: BackButton {
                presentationMode.wrappedValue.dismiss()
            }
        )
        #endif
    }

    // MARK: - Internal interface

    static func scene(id: String) -> some View {
        let viewModel = ProfileViewModel(id: id)

        return ProfileView(viewModel: viewModel)
    }
}
