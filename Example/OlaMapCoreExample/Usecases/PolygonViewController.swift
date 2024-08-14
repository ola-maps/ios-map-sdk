//
//  PolygonViewController.swift
//  OlaMapExample
//
//  Created by Abhishek Ravi on 12/04/24.
//

import UIKit
import OlaMapCore

class PolygonViewController: UIViewController {
    
    private let olaMap = OlaMapService(auth: .apiKey(key: Utility.getAPIKey()), tileURL: Utility.getTileURL(), projectId: Utility.getWorkspaceID())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        drawMap()
    }
    
    private func initializeView() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func drawMap() {
        olaMap.loadMap(onView: self.view)
        olaMap.addCurrentLocationButton(self.view)
        olaMap.setCurrentLocationMarkerColor(UIColor.systemBlue)
        olaMap.setRotatingGesture(true)
        olaMap.refreshMap()
        olaMap.delegate = self
        olaMap.setMaxZoomLevel(16.0)
    }
 
    private func drawPolygon() {
        
        let coordinates: [OlaCoordinate] = [
            OlaCoordinate(latitude: 12.9320745, longitude: 77.6137873),
            OlaCoordinate(latitude: 12.931336, longitude: 77.6141494),
            OlaCoordinate(latitude: 12.9308027, longitude: 77.6167565),
            OlaCoordinate(latitude: 12.9317333, longitude: 77.6170891),
            OlaCoordinate(latitude: 12.9322679, longitude: 77.6142218),
            OlaCoordinate(latitude: 12.9320745, longitude: 77.6137873),
        ]
        let strokeColor: UIColor = UIColor.black
        let strokeWidth: CGFloat = 2.5
        let zoneColor: UIColor = UIColor.systemGreen.withAlphaComponent(0.25)
        
        olaMap.drawPolygon(identifier: "polygon-id", coordinates, zoneColor: zoneColor, strokeColor: strokeColor, storkeWidth: strokeWidth)
        olaMap.setZoomLevel(14.0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.olaMap.setMapCamera(coordinates)
        })
    }
    
}


extension PolygonViewController: OlaMapServiceDelegate {
    func didChangeCamera() {
        
    }
    
    func regionIsChanging(_ gesture: OlaMapGesture) {
        
    }
    
    func mapFailedToLoad(_ error: Error) {
       print("Error: \(error)")
    }
    
    func mapSuccessfullyLoaded() {
        print("Map Loaded Successfully")
        drawPolygon()
    }
    
    func mapSuccessfullyLoadedStyle() {
        print("Map Loaded Style")
    }
}
