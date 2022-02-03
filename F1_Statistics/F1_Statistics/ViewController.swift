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
        print("ViewController")
        nameLabel.text = driver?.nameDriver
        teamLabel.text = driver?.team
        nationLabel.text = driver?.nation
        // numberLabel.text = "\(driver?.driverNumber)"
        birthdateLabel.text = driver?.birthDate
        pointsLabel.text = driver?.points
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var teamLabel: UILabel!
    @IBOutlet weak var nationLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    @IBOutlet weak var pointsLabel: UILabel!
}

