//
//  InfoWindowViewController.swift
//  OlaMapCoreExample
//
//  Created by Abhishek Ravi on 06/08/24.
//

import UIKit
import OlaMapCore

class InfoWindowViewController: UIViewController {
    
    let olaCampus = OlaCoordinate(latitude: 12.93177, longitude: 77.616370000000003)
    
    private let olaMap = OlaMapService(auth: .apiKey(key: Utility.getAPIKey()), tileURL: Utility.getTileURL(), projectId: Utility.getWorkspaceID())
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        initializeView()
    }
    
    func initializeView() {
        self.view.backgroundColor = UIColor.white
        
        olaMap.loadMap(onView: self.view)
        olaMap.addCurrentLocationButton(self.view)
        olaMap.setCurrentLocationMarkerColor(UIColor.systemBlue)
        olaMap.setRotatingGesture(true)
        olaMap.setDebugLogs(true)
        olaMap.delegate = self
        olaMap.setMaxZoomLevel(16.0)
    }
    
    func createInfoWindow() {
        let toolTipId = "tool-tip"
        let infoWindow = InfoAnnotationView(identifier: toolTipId, model: InfoAnnotationDecorator(), text: "I'm at OlaCampus", isActive: true)
        self.olaMap.setAnnotationMarker(at: self.olaCampus, annotationView: infoWindow, identifier: toolTipId)
    }
    
}

extension InfoWindowViewController: OlaMapServiceDelegate {
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
    
        // Create Info Window
        self.createInfoWindow()
        
        self.olaMap.setZoomLevel(14.0)
        
        // Set Camera
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.olaMap.setCamera(at: OlaCoordinate(latitude: 12.93177, longitude: 77.616370000000003), zoomLevel: 18)
        })
    
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
