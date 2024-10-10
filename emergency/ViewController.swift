//
//  ViewController.swift
//  emergency
//
//  Created by 이득령 on 10/9/24.
//

import UIKit
import SnapKit
import NMapsMap
import CoreLocation

class ViewController: UIViewController {
    
    var locationManager  = CLLocationManager()
    var latitude: Double?
    var longtitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("called Viewcontoller - Run App")
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        setLocation()
        locationSetting()

        guard let lat = latitude else { return }
        guard let lng = longtitude else { return }
        let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: lat, lng: lng))
        mapView.moveCamera(cameraUpdate)
  }
}

// 지도 카메라 관련
extension ViewController {

    private func setLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
    func startLoactionUpdates() {
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("didUpdateLocations")
        if let location = locations.first {
            print("위도: \(location.coordinate.latitude)")
            print("경도: \(location.coordinate.longitude)")
            
            self.longtitude = location.coordinate.longitude
            self.latitude = location.coordinate.latitude
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            switch status {
            case .authorizedAlways, .authorizedWhenInUse:
                print("권한 설정됨")
            case .notDetermined:
                print("권한 설정되지 않음")
            case .restricted:
                print("권한 요청 거부됨")
            default:
                print("GPS default")
                
            }
        }
    }
    func locationSetting() {
        guard let long = locationManager.location?.coordinate.longitude else { return }
        guard let lati = locationManager.location?.coordinate.latitude else { return }
        longtitude = long
        latitude = lati
    }
}
