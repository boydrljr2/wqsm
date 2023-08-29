//
//  BottleManager.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

class BottleManager: ObservableObject {
    
    @Published var bottles : [Bottle] = [
        Bottle( id: 0, name: "250ml _GRAB_P_4~C(4) ", collectedTimeStamp: "3:35 pm" ),
        Bottle( id: 1, name: "250ml _GRAB_P_4~C(1) ", collectedTimeStamp: "")
    ]
}
