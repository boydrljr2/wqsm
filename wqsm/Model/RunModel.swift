//
//  Run2.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation
import Combine

class RunModel : Identifiable, ObservableObject {
    var id = UUID()
    @Published var name: String
    @Published var serial: String
    @Published var wn : String
    @Published var numberSites: Int
    @Published var numberCompleted : Int
    @Published var numberOffline: Int
    @Published var numberTasks: Int
    @Published var sites: [SiteModel]
    
    init( name: String, serial: String, wn: String,
          numberSites: Int,
          numberCompleted: Int,
          numberOffline: Int,
          numberTasks: Int,
          sites: [SiteModel]) {
        self.name = name
        self.serial = serial
        self.wn = wn
        self.numberSites = numberSites
        self.numberCompleted = numberCompleted
        self.numberOffline = numberOffline
        self.numberTasks = numberTasks
        self.sites = sites
    }
    
    var siteCount: Int {
        return sites.count
    }
    var sitesComplete : Int {
        return sites.filter{$0.complete}.count
    }
    
    var bottleCount: Int {
        return sites.reduce(0) { $0 + $1.bottles.count }
    }
    
    var bottlesCollected : Int {
        return sites.reduce(0) { $0 + $1.bottles.filter{$0.collected}.count }
    }
    
}
