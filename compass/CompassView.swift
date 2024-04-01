import SwiftUI

struct CompassView: View {
    @ObservedObject var viewModel: CompassViewModel
    
    var body: some View {
        VStack {
            Text("Compass")
                .font(.title)
            ZStack {
                Circle()
                    .fill(Color.secondary.opacity(0.2))
                    .frame(width: 250, height: 250)
                
                
                Image(systemName: "arrow.up.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.red)
                    .rotationEffect(Angle(degrees: -viewModel.trueHeading)) // This line rotates the arrow


                // Position the letters around the arrow
                Text("N")
                    .offset(y: -100) // Closer to the edge
                    .foregroundColor(.primary)
                    .rotationEffect(.degrees(-viewModel.trueHeading))
                Text("S")
                    .offset(y: 100) // Closer to the edge
                    .foregroundColor(.primary)
                    .rotationEffect(.degrees(-viewModel.trueHeading))
                Text("E")
                    .offset(x: 100) // Closer to the edge
                    .foregroundColor(.primary)
                    .rotationEffect(.degrees(-viewModel.trueHeading))
                Text("W")
                    .offset(x: -100) // Closer to the edge
                    .foregroundColor(.primary)
                    .rotationEffect(.degrees(-viewModel.trueHeading))
                
                // The labels rotate around the circle
                .animation(.easeIn, value: viewModel.trueHeading)
            }
            .frame(width: 250, height: 250)
            
            Text("\(viewModel.trueHeading, specifier: "%.0f")°")
                .font(.title)
                .bold()
                .padding(.bottom, 60)
        }
    }
}
