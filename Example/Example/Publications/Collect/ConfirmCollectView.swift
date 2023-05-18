import Kingfisher
import Lens
import SwiftUI

struct ConfirmCollectView: View {
    @StateObject var viewModel: ConfirmCollectViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Collect this content".localizedUppercase)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
                .padding()

            if let title = viewModel.title {
                Text(title)
                    .lineLimit(2)
                    .font(.title)
                    .padding([.bottom, .leading, .trailing])
            }

            Text(viewModel.description ?? "No description")
                .lineLimit(5)
                .font(.body)
                .foregroundColor(.gray)
                .padding([.bottom, .leading, .trailing])

            if let mediaImageUrl = viewModel.mediaImageUrl {
                HStack {
                    Spacer()
                    VStack {
                        KFImage(mediaImageUrl)
                            .mediaImage(contentMode: .fit)
                    }
                    .mediaRounded()
                    Spacer()
                }
                .padding([.leading, .trailing])
            }

            Spacer()

            PrimaryButton("Collect", isProgressing: $viewModel.isCollecting) {
                Task { await viewModel.didTapConfirmButton() }
            }
            .padding([.top, .leading, .trailing])

            HStack {
                Text("Free Collect")
                    .font(.footnote)
                    .foregroundColor(.gray)

                Spacer()

                Button {
                    // TODO: Show modal explaining collecting
                } label: {
                    Text("What's collecting?")
                        .font(.footnote)
                }
            }
            .padding(.top, 5)
            .padding([.bottom, .leading, .trailing])
        }
    }

    static func view(publication: Publication, onCollectComplete: @escaping (String) -> Void) -> some View {
        let viewModel = ConfirmCollectViewModel(publication: publication, onCollectComplete: onCollectComplete)

        return ConfirmCollectView(viewModel: viewModel)
    }
}
