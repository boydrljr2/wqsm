//
//  Run2.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

struct Run2: Identifiable {
    var id: Int
    var name: String
    var serial: String
    var wn : String
    var numberSites: Int
    var numberCompleted : Int
    var numberOffline: Int
    var numberTasks: Int
    
    var sites: [Site]
}
