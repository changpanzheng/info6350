//
//  ViewController.swift
//  TouristApp
//
//  Created by CHANGPAN ZHENG on 9/26/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let touristNames = ["Seattle", "Bellevue", "Kirkland", "Redmond", "Olympia", "Renton", "Tacoma", "Spokane"]
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return touristNames.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let cell = Bundle.main.loadNibNamed("TouristCell", owner: self)?.first as! TouristCell
        
        // cell.textLabel?.text = cityNames[indexPath.row]
        cell.imgTourist.image = UIImage(named: touristNames[indexPath.row])
        cell.lblTourist.text = touristNames[indexPath.row]
        
        return cell
    }
}

