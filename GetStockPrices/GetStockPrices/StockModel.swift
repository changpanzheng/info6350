//
//  StockModel.swift
//  GetStockPrices
//
//  Created by CHANGPAN ZHENG on 12/10/22.
//

import Foundation

class StockModel {
    var companyName = ""
    var symbol = ""
    var price = 0.0
    var dayHigh = 0.0
    var dayLow = 0.0
    
    init(_ companyName : String, _ symbol : String) {
        self.companyName = companyName
        self.symbol = symbol
    }
}
