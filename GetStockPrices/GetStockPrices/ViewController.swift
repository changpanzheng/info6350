//
//  ViewController.swift
//  GetStockPrices
//
//  Created by Drillmaps on 10/12/22.
//

import UIKit
import SwiftyJSON
import IQKeyboardManagerSwift
import SwiftSpinner
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var myArray = [String]()
    var selectedIndex = 0
    var selectedSymbol = ""
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getData() // calling APi
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = myArray[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "segueDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueDetail") {
            let destVC = segue.destination as! DetailViewController
            let selectedStock = myArray[selectedIndex]
            let Arr = selectedStock.components(separatedBy: "         ")
            destVC.symbol = Arr[1]
        }
    }
    
    func getData() {
            let url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/allstocks"

            var responseData = AF.request(url).responseJSON { responseData in

                     if responseData.error != nil {
                         print(responseData.error!)
                         return
                     }
                
                let stockData = JSON(responseData.data as Any)
                
                for stocks in stockData {
                    let col = stocks.1
                    let company = col["CompanyName"]
                    let symbol = col["Symbol"]
                    let price = col["Price"]
                    let res = "\(company)         \(symbol)          $\(price)"
                    self.myArray.append(res)
                }
                 
                self.tblView.reloadData()
                
         }
}

}
