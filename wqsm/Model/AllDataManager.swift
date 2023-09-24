//
//  AllData.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

class AllDataManager: ObservableObject {
    
    @Published var runs : [RunModel] = [
        
        RunModel (//id: 0,
            name: "EB1 (MON) SUNOL",
            serial: "2303889", wn: "WN",
            numberSites: 3, numberCompleted: 2, numberOffline: 1, numberTasks: 12,
            sites: [
                SiteModel(//id: 0,
                          name: "Alameda East",
                          comment: "PH 8.4",
                          complete : true,
                      fieldTests : [
                        FieldTestModel(//id: 0,
                            name: "C12 Residual, free", value: "3", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 1,
                            name: "Temperature (°F)", value: "95°", measure: "°F", time: "4:05pm"),
                      ],
                      bottles : [
                        BottleModel(//id: 0,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel(//id: 1,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]
                     ),
                SiteModel(//id: 1,
                        name: "IRV_PORTAL",
                          comment: "PH 8.0",
                          complete : true,
                      fieldTests : [
                        FieldTestModel(//id: 2,
                            name: "Another Test", value: "6", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 3,
                            name: "Temperature (°F)", value: "80°", measure: "°F", time: "4:25pm"),
                      ],
                      bottles : [
                        BottleModel(//id: 2,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel(// id: 3,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                     ),
                SiteModel(//id: 2,
                    name: "SVWTP_EFF",
                          comment: "PH 7.9",
                          complete : false,
                      fieldTests : [
                        FieldTestModel(//id: 2,
                            name: "Another Test", value: "6", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 3,
                            name: "Temperature (°F)", value: "80°", measure: "°F", time: "4:25pm"),
                      ],
                      bottles : [
                        BottleModel( //id: 2,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel(// id: 3,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                      ),
                ]
           ),
        
        RunModel (//id: 1,
                name: "EB - Sunol NRD Pickup",
                serial: "", wn: "WN",
                numberSites: 0, numberCompleted: 0, numberOffline: 0, numberTasks: 0,
            sites: []
            /*
                Site2(id: 0, name: "Alameda East", comment: "...",
                      fieldTests : [
                        FieldTest(id: 0, name: "C12 Residual, free", value: "3", measure: "ppm", time: "3:45pm"),
                        FieldTest(id: 1, name: "Temperature (F)", value: "82", measure: "°F", time: "4:05pm"),
                      ],
                      bottles : [
                        Bottle( id: 0, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 1, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]
                     ),
                Site2(id: 1, name: "IRV_PORTAL", comment: "Comments here...",
                      fieldTests : [
                        FieldTest(id: 2, name: "Another Test", value: "6", measure: "ppm", time: "3:45pm"),
                        FieldTest(id: 3, name: "Temperature (F)", value: "80", measure: "°F", time: "4:25pm"),
                      ],
                      bottles : [
                        Bottle( id: 2, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 3, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                     ),
                Site2(id: 2, name: "SVWTP_EFF", comment: "Comments go here...",                      fieldTests : [
                        FieldTest(id: 2, name: "Another Test", value: "6", measure: "ppm", time: "3:45pm"),
                        FieldTest(id: 3, name: "Temperature (F)", value: "80", measure: "°F", time: "4:25pm"),
                      ],
                      bottles : [
                        Bottle( id: 2, name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        Bottle( id: 3, name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                      ),
                ]
             */
           ),
        RunModel (//id: 2,
                name: "EB1 (1st Mon) TESLA",
                 serial: "2304028", wn: "WN",
                 numberSites: 7, numberCompleted: 5, numberOffline: 2, numberTasks: 0,
            sites: [
                SiteModel(//id: 0,
                    name: "Alameda East",
                          comment: "...",
                          complete : true,
                      fieldTests : [
                        FieldTestModel(//id: 0,
                            name: "C12 Residual, free", value: "3", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 1,
                            name: "Temperature (°F)", value: "82", measure: "°F", time: "4:05pm"),
                      ],
                      bottles : [
                        BottleModel(//id: 0,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel(//id: 1,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]
                     ),
                SiteModel(//id: 1,
                    name: "IRV_PORTAL",
                          comment: "Comments here...",
                          complete : true,
                      fieldTests : [
                        FieldTestModel(//id: 2,
                            name: "Another Test", value: "6", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 3,
                            name: "Temperature (°F)", value: "80", measure: "°F", time: "4:25pm"),
                      ],
                      bottles : [
                        BottleModel(//id: 2,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel(//id: 3,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                     ),
                SiteModel(//id: 2,
                    name: "SVWTP_EFF",
                          comment: "Comments go here...",
                          complete : false,
                    fieldTests : [
                        FieldTestModel(//id: 2,
                            name: "Another Test", value: "6", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 3,
                            name: "Temperature (°F)", value: "87", measure: "°F", time: "4:25pm"),
                      ],
                      bottles : [
                        BottleModel( //id: 2,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel( //id: 3,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                      ),
                ]
           ),
        RunModel (//id: 3,
                name: "EB1 (1st Mon) w/THM",
                 serial: "2304024", wn: "WN",
                 numberSites: 9, numberCompleted: 8, numberOffline: 1, numberTasks: 0,
            sites: [
                SiteModel(//id: 0,
                    name: "Alameda East",
                          comment: "...",
                          complete : false,
                      fieldTests : [
                        FieldTestModel(//id: 0,
                            name: "C12 Residual, free", value: "3", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 1,
                            name: "Temperature (F)", value: "82", measure: "°F", time: "4:05pm"),
                      ],
                      bottles : [
                        BottleModel(// id: 0,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel(// id: 1,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]
                     ),
                SiteModel(//id: 1,
                    name: "IRV_PORTAL",
                          comment: "Comments here...",
                          complete : false,
                      fieldTests : [
                        FieldTestModel(//id: 2,
                            name: "Another Test", value: "6", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 3,
                            name: "Temperature (°F)", value: "70", measure: "°F", time: "4:25pm"),
                      ],
                      bottles : [
                        BottleModel( //id: 2,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel( //id: 3,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                     ),
                SiteModel(//id: 2,
                    name: "SVWTP_EFF",
                          comment: "Comments go here...",
                          complete : false,
                    fieldTests : [
                        FieldTestModel(//id: 2,
                            name: "Another Test", value: "6", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 3,
                            name: "Temperature (°F)", value: "83", measure: "°F", time: "4:25pm"),
                      ],
                      bottles : [
                        BottleModel( //id: 2,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel( //id: 3,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]                      ),
                ]
           ),
        RunModel (//id: 4,
                name: "EB - Deliver Sample Milbrae to Sunol",
                 serial: "", wn: "WN",
                 numberSites: 0, numberCompleted: 0, numberOffline: 0, numberTasks: 0,
            sites: []
         ),
        RunModel (//id: 5,
                name: "CITY A1 w/SS",
                 serial: "2304028", wn: "WN",
                 numberSites: 7, numberCompleted: 5, numberOffline: 2, numberTasks: 0,
            sites: [
                SiteModel(//id: 0,
                    name: "Alameda East",
                          comment: "...",
                          complete : true,
                      fieldTests : [
                        FieldTestModel(//id: 0,
                            name: "C12 Residual, free", value: "3", measure: "ppm", time: "3:45pm"),
                        FieldTestModel(//id: 1,
                            name: "Temperature (°F)", value: "81", measure: "°F", time: "4:05pm"),
                      ],
                      bottles : [
                        BottleModel( //id: 0,
                            name: "250ml _GRAB_P_4~C(4) ", collected: true, collectedTimeStamp: "3:35 pm" ),
                        BottleModel( //id: 1,
                            name: "250ml _GRAB_P_4~C(1) ", collected: false, collectedTimeStamp: "")
                      ]
                     ),
                ]
           ),
    ]
}
