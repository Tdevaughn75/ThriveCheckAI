//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to ThriveCheck AI")
                    .font(.title)
                    .fontWeight(.bold)

                NavigationLink(destination: HealthGoalsView()) {
                    Text("Get Started")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            .navigationTitle("ThriveCheck AI")
        }
    }
}

// Preview (optional)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
