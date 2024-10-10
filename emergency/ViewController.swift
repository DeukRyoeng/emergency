//
//  ViewController.swift
//  emergency
//
//  Created by 이득령 on 10/9/24.
//

import UIKit
import SnapKit
import NMapsMap

class ViewController: UIViewController {
    
    let local = LocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("called Viewcontoller - Run App")
        local.requestLocationPermission()
        let mapView = NMFMapView(frame: view.frame)
        view.addSubview(mapView)
        
        local.startLocationUpdates()
    }
    
    
}

