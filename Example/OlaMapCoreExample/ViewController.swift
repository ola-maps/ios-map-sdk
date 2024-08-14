//
//  ViewController.swift
//  OlaMapCoreExample
//
//  Created by Abhishek Ravi on 24/07/24.
//

import UIKit
import OlaMapCore

enum CodeSnippet: CaseIterable {
    case loadMap
    case camera
    case drawPolyline
    case drawPolygon
    case drawAnnotation
    case drawInfoWindow
    case segmnetedPolyline
    case mapEvent
    
    var titleText: String {
        switch self {
        case .loadMap:
            return "Dynamic Map"
        case .camera:
            return "Camera and View"
        case .drawPolyline:
            return "Polyline"
        case .drawPolygon:
            return "Shape"
        case .drawAnnotation:
            return "Marker"
        case .segmnetedPolyline:
            return "Traffic Polyline"
        case .drawInfoWindow:
            return "Info Window"
        case .mapEvent:
            return "Map Events and Gesture"
        }
    }
    
    var descriptionText: String {
        switch self {
        case .loadMap:
            "Load Map and Current Location"
        case .camera:
             "Control POV Area and Current Location"
        case .drawPolyline:
            "Draw Solid Polyline"
        case .drawPolygon:
            "Draw Gemoterical Shape Polygon"
        case .drawAnnotation:
            "Draw UIView or UIImage on the Map Tile"
        case .segmnetedPolyline:
            "Traffic Polyline on Map Tile"
        case .drawInfoWindow:
            "Draw Tooltip View on Map Tile"
        case .mapEvent:
            "Gesture on Map"
        }
    }
}

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        initializeView()
        prepareView()
    }

    private func initializeView() {
        self.view.backgroundColor = UIColor.white
        self.tableView.backgroundColor = UIColor.white
    }
    
    func prepareView() {
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CodeSnippet.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = CodeSnippet.allCases[indexPath.row]
        
        let cell = GenericCell()
        cell.setText(text: data.titleText, description: data.descriptionText)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        switch CodeSnippet.allCases[indexPath.row] {
        case .loadMap:
            let vc = MapViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .camera:
            let vc = CameraViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .drawPolyline:
            let vc = PolylineViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .drawPolygon:
            let vc = PolygonViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .drawAnnotation:
            let vc = AnnotationViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .segmnetedPolyline:
            let vc = SegmentedPolylineViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .drawInfoWindow:
            let vc = InfoWindowViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        case .mapEvent:
            let vc = MapEventViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
