//
//  BottlesCollect.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

struct Bottle: Identifiable {
    var id: Int
    var name: String
    //Added collected for binding to toggle
    //var collected: Bool
    var collectedTimeStamp: String
}
