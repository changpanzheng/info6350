//
//  MyFavouriteFoodClassTableViewController.swift
//  MyFavouriteFoodController
//
//  Created by CHANGPAN ZHENG on 9/24/22.
//

import UIKit

class MyFavouriteFoodClassTableViewController: UITableViewController {
    
    let foodList = ["Beef Don Rice", "Beef Noodle Soup", "Bubble tea", "Sushi", "Teriyaki Chicken", "Curry Katsu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return foodList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = foodList[indexPath.row]

        return cell
    }

}
