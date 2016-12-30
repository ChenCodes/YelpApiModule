//
//  SearchController.swift
//  Yelp
//
//  Created by Jack Chen on 12/29/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import CoreLocation
var selectionMade = "none"
var currentLocation = ["37.785771,-122.406165"]

class SearchController: UIViewController, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        currentLocation = [String(location.coordinate.latitude) + "," + String(location.coordinate.longitude)]
    }
    
    
    

    
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        if segmentControl.selectedSegmentIndex == 0 {
            print("i chose nightlife")
            selectionMade = "nightlife"
        } else if segmentControl.selectedSegmentIndex == 1 {
            print("i chose food")
            selectionMade = "food"
        } else if segmentControl.selectedSegmentIndex == 2 {
            selectionMade = "recreation"
            print("i chose recreation")
        } else {
            print("i chose laidback")
            selectionMade = "laidback"
        }
        self.performSegue(withIdentifier: "showResults", sender: nil)
        
    }
    
   

}
