//
//  MapEventViewController.swift
//  OlaMapCoreExample
//
//  Created by Abhishek Ravi on 07/08/24.
//

import UIKit
import OlaMapCore

class MapEventViewController: UIViewController {
    
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
    
    func showAlert(_ text: String) {
        let alert = UIAlertController(title: "Event", message: text, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        self.present(alert, animated: true)
    }
    
}


extension MapEventViewController: OlaMapServiceDelegate {
    
    func didChangeCamera() {
        
    }
    
    func regionIsChanging(_ gesture: OlaMapGesture) {
        showAlert("Map Region Change")
    }
    
    func mapFailedToLoad(_ error: Error) {
       print("Error: \(error)")
    }
    
    func mapSuccessfullyLoaded() {
        print("Map Loaded Successfully")
        self.olaMap.setZoomLevel(14.0)
    }
    
    func mapSuccessfullyLoadedStyle() {
        print("Map Loaded Style")
    }
    
    func didTapOnMap(_ coordinate: OlaCoordinate) {
        showAlert("Tap on Map")
    }
    
    func didTapOnMap(feature: POIModel) {
        
    }
    
    func didLongTapOnMap(_ coordinate: OlaCoordinate) {
        showAlert("Long Tap on Map")
    }

}

