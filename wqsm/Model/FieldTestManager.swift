//
//  FieldTestManager.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

class FieldTestManager : ObservableObject {
    
    @Published var fieldTests : [FieldTest] = [
            FieldTest(id: 0, name: "C12 Residual, free", value: "3", time: "3:45pm"),
            FieldTest(id: 1, name: "Temperature (F)", value: "82", time: "4:05pm"),
            FieldTest(id: 2, name: "Another Test", value: "6", time: "3:45pm"),
            FieldTest(id: 3, name: "Temperature (F)", value: "80", time: "4:25pm"),        ]
}
