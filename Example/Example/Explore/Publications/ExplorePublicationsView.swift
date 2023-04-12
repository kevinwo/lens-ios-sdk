import SwiftUI

struct ExplorePublicationsView: View {
    var body: some View {
        List {
            Text("Publication 1")
            Text("Publication 2")
            Text("Publication 3")
        }
        .navigationTitle("Explore Publications")
    }
}

struct ExplorePublicationsView_Previews: PreviewProvider {
    static var previews: some View {
        ExplorePublicationsView()
    }
}
