//
//  LocalManager.swift
//  emergency
//
//  Created by 이득령 on 10/9/24.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    /// 위치 권한 물어보기
    func requestLocationPermission() {
//        locationManager.requestWhenInUseAuthorization()
        // 또는 항상 사용 권한을 위해
         locationManager.requestAlwaysAuthorization()
    }
    
    func startLocationUpdates() {
        locationManager.startUpdatingLocation()
    }
    /// 위치 정보 받아오기
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("Latitude: \(location.coordinate.latitude), Longitude: \(location.coordinate.longitude)")
        }
    }
}
