//
//  TableViewController.swift
//  F1_Statistics
//
//  Created by Fabian Kopf on 26.01.22.
//

import UIKit

class TableViewController: UITableViewController {
    var queue = DispatchQueue(label: "download")
    var model = Driver_Model()
    let path = "http://localhost:3000/driver"
    var currentDriver: Driver?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: path){
            download(url: url)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func download(url: URL){
        queue.async {
            let tmpModel = self.asyncDownload(url: url)
            DispatchQueue.main.async {
                self.model = tmpModel
                self.tableView.reloadData()
            }
        }
    }
    func asyncDownload(url: URL) -> Driver_Model{
        var model = Driver_Model()
        if let data = try? Data(contentsOf: url){   //checks if there is data to download
            if let json = try? JSONSerialization.jsonObject(with: data, options: []){   //return data of json Object
                if let array = json as? [[String: Any]]{
                    model = parseDriver(array: array)
                }
            }
        }else{
            print("Unable to download")
        }
        return model
    }
    func parseDriver(array: [[String: Any]]) -> Driver_Model{
        let model = Driver_Model()
        for driverList in array{
            let driver = Driver()
            driver.driverNumber = driverList["driverNumber"] as! Int
            driver.nameDriver = driverList["nameDriver"] as! String
            driver.birthDate = driverList["birthDate"] as! String
            driver.nation = driverList["nation"] as! String
            driver.team = driverList["Team"] as! String
            driver.points = driverList["points"] as! String
            model.drivers.append(driver)
        }
        return model
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return model.drivers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "driver", for: indexPath)
        let driver = model.drivers[indexPath.row]
        cell.textLabel?.text = driver.nameDriver
        cell.detailTextLabel?.text = driver.team
        // Configure the cell...

        return cell
    }
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentDriver = model.drivers[indexPath.row]
        performSegue(withIdentifier: "detail", sender: self)
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ViewController{
            viewController.driver = self.currentDriver
        }
    }
    

}
