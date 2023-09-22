//
//  Run2.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

//struct AllDataModel: Identifiable {
struct RunModel : Identifiable {
    //var id: Int
    var id = UUID()
    var name: String
    var serial: String
    var wn : String
    var numberSites: Int
    var numberCompleted : Int
    var numberOffline: Int
    var numberTasks: Int
    
    var sites: [SiteModel]
    
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
