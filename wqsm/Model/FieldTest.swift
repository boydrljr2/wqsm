//
//  FieldTest.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import Foundation

struct FieldTest: Decodable, Identifiable {
    var id: Int
    var name: String
    var value: String
    var time: String
}
