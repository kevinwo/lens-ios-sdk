import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Explore")) {
                    NavigationLink(destination: ExplorePublicationsView()) {
                        Text("Publications")
                    }
                }
            }
            .navigationTitle("Lens")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
