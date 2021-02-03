//
//  mapViewController.swift
//  Stita
//
//  Created by Mohammed Gamal on 7/22/20.
//  Copyright © 2020 codelabs. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps

class mapViewController: UIViewController {
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var confirmBtn: UIButton!
    var window: UIWindow?
    
    var marker: GMSMarker!
    
    // var locationManager = CLLocationManager()
    private lazy var locationManager: CLLocationManager = {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        return locationManager
    }()
    
    override func viewWillAppear(_ animated: Bool) {
                      if #available(iOS 13.0, *) {
                          let app = UIApplication.shared
                          let statusBarHeight: CGFloat = app.statusBarFrame.size.height
                          
                          let statusbarView = UIView()
                          statusbarView.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
                          view.addSubview(statusbarView)
                        
                          statusbarView.translatesAutoresizingMaskIntoConstraints = false
                          statusbarView.heightAnchor
                              .constraint(equalToConstant: statusBarHeight).isActive = true
                          statusbarView.widthAnchor
                              .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
                          statusbarView.topAnchor
                              .constraint(equalTo: view.topAnchor).isActive = true
                          statusbarView.centerXAnchor
                              .constraint(equalTo: view.centerXAnchor).isActive = true
                        
                      } else {
                          let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
                          statusBar?.backgroundColor = UIColor(red: 0.10, green: 0.58, blue: 0.73, alpha: 1.00)
                      }
                  }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    //    marker.icon = UIImage(named: "picker")
        addressLabel.lineBreakMode = .byWordWrapping // notice the 'b' instead of 'B'
                  addressLabel.numberOfLines = 0
        
        addressView.layer.cornerRadius = addressView.frame.size.height / 2
        closeBtn.layer.cornerRadius = closeBtn.frame.size.height / 2
        confirmBtn.layer.cornerRadius = confirmBtn.frame.size.height / 2
        locationManager.delegate = self
               locationManager.requestWhenInUseAuthorization()
            //   mapView.camera = GMSCameraPosition(target: locationManager.location!.coordinate, zoom: 20, bearing: 0, viewingAngle: 0)
              // self.show_marker(position: mapView.camera.target)
               self.mapView.delegate = self
               let polyLine: GMSPolyline = GMSPolyline()
               polyLine.isTappable = true
               mapView.isUserInteractionEnabled = true
               mapView.settings.setAllGesturesEnabled(true)
               mapView.settings.consumesGesturesInView = true
        mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 110, right: 20)
        // Do any additional setup after loading the view.
    }
    @IBAction func closeAction(_ sender: Any) {
        self.performSegue(withIdentifier: "goBack", sender: self)
    }
    @IBAction func confirmAction(_ sender: Any) {
          let  address = self.addressLabel.text
        
        if address != nil {
         
            
               
               let def = UserDefaults.standard
               def.setValue(address, forKey: "address")
            print(address)
              def.setValue(true, forKey: "isLocation")
               def.synchronize()
        
       self.performSegue(withIdentifier: "goBack", sender: self)
        }
    }
    
    
   
}
extension mapViewController: CLLocationManagerDelegate {
    // 2
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // 3
        guard status == .authorizedWhenInUse else {
            return
        }
        // 4
        locationManager.startUpdatingLocation()

        //5
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true

    }

    // 6
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else {
            return
        }
let center = CLLocationCoordinate2D(latitude: locations.last!.coordinate.latitude, longitude: locations.last!.coordinate.longitude)
        // 7
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 20, bearing: 0, viewingAngle: 0)
self.mapView?.isMyLocationEnabled = true
        let marker = GMSMarker(position: center)
        
        print("Latitude :\(center.latitude)")
        print("Longitude :\(center.longitude)")
        
        marker.map = self.mapView
        marker.title = "Current Location"
        marker.isDraggable = true
        marker.icon = UIImage(named: "picker")
        // 8
        locationManager.stopUpdatingLocation()
    }

}
extension mapViewController : GMSMapViewDelegate {
    func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
        print("clicked on marker")
    }
    func mapView(_ mapView: GMSMapView, didLongPressInfoWindowOf marker: GMSMarker) {
         print("long press on marker")
    }
//    func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
//        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: 200, height: 100))
//        view.backgroundColor = UIColor.white
//        view.layer.cornerRadius = 6
//        let title = UILabel(frame: CGRect.init(x: 0, y: 8, width: view.frame.width-16, height: 15))
//        title.text = "Current Location"
//        view.addSubview(title)
//        return view
//    }
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("dragging start")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag")
    }
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("endDrag")
       
    }
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        reverseGeocodeCoordinate(coordinate: position.target)
    }
    
//    func mapView(_ mapView: GMSMapView!, didLongPressAt coordinate: CLLocationCoordinate2D) {
//        let marker = GMSMarker(position: coordinate)
//        marker.title = "Hello World"
//        marker.icon = UIImage(named: "picker")
//        marker.map = mapView
//    }
    func mapView(_ mapView: GMSMapView!, didTapAt coordinate: CLLocationCoordinate2D) {
        mapView.delegate = self
        mapView.clear()
        
        let marker = GMSMarker(position: coordinate)
        marker.title = "Hello World"
        marker.map = mapView
        marker.icon = UIImage(named: "picker")
        print("Tapped at coordinate: " + String(coordinate.latitude) + " "
            + String(coordinate.longitude))
        let  Latitude = coordinate.latitude
        let longitude = coordinate.longitude
        let x = Double(Latitude)
        let y = Double(longitude)
        
        let def = UserDefaults.standard
        def.setValue(x, forKey: "Latitude")
        def.setValue(y, forKey: "Longitude")
        def.synchronize()
        
        // self.navigationController?.popViewController(animated: true)
    }
     func reverseGeocodeCoordinate(coordinate: CLLocationCoordinate2D) {
               
             let geocoder = GMSGeocoder()

                // 2
                geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
                  guard
                    let address = response?.firstResult(),
                    let lines = address.lines
                    else {
                      return
                  }

                  // 3
                  self.addressLabel.text = lines.joined(separator: "\n")

                  // 4
                  UIView.animate(withDuration: 0.25) {
                    self.view.layoutIfNeeded()
                  }
                }

    }
    
}

