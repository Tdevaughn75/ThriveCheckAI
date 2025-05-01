//
import SwiftUI

struct PersonalizedPlanView: View {
    let goal: String

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                Text("Welcome to Your Plan")
                    .font(.largeTitle)
                    .bold()

                Text("You chose: \(goal)")
                    .font(.title2)
                    .foregroundColor(.gray)

                Divider()

                VStack(alignment: .leading, spacing: 15) {
                    Text(dynamicMessage(for: goal))
                        .font(.body)
                        .padding()

                    Image(dynamicImageName(for: goal))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(12)
                        .padding()
                }

                Spacer()
            }
            .padding()
            .navigationTitle("My Plan")
        }
    }

    // MARK: - Dynamic message for each goal
    func dynamicMessage(for goal: String) -> String {
        switch goal {
        case "Lose Weight":
            return "Start your day with 30 mins of walking and eat a calorie-controlled breakfast."
        case "Build Muscle":
            return "Begin with strength training and include protein-rich meals throughout the day."
        case "Sleep Better":
            return "Establish a calming bedtime routine and avoid screens before sleep."
        case "Reduce Stress":
            return "Take time to meditate, journal, and practice breathing exercises."
        case "Track My Health":
            return "Review your daily health stats using your wearable device."
        default:
            return "Stay consistent and monitor your progress daily."
        }
    }

    // MARK: - Dynamic image name for each goal
    func dynamicImageName(for goal: String) -> String {
        switch goal {
        case "Lose Weight": return "lose_weight"
        case "Build Muscle": return "build_muscle"
        case "Sleep Better": return "sleep_better"
        case "Reduce Stress": return "reduce_stress"
        case "Track My Health": return "track_health"
        default: return "default_image"
        }
    }
}

// MARK: - Preview
struct PersonalizedPlanView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalizedPlanView(goal: "Lose Weight")
    }
}
