//
//  compass.swift
//  compass
//
//  Created by Alexander Neal on 23/2/24.
//
import SwiftUI
struct ContentView: View {
@State private var isTrackingTime: Bool = false
@State private var startTime: Date? = nil
var body: some View {
NavigationView {
VStack €
if let startTime {
Text(startTime, style: relative)
｝
Button {
isTrackingTime.toggle()
if isTrackingTime {
startTime = .now
} else ‹
startTime = nil
H
} label: 1
Text (isTrackingTime ? "STOP" : "START")
• fontWeight(.light)
• foregroundColor(-white)
• frame (width: 200, height: 200)
• background (Circle().fill(isTrackingTime ?.red : •green))
•navigationTitle("Basic Time Tracker")
struct ContentView_Previews: PreviewProvider {
static var previews: some View 1
ContentView()























struct NavigationLiveActivityView: View {
    
    var body: some View {
        Image(systemName: "location.north.fill")
            .imageScale(.large)
            .foregroundColor(.accentColor)
        // Add other views as needed
    }
}

#Preview {
    NavigationLiveActivityView()
}
