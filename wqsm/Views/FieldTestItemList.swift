//
//  FieldTestItemList.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

struct FieldTestItemList: View {
    var body: some View {
        VStack {
            FieldTestItem(fieldTest: FieldTest(
                    id: 0,
                    name: "C12 Residual, free",
                    value: "3",
                    time: "3:45pm"
                ))
            FieldTestItem(fieldTest: FieldTest(
                    id: 0,
                    name: "Temperature (F)",
                    value: "82",
                    time: "4:05pm"
                ))
            FieldTestItem(fieldTest: FieldTest(
                    id: 0,
                    name: "C12 Residual, free",
                    value: "3",
                    time: "3:45pm"
                ))
            FieldTestItem(fieldTest: FieldTest(
                    id: 0,
                    name: "Temperature (F)",
                    value: "82",
                    time: "4:05pm"
                ))
        }
    }
}

struct FieldTestItemList_Previews: PreviewProvider {
    static var previews: some View {
        FieldTestItemList()
    }
}
