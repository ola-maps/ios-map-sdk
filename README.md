# OlaMap Core 🌍

OlaMapService is your go-to solution for essential map functionality, providing a seamless and intuitive experience for integrating maps into your applications. Whether you need to display interactive maps, plot locations, or offer basic navigation, OlaMapService has you covered. Our robust library includes features like zoom controls, location markers, and customizable map views, making it easy to add powerful mapping capabilities to your project. Designed for simplicity and efficiency, OlaMapService ensures that you can quickly implement and manage maps without the hassle. Enhance your app with the fundamental power of maps using OlaMapService.

## Installation

```
pod 'OlaMapCore', :git => 'https://github.com/ola-map/ios-ola-map-core.git'
```

Or, You download the `XCFrameworks.zip` files from the last stable release

Unzip the file and drop in your app, make sure you have made `Enmbed and Sign` for all the Framework Files in `General > Frameworks`

Or, You can use Swift Package Manager to install `OlaMapCore` using OlaMapCore

## Features
1. Dynamic Maps
2. Annotation
3. Info Window
4. Controls and gestures
5. Shapes and Geometry
6. Camera and POV

### PreRequisite 
Make sure you have added the following persmission in your app,
```
<key>NSLocationWhenInUseUsageDescription</key>
<string>App wants to access your location</string>
<key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
<string>App wants to access your location</string>
```

### Dynamic Map
```
private let olaMap = OlaMapService(auth: .apiKey(key: "API-KEY"), tileURL: "TILE-URL", projectId: "WORKSPACE-ID")

olaMap.loadMap(onView: self.view)
olaMap.addCurrentLocationButton(self.view)
olaMap.setCurrentLocationMarkerColor(UIColor.systemBlue)
olaMap.setDebugLogs(true)
olaMap.delegate = self
olaMap.setMaxZoomLevel(16.0)
```

### Gestures on Map
This will enable selection capability on Map, 
```
olaMap.setRotatingGesture(true)
```
Then, You will set of extra gesture delegete callback which comes with `OlaMapServiceDelegate`
```
    func didTapOnMap(_ coordinate: OlaCoordinate) {
        //TODO: If You tap on tile
    }
    
    func didTapOnMap(feature: POIModel) {
        //TODO: If You tap on any POI
    }
    
    func didLongTapOnMap(_ coordinate: OlaCoordinate) {
        //TODO: If You long press on tile
    }
    
```

### Info Window
You can draw a Info Window which is a tool tip kind of view on Map, 
```
let toolTipId = "tool-tip"
let infoWindow = InfoAnnotationView(identifier: toolTipId, model: InfoAnnotationDecorator(), text: "I'm at OlaCampus", isActive: true)
self.olaMap.setAnnotationMarker(at: self.olaCampus, annotationView: infoWindow, identifier: toolTipId)
```
And, to delete Info Window you can use
```
olaMap.removeAnnotation(by:"Annotation-ID")
```

### Map Camera
You can control the Map POV and bound area which you want to show.
```
// Set Camera With Single Coordinate
olaMap.setCamera(at: OlaCoordinate(latitude: 12.93177, longitude: 77.616370000000003), zoomLevel: 16.0)

// Set Camera With Array of Coordinates
//olaMap.setMapCamera(OlaToKormanglaCoordinates, UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))

```

### Map Region Bounds
You can control the Map Visible Bound
```
self.olaMap.setMapCamera([coordinate1, coordinate2])
```

### Annotation and Marker
  * Create Annotation
  
  We have created `CustomAnnotationView` Type which is inherited from OlaAnnotation.
  ```
  let cabAnnotation = CustomAnnotationView(identifier: identifier, image: UIImage(named: "IMAGE_NAME"))
  cabAnnotation.bounds = CGRect(x: 0, y: 0, width: 40, height: 40)
  cabAnnotation.setRotate(Double(Int.random(in: 0...360))) // Set Bearing Angle for Cab
  olaMap.setAnnotationMarker(at: coordinate, annotationView: cabAnnotation, identifier: cabAnnotation.identifier)
  ```
  
  * Delete Annotation
  You will need `AnnotationId` to delete any annotation from the map.
  ```
    olaMap.removeAnnotation(by:"Annotation-ID")
  ```

### Polyline

    You will need an array of OlaCoordinates to draw any polyline. Here, we have `polylineSetOlaToKormangla`
    
  * Create Polyline
  ```
    self.olaMap.showPolyline(identifier: "polyline-id", .solid, self.polylineSetOlaToKormangla, .darkGray)
  ```
  * Delete Polyline
  ```
    self.olaMap.deletePolyline("polyline-id")
  ```

### Polygon

* Create Polygon
You need to call `drawPolgon(_:)` to draw Polygon Gemoetry,

 ```
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
olaMap.setMapCamera(coordinates)
 ```
 
 * Remove Polygon
 You need to use `removePolygon(_:)` method
 ```
 self.olaMap.deletePolygon("polygon-id")
 ```

### Segmented Polyline
Along with Solid Polyline, we have the capability to draw Segmented Polyline. This data you will get from `Directions API`. Check Platform Documnetation.
```
let polylineEncodedString = "ss|mAcpvxM}@KE@EFKfAAB?DQlACRQ`B?FCTKt@CNOlAANE\\?\\HVJTNXy@\\QF]NoA{CiByEi@sAEKCCO[Uc@q@mAVq@WCqBQwEg@_BKEAOAG@mCg@m@M"

let trafficCongestions = "0,3,0|3,4,0|4,5,0|5,7,0|7,8,0|8,10,10|10,12,10|12,14,10|14,15,10|15,16,0|16,19,5|19,21,5|21,23,0|23,24,0|24,25,0|25,26,0|26,28,0|28,30,5|30,31,5|31,33,5|33,35,5|35,36,5|36,38,5|38,39,5|39,40,0|40,41,0|41,44,0|44,45,0|45,47,0|47,48,5|48,49,5|49,50,0|50,51,0|51,52,0|52,53,0|53,54,0|54,55,0|55,56,0|56,57,0"

self.olaMap.showTrafficPolyline(encodedPolyline: polylineEncodedString, travelAdvisory: trafficCongestions) { polylineID in
    print("Segmented PolylineID: \(polylineID)")
}
```
