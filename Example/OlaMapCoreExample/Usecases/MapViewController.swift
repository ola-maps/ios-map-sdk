//
//  MapViewController.swift
//  OlaMapExample
//
//  Created by Abhishek Ravi on 11/04/24.
//

import UIKit
import OlaMapCore

class MapViewController: UIViewController {
       
    private let olaMap = OlaMapService(auth: .apiKey(key: Utility.getAPIKey()), tileURL: Utility.getTileURL(), projectId: Utility.getWorkspaceID())
    
    private let olaCampus = OlaCoordinate(latitude: 12.931338847365243, longitude: 77.61379390135293)
    
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
        olaMap.setDebugLogs(true)
        olaMap.delegate = self
        olaMap.setMaxZoomLevel(16.0)
    }
    
}

extension MapViewController: OlaMapServiceDelegate {
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
        olaMap.setZoomLevel(14.0)
    }
    
    func mapSuccessfullyLoadedStyle() {
        print("Map Loaded Style")
    }
    
    func didTapOnMap(_ coordinate: OlaCoordinate) {
        
    }
    
    func didTapOnMap(feature: POIModel) {
        
    }
    
    func didLongTapOnMap(_ coordinate: OlaCoordinate) {
        
    }

}
