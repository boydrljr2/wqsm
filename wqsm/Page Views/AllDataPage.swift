//
//  AllDataPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import SwiftUI

struct AllDataPage: View {
    
    @EnvironmentObject var allDataManager : AllDataManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(allDataManager.allDatas) { allData in
                    //Text(allData.name)
                    Section(header: Text(allData.name)
                        .font(.title3))
                    {
                        ForEach(allData.sites.indices, id: \.self) { index in
                            let site = allData.sites[index]
                            AllDataSitesPageRow(site : site)
                        }
                    }
                }

            }
        }
    }
}

struct AllDataSitesPageRow: View {
    
    var site: Site2
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(systemName: "mappin.and.ellipse")
                    .frame(width: 50, alignment: .leading)
                Text("\(site.id)")
                    .frame(width: 50, alignment: .leading)
                Text(site.name)
                    .bold()
                Spacer()
                Image(systemName: "mappin")
                Image(systemName: "gear")
            }
            .font(.body)
            .padding(.vertical, 10)
            
            HStack {
                Text("Field Tests").font(.body).bold()
            }.padding(.vertical, 10)
            
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
            .font(.body)
            .padding(.vertical, 10)
            
            ForEach(site.fieldTests.indices, id: \.self) { index in
                let fieldTest = site.fieldTests[index]
                AllDataFieldTestsPageRow(fieldTest : fieldTest)
                    .background(index % 2 == 1 ? Color.clear : Color("Background"))
                    .padding(.vertical, 2)
            }
            
            //Bottle table header
            HStack {
                Text("Bottles to Collect").font(.body).bold()
            }.padding(.vertical, 10)
            
            HStack {
                Text("Id")
                    .frame(width: 30, alignment : .leading)
                //Spacer()
                Text("Bottle")
                    .frame(width: 160, alignment: .leading)
                //Spacer()
                //Text("Collected")
                //    .frame(alignment: .leading)
                Spacer()
                Text("Time")
                    .frame(alignment: .trailing)
            }
    
            
            ForEach(site.bottles.indices, id: \.self) { index in
                let bottle = site.bottles[index]
                AllDataBottlesItemRow( bottle : bottle )
                    .background(index % 2 == 1 ? Color.clear : Color("Background"))
                    .padding(.vertical, 2)
            }
        }
    }
}

struct AllDataFieldTestsPageRow: View {
    
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

struct AllDataBottlesItemRow : View {
    
    var bottle: Bottle
    
    var body: some View {
        HStack {
            Text("\(bottle.id)")
                .frame(width: 30, alignment: .leading)
            Text(bottle.name)
                .frame(width: 160, alignment: .leading).font(.caption)
            //Text(" ")
            Spacer()
            Text(bottle.collectedTimeStamp)
                .frame(alignment: .trailing).font(.body)
        }
    }
}

struct AllDataPage_Previews: PreviewProvider {
    static var previews: some View {
        AllDataPage()
            .environmentObject(AllDataManager())
    }
}


