//
//  NavigatorView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var currentSpeed: CLLocationSpeed = 0.0

    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.currentSpeed = location.speed * 3.6 // Convert m/s to km/h
        }
    }
}

struct NavigationView: View {
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        VStack {
            Text("Current Speed: \(String(format: "%.1f", locationManager.currentSpeed)) km/h")
                            .font(.title)
                            .padding()

            Spacer()
        }
    }
}

#Preview {
    NavigationView()
}

