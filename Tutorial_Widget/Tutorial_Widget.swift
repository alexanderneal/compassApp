

import ActivityKit
import WidgetKit
import SwiftUI

struct Tutorial_Widget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: NavigationTrackingAttributes.self) { context in
            NavigationTrackingWidgetView(context: context)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.center){
                    Text("Main")
                }
            } compactLeading: {
                Text("CL")
            } compactTrailing: {
                Text("NW").foregroundColor(.red)
            } minimal: {
                Text("M")
            }

        }
    }
}


struct NavigationTrackingWidgetView: View {
    let context: ActivityViewContext<NavigationTrackingAttributes>
    
    var body: some View{
        Text(context.state.startNav, style: .relative)
    }
}
