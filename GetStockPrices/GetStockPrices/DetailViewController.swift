//
//  DetailsViewController.swift
//  GetStockPrices
//
//  Created by Drillmaps on 10/12/22.
//

import UIKit
import SwiftyJSON
import IQKeyboardManagerSwift
import SwiftSpinner
import Alamofire

class DetailViewController: UIViewController {

    var symbol = ""
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblSymbol: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    let url = "https://us-central1-whatsapp-analytics-2de0e.cloudfunctions.net/app/getstock?symbol=\(symbol)"
        
        var responseData = AF.request(url).responseJSON { responseData in

         if responseData.error != nil {
             print(responseData.error!)
             return
         }
            
            let stockData = JSON(responseData.data as Any)
            self.lblCompanyName.text = stockData["CompanyName"].stringValue
            self.lblSymbol.text = self.symbol
            self.lblPrice.text = stockData["Price"].stringValue
        
        // Do any additional setup after loading the view.
    }
    
}
}
