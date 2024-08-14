//
//  SegmentedPolyline.swift
//  OlaMapCoreExample
//
//  Created by Abhishek Ravi on 25/07/24.
//

import UIKit
import OlaMapCore

class SegmentedPolylineViewController: UIViewController {
    
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
        let polylineEncodedString = "ss|mAcpvxM}@KE@EFKfAAB?DQlACRQ`B?FCTKt@CNOlAANE\\?\\HVJTNXy@\\QF]NoA{CiByEi@sAEKCCO[Uc@q@mAVq@WCqBQwEg@_BKEAOAG@mCg@m@M"
        
        let trafficCongestions = "0,3,0|3,4,0|4,5,0|5,7,0|7,8,0|8,10,10|10,12,10|12,14,10|14,15,10|15,16,0|16,19,5|19,21,5|21,23,0|23,24,0|24,25,0|25,26,0|26,28,0|28,30,5|30,31,5|31,33,5|33,35,5|35,36,5|36,38,5|38,39,5|39,40,0|40,41,0|41,44,0|44,45,0|45,47,0|47,48,5|48,49,5|49,50,0|50,51,0|51,52,0|52,53,0|53,54,0|54,55,0|55,56,0|56,57,0"
        
        self.olaMap.showTrafficPolyline(encodedPolyline: polylineEncodedString, travelAdvisory: trafficCongestions) { polylineID in
            print("Segmented PolylineID: \(polylineID)")
        }
        olaMap.setZoomLevel(14.0)
        
        // Set Visible Map Bounds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.olaMap.setMapCamera(self.polylineSetOlaToKormangla)
        })
    }
    
}

extension SegmentedPolylineViewController: OlaMapServiceDelegate {
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
