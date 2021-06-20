//
//  TopTenViwController.swift
//  exc1
//
//  Created by user196211 .
//

import UIKit
import MapKit
import CoreLocation
class TopTenViewController: UIViewController , CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn10: UIButton!
    var location: CLLocation!
    var topTenPlayers  = ["Rami", "Yosi", "Ala", "Noi" , "Amir","razi", "ela" , "sami" , "mai" , "dani"]
    let manager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        btn1.setTitle(topTenPlayers[0], for: .normal)
        btn2.setTitle(topTenPlayers[1], for: .normal)
        btn3.setTitle(topTenPlayers[2], for: .normal)
        btn4.setTitle(topTenPlayers[3], for: .normal)
        btn5.setTitle(topTenPlayers[4], for: .normal)
        btn6.setTitle(topTenPlayers[5], for: .normal)
        btn7.setTitle(topTenPlayers[6], for: .normal)
        btn8.setTitle(topTenPlayers[7], for: .normal)
        btn9.setTitle(topTenPlayers[8], for: .normal)
        btn10.setTitle(topTenPlayers[9], for: .normal)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.delegate = self
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        mapView.showsUserLocation = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first{
            manager.startUpdatingLocation()
            render(location)
       }
        
    }

    @IBAction func btn1(sender: AnyObject) {

        let center = CLLocationCoordinate2D(latitude: 24.67 , longitude: 44.67)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))

        self.mapView.setRegion(region, animated: true)
}


    
    func render(_ location: CLLocation){
        let coordinate =  CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let region = MKCoordinateRegion(center: coordinate , span: span)
        mapView.setRegion(region, animated: true)
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        mapView.addAnnotation(pin)
    }
    
}

