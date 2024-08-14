//
//  AnnotationViewController.swift
//  OlaMapExample
//
//  Created by Abhishek Ravi on 11/04/24.
//

import UIKit
import OlaMapCore

class AnnotationViewController: UIViewController {
    
    // Coordinate
    private let mockCabs: [(id: String, coordinate: OlaCoordinate)] =
    [
        (id: "cab-1", coordinate: OlaCoordinate(latitude: 12.931338847365243, longitude: 77.61379390135293)),
        (id: "cab-2", coordinate: OlaCoordinate(latitude: 12.933679543194902, longitude: 77.61109661767944)),
        (id: "cab-3", coordinate: OlaCoordinate(latitude: 12.928743958845168, longitude: 77.61568855912569)),
        (id: "cab-4", coordinate: OlaCoordinate(latitude: 12.934976163568361, longitude: 77.61311363868853)),
        (id: "cab-5", coordinate: OlaCoordinate(latitude: 12.927865581907366, longitude: 77.62109589204371)),
        (id: "cab-6", coordinate: OlaCoordinate(latitude: 12.938824158544573, longitude: 77.61899304035337)),
    ]
    
    private let mockAutos: [(id: String, coordinate: OlaCoordinate)] = [
        (id: "auto-1", coordinate: OlaCoordinate(latitude: 12.931462725012365, longitude: 77.61405777618216)),
        (id: "auto-2", coordinate: OlaCoordinate(latitude: 12.933930502502783, longitude: 77.61264156994173)),
        (id: "auto-3", coordinate: OlaCoordinate(latitude: 12.93430694099129, longitude: 77.6163752045756)),
    ]
    
    private let olaCampus = OlaCoordinate(latitude: 12.931338847365243, longitude: 77.61379390135293)
    
    // OlaMap Service Reference
    private let olaMap = OlaMapService(auth: .apiKey(key: Utility.getAPIKey()), tileURL: Utility.getTileURL(), projectId: Utility.getWorkspaceID())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeView()
        loadMap()
    }
    
    private func initializeView() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func loadMap() {
        olaMap.loadMap(onView: self.view)
        olaMap.addCurrentLocationButton(self.view)
        olaMap.setCurrentLocationMarkerColor(UIColor.systemBlue)
        olaMap.setRotatingGesture(true)
        olaMap.delegate = self
        olaMap.recenterMapToUserLocation(zoomLevel: nil)
        olaMap.setMaxZoomLevel(24.0)
    }
    
    private func drawAnnotation(identifier: String, at coordinate: OlaCoordinate, image: UIImage) {
        let cabAnnotation = CustomAnnotationView(identifier: identifier, image: image)
        cabAnnotation.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
        cabAnnotation.setRotate(Double(Int.random(in: 0...360))) // Set Bearing Angle for Cab
        olaMap.setAnnotationMarker(at: coordinate, annotationView: cabAnnotation, identifier: "cabAnnotation.identifier")
    }
    
    private func deleteAnnotation(_ annotationId: String) {
        self.olaMap.removeAnnotation(by: annotationId)
    }
    
}

extension AnnotationViewController: OlaMapServiceDelegate {
    func didChangeCamera() {}
    func regionIsChanging(_ gesture: OlaMapGesture) {}
    
    func mapFailedToLoad(_ error: Error) {
        print("⚠️ Map Error: \(error.localizedDescription)")
    }
    
    func mapSuccessfullyLoaded() {
        // Make sure, Map Tiles are loaded before doing any UI activity.
        
        // Create Cabs
        mockCabs.forEach { cab in
            self.drawAnnotation(identifier: cab.id, at: cab.coordinate, image: UIImage(named: "img_cab")!)
        }
        
        // Create Autos
        mockAutos.forEach { auto in
            self.drawAnnotation(identifier: auto.id, at: auto.coordinate, image: UIImage(named: "img_auto")!)
        }
        
        let coordinates: [OlaCoordinate] = mockCabs.map({ $0.1 })
        
        olaMap.setZoomLevel(14.0)
    }
    
}
