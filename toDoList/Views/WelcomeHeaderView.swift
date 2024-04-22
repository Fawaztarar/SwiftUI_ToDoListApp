import SwiftUI

struct WelcomeHeaderView: View {
    var username: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Welcome, \(username)!")
                .font(.headline)
                .padding()
            Text("What’s on your plate today?")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
