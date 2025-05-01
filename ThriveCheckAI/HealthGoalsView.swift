import SwiftUI

struct HealthGoalsView: View {
    @State private var selectedGoal: String = ""
    @State private var isNavigating = false

    var body: some View {
        NavigationView {
            VStack(spacing: 25) {
                Text("Choose Your Health Goal")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.top)

                ForEach([
                    "Lose Weight", "Build Muscle", "Boost Energy",
                    "Sleep Better", "Reduce Stress", "Track My Health"
                ], id: \.self) { goal in
                    Button(action: {
                        selectedGoal = goal
                        isNavigating = true
                    }) {
                        Text(goal)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.85))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Spacer()

                NavigationLink(
                    destination: PersonalizedPlanView(goal: selectedGoal),
                    isActive: $isNavigating
                ) {
                    EmptyView()
                }
                .hidden()
            }
            .padding()
            .navigationTitle("Your Goals")
        }
    }
}
