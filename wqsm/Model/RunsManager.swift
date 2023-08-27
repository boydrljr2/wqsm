//
//  RunsManager.swift
//  wqsm
//
//  Created by bobsDevMac on 8/27/23.
//

import Foundation

class RunsManager: ObservableObject {
    
    @Published var runs : [Run] = [
        Run(id: 0, name: "EB1 (MON) SUNOL",
            serial: "2303889", wn: "WN",
            numberSites: 5, numberCompleted: 5, numberOffline: 0, numberTasks: 0),
        Run(id: 1, name: "Sunol NRD Pickup",
            serial: "", wn: "WN",
            numberSites: 0, numberCompleted: 0, numberOffline: 0, numberTasks: 0),
        Run(id: 2, name: "CITY A1 w/SE",
            serial: "2304028", wn: "WN",
            numberSites: 7, numberCompleted: 5, numberOffline: 2, numberTasks: 0),
        Run(id: 3, name: "CITY A2",
            serial: "2304024", wn: "WN",
            numberSites: 9, numberCompleted: 8, numberOffline: 1, numberTasks: 1),
        Run(id: 4, name: "City Deliver Sample Millbrae to Sunol",
            serial: "", wn: "WN, BH",
            numberSites: 0, numberCompleted: 0, numberOffline: 0, numberTasks: 0),
    ]
}
