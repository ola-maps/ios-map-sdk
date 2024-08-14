//
//  Polyline.swift
//  OlaMapExample
//
//  Created by Abhishek Ravi on 11/04/24.
//

import UIKit
import OlaMapCore

class PolylineViewController: UIViewController {
    
    let polylineSetOlaToKormangla: [OlaCoordinate] = [
        OlaCoordinate(latitude: 12.93177, longitude: 77.616370000000003),
        OlaCoordinate(latitude: 12.93168, longitude: 77.616870000000006),
        OlaCoordinate(latitude: 12.931610000000001, longitude: 77.616900000000001),
        OlaCoordinate(latitude: 12.931000000000001, longitude: 77.616770000000002),
        OlaCoordinate(latitude: 12.93097, longitude: 77.616709999999997),
        OlaCoordinate(latitude: 12.931480000000001, longitude: 77.614249999999998),
        OlaCoordinate(latitude: 12.93075, longitude: 77.614389999999986),
        OlaCoordinate(latitude: 12.93022, longitude: 77.61472999999998),
        OlaCoordinate(latitude: 12.92999, longitude: 77.614869999999982),
        OlaCoordinate(latitude: 12.929869999999999, longitude: 77.614949999999979),
        OlaCoordinate(latitude: 12.92981, longitude: 77.615049999999982),
        OlaCoordinate(latitude: 12.92975, longitude: 77.615239999999985),
    ]
    
    private let olaMap = OlaMapService(auth: .apiKey(key: Utility.getAPIKey()), tileURL: Utility.getTileURL(), projectId: Utility.getWorkspaceID())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        prepareMap()
    }
    
    private func initializeView() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func prepareMap() {
        olaMap.loadMap(onView: self.view)
        olaMap.addCurrentLocationButton(self.view)
        olaMap.setCurrentLocationMarkerColor(UIColor.systemBlue)
        olaMap.setRotatingGesture(true)
        olaMap.delegate = self
        olaMap.refreshMap()
        olaMap.setMaxZoomLevel(16.0)
    }
    
    private func plotPolyline() {
        // Draw Polyline
        self.olaMap.showPolyline(identifier: "polyline-id", .solid, self.polylineSetOlaToKormangla, .black)
        
        // Set Visible Map Bounds
        self.olaMap.setMapCamera(self.polylineSetOlaToKormangla)
        
        // Draw Drop Marker
        let dropAnnotation = CustomAnnotationView(identifier: "drop", image: UIImage(named: "img_drop"))
        dropAnnotation.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.olaMap.setAnnotationMarker(at: self.polylineSetOlaToKormangla.last!, annotationView: dropAnnotation, identifier: "dropAnnotation.identifier")
        
        // Draw Pickup Marker
        let pickupAnnotation = CustomAnnotationView(identifier: "pickup", image: UIImage(named: "img_pickup"))
        pickupAnnotation.bounds = CGRect(x: 0, y: 0, width: 30, height: 30)
        self.olaMap.setAnnotationMarker(at: self.polylineSetOlaToKormangla.first!, annotationView: pickupAnnotation, identifier: "pickupAnnotation.identifier")
        
        olaMap.setZoomLevel(14.0)
        
        // Set Camera
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.olaMap.setMapCamera(self.polylineSetOlaToKormangla)
        })
    }
    
}

extension PolylineViewController: OlaMapServiceDelegate {
    func didChangeCamera() {}
    func regionIsChanging(_ gesture: OlaMapGesture) {}
    
    func mapFailedToLoad(_ error: Error) {
        print("⚠️ Map Error: \(error.localizedDescription)")
    }
    
    func mapSuccessfullyLoaded() {
        // Since, You need Map to be loaded, before you draw any polyline.
        // Make sure, Map Tiles are loaded before doing any UI activity.
        plotPolyline()
    }
    
}
