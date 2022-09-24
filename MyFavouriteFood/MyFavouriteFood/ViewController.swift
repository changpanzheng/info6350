//
//  ViewController.swift
//  MyFavouriteFood
//
//  Created by CHANGPAN ZHENG on 9/23/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    /*
     1. add a table view to the controller
     2. streach the table view so that it occupies whole screen
     3. add a table view cell to the table
     4. add cell indentifier in the left column menu
     5. drag and drop an outlet for the tableview on the code name it tblView
     6. add UITableViewDelegate, UITableViewDataSource as the protocols on the view controller class
     7. compiler will start complaining and click on the dot and add the function stubs
     8. in viewDidLoad add tblView.delegate = self and tblView.dataSource = self
     9. create and array which will act as data source for now
     10. in the tableView func for numberOfRowsInSection return array.count value
     11. in the tableView func for cellForRowAt, create a variable for cell and assign it to tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
     12. assign value to the cell's text view.text
     13. return the cell
     */

    @IBOutlet weak var tblView: UITableView!
    
    let foodList = ["Beef Don Rice", "Beef Noodle Soup", "Bubble tea", "Sushi", "Teriyaki Chicken", "Curry Katsu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tblView.delegate = self
        tblView.dataSource = self
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = foodList[indexPath.row]
        return cell
    }

}

