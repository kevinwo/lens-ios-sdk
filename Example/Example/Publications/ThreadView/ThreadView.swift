import Kingfisher
import Lens
import SwiftUI

struct ThreadView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: ThreadViewModel

    static func scene(publication: Publication) -> ThreadView {
        let viewModel = ThreadViewModel(publication: publication)

        return ThreadView(viewModel: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    KFImage(viewModel.authorProfileImageUrl)
                        .feedProfilePicture()

                    VStack(alignment: .leading) {
                        if let name = viewModel.authorName { Text(name).bold() }

                        Text(viewModel.authorHandle)
                            .foregroundColor(.gray)
                    }

                    Spacer()
                }

                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.content)
                            .font(.body)

                        if let mediaImageUrl = viewModel.mediaImageUrl {
                            KFImage(mediaImageUrl)
                                .mediaImage()
                        }
                    }

                    Spacer()
                }
            }
            .padding()

            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        #if !os(macOS)
        .navigationBarTitle("Thread")
        .navigationBarItems(leading: BackButton {
            presentationMode.wrappedValue.dismiss()
        })
        #endif
    }
}
