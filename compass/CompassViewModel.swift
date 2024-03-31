import Foundation
import CoreLocation

class CompassViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var trueHeading: Double = 0
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
            }
        }
    }
}


