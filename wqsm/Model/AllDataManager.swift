//
//  AllData.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

class AllDataManager: ObservableObject {
    
    @Published var allDatas : [AllData] = [
        AllData (id: 0, name: "EB1 (MON) SUNOL",
            serial: "2303889", wn: "WN",
            numberSites: 3, numberCompleted: 2, numberOffline: 1, numberTasks: 12,
            sites: [
                Site2(id: 0, name: "Alameda East", comment: "Enter site comment...",
                      fieldTests : [
                        FieldTest(id: 0, name: "C12 Residual, free", value: "3", time: "3:45pm"),
                        FieldTest(id: 1, name: "Temperature (F)", value: "82", time: "4:05pm"),
                      ],
                      bottles : [
                        Bottle( id: 0, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 1, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]
                     ),
                Site2(id: 1, name: "IRV_PORTAL", comment: "Enter site comment...",
                      fieldTests : [
                        FieldTest(id: 2, name: "Another Test", value: "6", time: "3:45pm"),
                        FieldTest(id: 3, name: "Temperature (F)", value: "80", time: "4:25pm"),
                      ],
                      bottles : [
                        Bottle( id: 2, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 3, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                     ),
                Site2(id: 2, name: "SVWTP_EFF", comment: "Enter site comment...",
                      fieldTests : [
                        FieldTest(id: 2, name: "Another Test", value: "6", time: "3:45pm"),
                        FieldTest(id: 3, name: "Temperature (F)", value: "80", time: "4:25pm"),
                      ],
                      bottles : [
                        Bottle( id: 2, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 3, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                      ),
                ]
           ),
        AllData (id: 1, name: "Sunol NRD Pickup",
                 serial: "", wn: "WN",
                 numberSites: 3, numberCompleted: 2, numberOffline: 1, numberTasks: 12,
            sites: [
                Site2(id: 0, name: "Alameda East", comment: "Comment...",
                      fieldTests : [
                        FieldTest(id: 0, name: "C12 Residual, free", value: "3", time: "3:45pm"),
                        FieldTest(id: 1, name: "Temperature (F)", value: "82", time: "4:05pm"),
                      ],
                      bottles : [
                        Bottle( id: 0, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 1, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]
                     ),
                Site2(id: 1, name: "IRV_PORTAL", comment: "Comment...",
                      fieldTests : [
                        FieldTest(id: 2, name: "Another Test", value: "6", time: "3:45pm"),
                        FieldTest(id: 3, name: "Temperature (F)", value: "80", time: "4:25pm"),
                      ],
                      bottles : [
                        Bottle( id: 2, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 3, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                     ),
                Site2(id: 2, name: "SVWTP_EFF", comment: "Comment...",                      fieldTests : [
                        FieldTest(id: 2, name: "Another Test", value: "6", time: "3:45pm"),
                        FieldTest(id: 3, name: "Temperature (F)", value: "80", time: "4:25pm"),
                      ],
                      bottles : [
                        Bottle( id: 2, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 3, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                      ),
                ]
           ),
    ]
}
