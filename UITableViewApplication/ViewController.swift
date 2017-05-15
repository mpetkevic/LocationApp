//
//  ViewController.swift
//  UITableViewApplication
//
//  Created by MP Mac on 22/04/2017.
//  Copyright © 2017 MP Mac. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    var myLocationLatitude: Double?
    var mylocationLongitude: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        run()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func run() {
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        //unwrapping needed
        let ac = UIAlertController(title: "Hello, your location:", message: "Latitude: \(myLocationLatitude!) , Longtitude: \(mylocationLongitude!)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        ac.addAction(alertAction)
        present(ac, animated: true, completion: nil)
    }
    
    //MARK: CLLocationManagerDelegate methods
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        myLocationLatitude = location.coordinate.latitude
        mylocationLongitude = location.coordinate.longitude
        print("The location: \(location)")
        manager.stopUpdatingLocation()
        
    }
}
