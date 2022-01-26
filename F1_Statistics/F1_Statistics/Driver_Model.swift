//
//  Driver_Model.swift
//  F1_Statistics
//
//  Created by Fabian Kopf on 13.01.22.
//

import Foundation
import CoreText

/*
 Structure of an Entry
 */
class Driver{
    var driverNumber = 0
    var nameDriver = ""
    var birthDate = ""
    var nation = ""
    var team = ""
    var points = ""
}
/*
 The array of entries
 */
class Driver_Model{
    var drivers = [Driver]()
}
