//
//  ViewController.swift
//  MapsComponent
//
//  Created by Eli Motycka on 6/5/15.
//  Copyright (c) 2015 Findr. All rights reserved.
//

import UIKit
import MapKit
import GoogleMaps

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var camera = GMSCameraPosition.cameraWithLatitude(41.8262, longitude: -71.4032, zoom: 12)
        var mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        var demoMarker = GMSMarker()
        demoMarker.position = camera.target
        demoMarker.snippet = "I lost my Canada Goose jacket!"
        demoMarker.appearAnimation = kGMSMarkerAnimationPop
        demoMarker.map = mapView
        self.view = mapView
        // Do any additional setup after loading the view, typically from a nib.
    }

    
}

class Waypoint: Entry, Printable
{
    
    var info: String? {
        set{
            attributes["desc"] = newValue
        }
        get{
            return attributes["desc"]
        }
    }
}


class Entry: NSObject, Printable
{
    var links = [Link]()
    var attributes = [String:String]()
    
    var name: String? {
        set{
            attributes["name"] = newValue
        }
        get{
            return attributes["name"]
        }
    }
    
    override var description: String {
        var descriptions = [String]()
        if attributes.count > 0 {descriptions.append("attributes=\(attributes)")}
        if links.count > 0 { descriptions.append("links=\(links)")}
        return " ".join(descriptions)
    }
}

class Link: Printable
{
    var href: String
    var linkattributes = [String:String]()
    
    init(href: String) {
        self.href = href
    }
    
    var url: NSURL? { return NSURL(string: href) }
    var text: String? { return linkattributes["text"] }
    var type: String? { return linkattributes["type"] }
    
    var description: String {
        var descriptions = [String]()
        descriptions.append("href=\(href)")
        if linkattributes.count > 0 {descriptions.append("linkattributes=\(linkattributes)")}
        return "[" + " ".join(descriptions) + "]"
    }
}

