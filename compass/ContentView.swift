import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var isTrackingMeters: Bool = false
    @State private var startNav: Date? = nil
    @State private var activity: Activity<NavigationTrackingAttributes>? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                if let startNav = startNav {
                    Text(startNav, style: .relative)
                }
                
                Button {
                    isTrackingMeters.toggle()
                    
                    if isTrackingMeters {
                        startNav = .now
                        
                        //Start live activity
                        let attributes = NavigationTrackingAttributes()
                        let state = NavigationTrackingAttributes.ContentState(startNav: .now)
                        
                        activity = try? Activity<NavigationTrackingAttributes>.request(attributes: attributes, contentState: state,pushType: nil)
                    } else {
                        
                        //End live actiivity
                        guard let startNav else { return }
                        let state = NavigationTrackingAttributes.ContentState(startNav: startNav)
                        
                        Task{
                            await activity?.end(using: state, dismissalPolicy: .immediate)
                        }
                        self.startNav = nil
                    }
                } label: {
                    Text(isTrackingMeters ? "STOP" : "START")
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 200)
                        .background(Circle().fill(isTrackingMeters ? Color.red : Color.green))
                }
                .navigationTitle("Navigation")
            }
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
    

