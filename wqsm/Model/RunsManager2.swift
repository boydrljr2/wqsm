//
//  RunsManager2.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

class RunsManager2: ObservableObject {
    
    @Published var runs2 : [Run2] = [
        Run2(id: 0, name: "EB1 (MON) SUNOL",
            serial: "2303889", wn: "WN",
            numberSites: 5, numberCompleted: 5, numberOffline: 0, numberTasks: 0,
            sites: [
                Site(id: 0, name: "Alameda East"),
                Site(id: 1, name: "IRV_PORTAL"),
                Site(id: 2, name: "SVWTP_EFF"),
                ]
           ),
        Run2(id: 1, name: "Sunol NRD Pickup",
            serial: "", wn: "WN",
            numberSites: 0, numberCompleted: 0, numberOffline: 0, numberTasks: 0,
            sites: [
                Site(id: 3, name: "Alameda West - Site 3"),
                Site(id: 4, name: "ABC_PORTAL - Site 4"),
                Site(id: 5, name: "WXYZ_EFF - Site 5")
                ]
           ),
        Run2(id: 2, name: "CITY A1 w/SE",
            serial: "2304028", wn: "WN",
            numberSites: 7, numberCompleted: 5, numberOffline: 2, numberTasks: 0,
            sites: [
                Site(id: 6, name: "Alameda East Site 6"),
                Site(id: 7, name: "IRV_PORTAL Site 7"),
                Site(id: 8, name: "SVWTP_EFF Site 8")
                ]
           ),
        Run2(id: 3, name: "CITY A2",
            serial: "2304024", wn: "WN",
            numberSites: 9, numberCompleted: 8, numberOffline: 1, numberTasks: 1,
            sites: [
                Site(id: 9, name: "Alameda East Site 9"),
                Site(id: 10, name: "IRV_PORTAL Site 10"),
                Site(id: 11, name: "SVWTP_EFF Site 11")
                ]),
        Run2(id: 4, name: "City Deliver Sample Millbrae to Sunol",
            serial: "", wn: "WN, BH",
            numberSites: 0, numberCompleted: 0, numberOffline: 0, numberTasks: 0,
            sites: [
                Site(id: 12, name: "Alameda East Site 12"),
                Site(id: 13, name: "IRV_PORTAL Site 13"),
                Site(id: 14, name: "SVWTP_EFF Site 14")
                ]
           ),
    ]
}
