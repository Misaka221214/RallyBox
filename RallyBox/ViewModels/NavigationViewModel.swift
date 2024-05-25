//
//  NavigationViewModel.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-24.
//

import CoreLocation
import Foundation

class NavigationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    let myQueue = DispatchQueue(label: "myOwnQueue")

    var locationManager = CLLocationManager()
    @Published var currentSpeed: Double = 0.0
    @Published var averageSpeed: Double = 0.0
    @Published var sectionSpeedList: [Double] = []

    func startRecordLocation() {
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self

        // TODO: Update to use authorization delegate
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest

        self.myQueue.async {
            if CLLocationManager.locationServicesEnabled() {
                print("Start")
                self.locationManager.startUpdatingLocation()
            }
        }
    }

    func getAverageSpeed() {
        if self.sectionSpeedList.count > 0 {
            var sum = 0.0
            for spd in self.sectionSpeedList {
                sum += spd
            }
            self.averageSpeed = sum / Double(self.sectionSpeedList.count)
        } else {
            self.averageSpeed = 0.0
        }
    }

    func resetSectionSpeedList() {
        self.sectionSpeedList = []
        self.getAverageSpeed()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            self.currentSpeed = location.speed * 3.6 // Convert m/s to km/h
        }
        for loc in locations {
            self.sectionSpeedList.append(loc.speed)
        }
        self.getAverageSpeed()
    }
}
