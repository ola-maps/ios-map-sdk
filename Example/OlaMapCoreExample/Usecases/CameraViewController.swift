//
//  CameraViewController.swift
//  OlaMapCoreExample
//
//  Created by Abhishek Ravi on 25/07/24.
//

import UIKit
import OlaMapCore

class CameraViewController: UIViewController {
    
    let OlaToKormanglaCoordinates: [OlaCoordinate] = [
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
        olaMap.delegate = self
    }
    
}

extension CameraViewController: OlaMapServiceDelegate {
    func didChangeCamera() {
        
    }
    
    func regionIsChanging(_ gesture: OlaMapGesture) {
        //TODO:
    }
    
    func mapFailedToLoad(_ error: Error) {
       print("Error: \(error)")
    }
    
    func mapSuccessfullyLoaded() {
        print("Map Loaded Successfully")
        self.olaMap.recenterMapToUserLocation(zoomLevel: nil)
        
        self.olaMap.setZoomLevel(14.0)
        
        // Set Camera With Single Coordinate
        //olaMap.setCamera(at: OlaCoordinate(latitude: 12.93177, longitude: 77.616370000000003), zoomLevel: 18)
        
        // Set Camera With Array of Coordinates
        //olaMap.setMapCamera(OlaToKormanglaCoordinates, UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    func mapSuccessfullyLoadedStyle() {
        print("Map Loaded Style")
    }
    

}
