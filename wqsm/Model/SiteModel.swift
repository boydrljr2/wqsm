//
//  Site2.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation
import Combine

class SiteModel: Identifiable, ObservableObject {
    var id = UUID()
    @Published var name: String
    @Published var comment: String
    @Published var complete: Bool
    @Published var fieldTests: [FieldTestModel]
    @Published var bottles: [BottleModel]
    
    init(name: String, comment: String, complete: Bool, fieldTests: [FieldTestModel], bottles: [BottleModel]) {
        self.name = name
        self.comment = comment
        self.complete = complete
        self.fieldTests = fieldTests
        self.bottles = bottles
    }
}


