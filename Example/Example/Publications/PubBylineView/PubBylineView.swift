import SwiftUI

struct PubBylineView: View {
    let authorName: String?
    let authorHandle: String
    let timeAgo: String?

    var body: some View {
        HStack {
            if let name = authorName { Text(name).bold() }

            Text(authorHandle)
                .foregroundColor(.gray)

            if let timeAgo = timeAgo {
                Text("·")
                Text(timeAgo).foregroundColor(.gray)
            }
        }
        .font(.callout)
    }
}

struct PubBylineRow_Previews: PreviewProvider {
    static var previews: some View {
        PubBylineView(
            authorName: "Cool Author",
            authorHandle: "coolauthor.lens",
            timeAgo: "30m"
        )
    }
}
