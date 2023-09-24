//
//  BottlesCollect.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation
import Combine

class BottleModel : Identifiable, ObservableObject {
    var id = UUID()
    @Published var name: String
    @Published var collected: Bool
    @Published var collectedTimeStamp: String
    
    init(name: String, collected: Bool, collectedTimeStamp : String) {
        self.name = name
        self.collected = collected
        self.collectedTimeStamp = collectedTimeStamp
    }
}
