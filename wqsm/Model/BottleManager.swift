//
//  BottleManager.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

class BottleManager: ObservableObject {
    
    //Added collected for toggle
    @Published var bottles : [Bottle] = [
        //Bottle( id: 0, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
        //Bottle( id: 1, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
        Bottle( id: 0, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
        Bottle( id: 1, name: "250ml _GRAB_P_4~C(1) ", collected: true, collectedTimeStamp: "")
    ]
}
