//
//  FieldTestItem.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

struct FieldTestItem: View {
    
    var fieldTest: FieldTest
    
    var body: some View {
        
        HStack{
            Text(fieldTest.name)
            Text(fieldTest.value)
            Text(fieldTest.time)
        }

        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.title2)
        .padding()
    }
}

struct FieldTestItem_Previews: PreviewProvider {
    static var previews: some View {
        FieldTestItem( fieldTest: FieldTest(
            id: 0,
            name: "C12 Residual, free",
            value: "3",
            time: "3:45pm"
        ))
    }
}
