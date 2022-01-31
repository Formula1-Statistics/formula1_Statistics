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
        nameLabel.text = driver?.nameDriver
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameLabel: UILabel!
}

