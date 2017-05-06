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
    
    var myLocationLatitude = [Double]()
    var mylocationLongitude = [Double]()
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations [0]
        myLocationLatitude = [location.coordinate.latitude]
        mylocationLongitude = [location.coordinate.longitude]
        
    }
    

    @IBAction func buttonTapped(_ sender: UIButton) {
        let ac = UIAlertController(title: "Hello, your location:", message: "Latitude: \(myLocationLatitude) , Longtitude: \(mylocationLongitude)", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        ac.addAction(alertAction)
        present(ac, animated: true, completion: nil)
        
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestAlwaysAuthorization()
        manager.startUpdatingLocation()
       
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

