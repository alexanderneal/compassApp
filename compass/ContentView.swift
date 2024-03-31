import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isTrackingMeters: Bool = false
    @State private var startNav: Date? = nil
    @State private var activity: Activity<NavigationTrackingAttributes>? = nil
    @ObservedObject private var compassVM = CompassViewModel()

    var body: some View {
        NavigationView {
            VStack {
                CompassView(viewModel: compassVM)
                    .frame(width: 300, height: 300)
                    .padding(.top, 20) // Push compass down a bit

                // Only one degree indicator here
               /* if compassVM.trueHeading != 0 {
                    Text("\(compassVM.trueHeading, specifier: "%.0f")°")
                        .font(.title)
                        .bold()
                        .padding(.vertical, 30) // Add space around the degree indicator
                }
                */
                
                Button(action: toggleTracking) {
                    Text(isTrackingMeters ? "STOP" : "START")
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 100) // Adjusted size
                        .background(Circle().fill(isTrackingMeters ? Color.red : Color.green))
                }
                .padding(.bottom, 20) // Push button down a bit

                if let startNav = startNav {
                    Text("Started: \(startNav, style: .timer)")
                        .padding(.bottom, 10) // Adds space between the "Started" text and the bottom of the view
                }
            }
            .navigationTitle("Navigation")
            
        }
    }

    func toggleTracking() {
                isTrackingMeters.toggle()

                if isTrackingMeters {
                    startNav = .now
                    
                    // Start live activity
                    let attributes = NavigationTrackingAttributes()
                    let state = NavigationTrackingAttributes.ContentState(startNav: .now)
                    activity = try? Activity<NavigationTrackingAttributes>.request(attributes: attributes, contentState: state, pushType: nil)
                } else {
                    // End live activity
                    guard let startNav = startNav else { return }
                    let state = NavigationTrackingAttributes.ContentState(startNav: startNav)
                    Task {
                        await activity?.end(using: state, dismissalPolicy: .immediate)
                    }
                    self.startNav = nil
                }
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

