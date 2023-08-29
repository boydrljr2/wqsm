//
//  SitesPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/24/23.
//

import SwiftUI

struct FieldTestsPage: View {
    
    @EnvironmentObject var fieldTestManager : FieldTestManager
    
    var body: some View {
        
        NavigationView {
            List {
                
                //Test Table layout header
                HStack {
                    Text("Id")
                        .frame(width: 30, alignment: .leading)
                    Text("Test")
                        .frame(width: 160, alignment: .leading)
                    Text("Value")
                        .frame(alignment: .trailing)
                    Spacer()
                    Text("Time")
                }
                
                
                //ForEach(fieldTests.indices, id: \.self) { index in
                //    let fieldTest = fieldTests[index]
                ForEach(fieldTestManager.fieldTests.indices, id: \.self) { index in
                    let fieldTest = fieldTestManager.fieldTests[index]
                    FieldTestsPageRow(fieldTest: fieldTest)
                        .background(index % 2 == 1 ? Color.clear : Color("Background"))
                }
            }
            .navigationTitle("Field Tests")
        }
    }
}

struct FieldTestsPageRow: View {
    
    var fieldTest: FieldTest
    
    var body: some View {
        HStack {
            Text("\(fieldTest.id)")
                .frame(width: 30, alignment: .leading)
                // Adjust the width as needed
            Text(fieldTest.name)
                .frame(width: 160, alignment: .leading)
            //Spacer()
            Text(fieldTest.value)
                .frame(width: 50, alignment: .trailing)
            Spacer()
            Text(fieldTest.time)
                .frame(width: 80, alignment: .trailing)
        }
        //.font(.body)
        //.padding(.vertical, 8)
    }
}

struct FieldTestsPage_Previews: PreviewProvider {
    static var previews: some View {
        FieldTestsPage()
            .environmentObject(FieldTestManager())
    }
}
