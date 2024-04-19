import Foundation
import CoreLocation

class CompassViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var trueHeading: Double = 0
    @Published var directionString: String = "N"
    private var locationManager = CLLocationManager()
    
    
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingHeading()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        if newHeading.headingAccuracy > 0 {
            DispatchQueue.main.async {
                // trueHeading is the direction in degrees, relative to geographic North
                self.trueHeading = newHeading.trueHeading
                self.directionString = self.cardinalDirection(from: newHeading)
            }
        }
    }
    func cardinalDirection(from heading: CLHeading) -> String {
        let headingDegrees = heading.trueHeading
        
        switch headingDegrees {
        case 0..<22.5:
            return "N"
        case 22.5..<67.5:
            return "NE"
        case 67.5..<112.5:
            return "E"
        case 112.5..<157.5:
            return "SE"
        case 157.5..<202.5:
            return "S"
        case 202.5..<247.5:
            return "SW"
        case 247.5..<292.5:
            return "W"
        case 292.5..<337.5:
            return "NW"
        case 337.5...360:
            return "N"
        default:
            return "N"
        }
    }
}

