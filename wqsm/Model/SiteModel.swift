//
//  Site2.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import Foundation

struct SiteModel: Identifiable {
    var id = UUID()
    var name: String
    var comment : String
    var complete : Bool
    
    var fieldTests : [FieldTestModel]
    
    var bottles : [BottleModel]
    
}
