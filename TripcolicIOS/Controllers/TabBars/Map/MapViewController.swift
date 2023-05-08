//
//  MapViewController.swift
//  TripcolicIOS
//
//  Created by Hümeyra SAYIM on 2/15/23.
//

import UIKit
import MapKit
import CoreLocation
import Popover

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITextFieldDelegate{
    
    //MARK: variables

    @IBOutlet weak var mapView: MKMapView!
    var locationManager: CLLocationManager?
    lazy var searchTextField : UITextField = {
        let searchTextField = UITextField()
        searchTextField.delegate = self
        searchTextField.layer.cornerRadius = 10
        searchTextField.clipsToBounds = true
        searchTextField.backgroundColor = UIColor.white
        searchTextField.placeholder = "Search"
        searchTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        searchTextField.leftViewMode = .always
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        return searchTextField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

        mapView.delegate = self
        
        locationManager?.delegate = self
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startUpdatingLocation()
        
        let gestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(chooseLocation(gestureRecognizer:)))
        gestureRecognizer.minimumPressDuration = 3
        mapView.addGestureRecognizer(gestureRecognizer)
        
        
        
        
        
    }
    
    //MARK: functions
    
    private func setupUI(){
        
        view.addSubview(searchTextField)
        
        //buttons
        
        
        //search button constaints
        searchTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchTextField.widthAnchor.constraint(equalToConstant: view.bounds.size.width/1.2).isActive = true
        searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80).isActive = true
        searchTextField.returnKeyType = .go
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = CLLocationCoordinate2D(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 10.0, longitudeDelta: 10.0)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
    }
    
    private func presentPlacesSheet(places: [PlaceAnnotation]){
        
        guard let locationManager = locationManager,
              let userLocation = locationManager.location else {return}
            let placesTVC = PlacesTableViewController(userLocation: userLocation, places: places)
            placesTVC.modalPresentationStyle = .pageSheet
            
            if let sheet = placesTVC.sheetPresentationController{
                sheet.prefersGrabberVisible = true
                sheet.detents = [.medium(), .large()]
                present(placesTVC, animated: true)
            }
        
    }
    
    func findNearbyPlaces(by query: String){
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = mapView.region
        
        let search = MKLocalSearch(request: request)
        search.start { response, error in
            guard let response = response, error == nil else {return}
            let places = response.mapItems.map(PlaceAnnotation.init)
            places.forEach { place in
                self.mapView.addAnnotation(place)
            }
            self.presentPlacesSheet(places: places)
            print(places)
            
        }
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let searchText = searchTextField.text ?? ""
        if !searchText.isEmpty {
            searchTextField.resignFirstResponder()
            //find nearby
            findNearbyPlaces(by: searchText)
        }
        return true
    }
    
    private func goTapped(_ sender: Any) {
        
        let startPoint = CGPoint(x: self.view.frame.width - 60, y: 55)
        let aView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 180))
        let popover = Popover()
        popover.show(aView, point: startPoint)
            /*let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpVC") as! PopUpMapViewController
            self.addChild(popUpVC)
            popUpVC.view.frame = self.view.frame
            self.view.addSubview(popUpVC.view)

            popUpVC.didMove(toParent: self)*/
        }
    
    @objc func chooseLocation(gestureRecognizer:UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began{
            goTapped((Any).self)
            let touchedPoint = gestureRecognizer.location(in: self.mapView)
            let touchedCoordinate = self.mapView.convert(touchedPoint, toCoordinateFrom: self.mapView)
            
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = touchedCoordinate
            //annotation.title = titleText.text
            //annotation.subtitle = subtitleText.text
            self.mapView.addAnnotation(annotation)
            
            
            
            
        }
    }
    
    
    

    

}
