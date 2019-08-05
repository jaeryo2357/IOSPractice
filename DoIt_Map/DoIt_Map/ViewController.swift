//
//  ViewController.swift
//  DoIt_Map
//
//  Created by YangMinUk on 05/08/2019.
//  Copyright © 2019 YangMinUk. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController , CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    
    @IBOutlet weak var lblLocationinfo1: UILabel!
    @IBOutlet weak var lblLocationinfo2: UILabel!
    
    let locationMananger = CLLocationManager()
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        
        lblLocationinfo1.text = ""
        lblLocationinfo2.text = ""
        locationMananger.delegate = self
        locationMananger.desiredAccuracy = kCLLocationAccuracyBest //정확도를 최고로
        locationMananger.requestWhenInUseAuthorization()//위치 데이터를 추적하기 위해 사용자에게 승인
        locationMananger.startUpdatingLocation()//위치 업데이트 시작
        myMap.showsUserLocation = true // 위치 보기 값 true
        // Do any additional setup after loading the view.
    }

    func goLocation(latitudeValue: CLLocationDegrees, longitudeValue:CLLocationDegrees , delta span :Double) -> CLLocationCoordinate2D{
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        let spanValue = MKCoordinateSpan(latitudeDelta: span,longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation,span: spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func locationManager(_ manager: CLLocationManager , didUpdateLocations locations: [CLLocation]) {
        
        let pLoaction = locations.last
        _ = goLocation(latitudeValue: (pLoaction?.coordinate.latitude)!, longitudeValue: (pLoaction?.coordinate.longitude)!, delta: 0.01)
        
        CLGeocoder().reverseGeocodeLocation(pLoaction!, completionHandler: {(placemarks,error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil {
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil{
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationinfo2.text = address
            self.lblLocationinfo1.text = "현재 위치"
            
        })
        locationMananger.stopUpdatingLocation()
    }

    func setAnonotation(latitudeValue: CLLocationDegrees, longitudeValue :CLLocationDegrees, delta span: Double, title strTitle:String , subtitle strSubtitle:String){
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitudeValue: latitudeValue, longitudeValue: longitudeValue, delta: span)
        
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    
    @IBAction func sgChangeLoaction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            self.lblLocationinfo1.text = ""
            self.lblLocationinfo2.text = ""
            locationMananger.stopUpdatingLocation()
        }else if sender.selectedSegmentIndex == 1{
            setAnonotation(latitudeValue: 37.751853, longitudeValue: 128.87605740000004, delta: 1, title: "한국 폴리텍대학 강릉캠퍼스", subtitle: "강원도 강릉시 남산초교길 121")
            self.lblLocationinfo1.text = "보고 계신 위치"
            self.lblLocationinfo2.text = "한국폴리텍대학 강릉캠퍼스"
        }else if sender.selectedSegmentIndex == 2{
            setAnonotation(latitudeValue: 37.5307871, longitudeValue: 126.8981, delta: 0.1, title: "이지스퍼블리싱", subtitle: "서울시 영등포구 당산로 41길 11")
            self.lblLocationinfo1.text = "보고 계신 위치"
            self.lblLocationinfo2.text = "이지스퍼블리싱 출판사"
        }
    }
}

