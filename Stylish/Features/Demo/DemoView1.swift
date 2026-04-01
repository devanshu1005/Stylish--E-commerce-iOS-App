import SwiftUI

struct DemoView1: View {
    var body: some View {
        NavigationView {
            Text("Demo Screen 1")
                .font(.title)
                .navigationTitle("Home")
        }
    }
}

#Preview {
    DemoView1()
}
