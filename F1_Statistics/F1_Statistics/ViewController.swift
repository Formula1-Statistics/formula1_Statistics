//
//  ViewController.swift
//  F1_Statistics
//
//  Created by Fabian Kopf on 13.01.22.
//

import UIKit

class ViewController: UIViewController {
    var driver: Driver?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func driverBtn(_ sender: Any) {
        performSegue(withIdentifier: "Dirvers", sender: self)
    }
    
}

