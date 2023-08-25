//
//  SitesPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/24/23.
//

import SwiftUI

struct FieldTestsPage: View {
    
    var fieldTests: [FieldTest] = [
        FieldTest(id: 0, name: "C12 Residual, free", value: "3", time: "3:45pm"),
        FieldTest(id: 1, name: "Temperature (F)", value: "82", time: "4:05pm"),
        FieldTest(id: 2, name: "C12 Residual, free", value: "3", time: "3:45pm"),
        FieldTest(id: 3, name: "Temperature (F)", value: "82", time: "4:05pm"),
        FieldTest(id: 4, name: "C12 Residual, free", value: "3", time: "3:45pm"),
        FieldTest(id: 5, name: "Temperature (F)", value: "82", time: "4:05pm")
    ]
    
    var body: some View {
        
        NavigationView {
            List {
                
                //Test Table layout header
                HStack {
                    Text("Id")
                        .frame(width: 50, alignment: .leading)
                    Text("Test")
                        .frame(width: 150, alignment: .leading)
                    Text("Value")
                        Spacer()
                    Text("Time")
                }
                .font(.title3)
                
                
                ForEach(fieldTests.indices, id: \.self) { index in
                    let fieldTest = fieldTests[index]
                    FieldTestsPageRow(fieldTest: fieldTest)
                        .background(index % 2 == 1 ? Color.clear : Color("Background"))
                }
            }
            //.listStyle(PlainListStyle())
            .navigationTitle("Field Test Data")
            //Spacer()
        }
    }
}

struct FieldTestsPageRow: View {
    
    var fieldTest: FieldTest
    
    var body: some View {
        HStack {
            Text("\(fieldTest.id)")
                .frame(width: 50, alignment: .leading) // Adjust the width as needed
            Text(fieldTest.name)
            Spacer()
            Text(fieldTest.value)
            Spacer()
            Text(fieldTest.time)
        }
        .font(.body)
        .padding(.vertical, 8)
    }
}

struct FieldTestsPage_Previews: PreviewProvider {
    static var previews: some View {
        FieldTestsPage()
    }
}
