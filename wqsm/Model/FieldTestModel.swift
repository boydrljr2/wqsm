//
//  FieldTest.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import Foundation
import Combine

class FieldTestModel: Identifiable, ObservableObject {
    var id = UUID()
    @Published var name: String
    @Published var value: String
    @Published var measure : String
    @Published var time: String
    
    init(name: String, value: String, measure: String, time: String) {
        self.name = name
        self.value = value
        self.measure = measure
        self.time = time
    }
}

