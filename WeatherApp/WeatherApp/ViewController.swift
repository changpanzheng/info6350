//
//  ViewController.swift
//  WeatherApp
//
//  Created by CHANGPAN ZHENG on 11/19/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSpinner
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var txtLocation: UITextField!
    
    let locationManager = CLLocationManager()
    var lat: CLLocationDegrees?
    var lng: CLLocationDegrees?
    
    var weathersArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()
        tblView.delegate = self
        tblView.dataSource = self
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            guard let location = locations.last else { return }
            lat = location.coordinate.latitude
            lng = location.coordinate.longitude
            print(lat)
            print(lng)
    }
    
    @IBAction func getLocation(_ sender: Any) {
        let locStr = "\(self.lat!),\(self.lng!)"
        let apiKey = "AYQR6QM5KHFYVPH9M4EXXJUCC"
        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="
        url += locStr
        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key="
        url += apiKey
        
        AF.request(url).responseJSON { responseData in
            if responseData.error != nil {
                print(responseData.error!)
                return
            }
            
            let weatherData = JSON(responseData.data as Any)
            
            let forecastValues =  weatherData["locations"][locStr]["values"]
            print(forecastValues.count)
            
            self.weathersArray = [String]()
            for forecast in forecastValues {
                let forecastJSON = JSON(forecast.1)
                let temp = forecastJSON["temp"].floatValue
                let conditions = forecastJSON["conditions"].stringValue
//                let dateTime = forecastJSON["datetimeStr"].stringValue.prefix(10)
                self.weathersArray.append("Temperature: \(temp), \(conditions)")
                print(forecast)
            }
            self.tblView.reloadData()
        }
    }
    
    @IBAction func getWeather(_ sender: Any) {
        let apiKey = "AYQR6QM5KHFYVPH9M4EXXJUCC"
        let address = txtLocation.text!
        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="
        
        url += address
        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key="
        url += apiKey
        
        AF.request(url).responseJSON { responseData in
            //print(responseData)

            if responseData.error != nil {
                print(responseData.error!)
                return
            }

            let weatherData = JSON(responseData.data as Any)
            
            let forecastValues =  weatherData["locations"][address]["values"]
            print(forecastValues.count)
            self.weathersArray = [String]()
            
            for forecast in forecastValues {
                let forecastJSON = JSON(forecast.1)
                let temp = forecastJSON["temp"].floatValue
                let conditions = forecastJSON["conditions"].stringValue
                let combine = "Temperature: \(temp), \(conditions)"
                self.weathersArray.append(combine)
            }
            
            self.tblView.reloadData()
            
//            print(tempsArray.count)
            
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = weathersArray[indexPath.row]
        return cell
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
}

