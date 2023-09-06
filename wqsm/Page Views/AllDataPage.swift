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
                ForEach(allDataManager.allDatas.indices, id: \.self) {runIndex in
                    Section(header: Text(allDataManager.allDatas[runIndex].name)
                        .font(.title3))
                    {
                        HStack {
                            Text(allDataManager.allDatas[runIndex].serial != "" ? "Serial:\(allDataManager.allDatas[runIndex].serial)" : "")
                            //Text(allData.wn != "" ? " \(allData.wn) " : "" )
                            Spacer()
                            Text(allDataManager.allDatas[runIndex].numberSites != 0 ? "\(allDataManager.allDatas[runIndex].numberSites) Sites " : "")
                            Text(allDataManager.allDatas[runIndex].numberCompleted != 0 ? "\(allDataManager.allDatas[runIndex].numberCompleted) Completed " : "")
                            Text(allDataManager.allDatas[runIndex].numberOffline != 0 ? "\(allDataManager.allDatas[runIndex].numberOffline) Offline " : "")
                            Text(allDataManager.allDatas[runIndex].numberTasks != 0 ? "\(allDataManager.allDatas[runIndex].numberTasks) Tasks" : "")
                            //Spacer()
                        }.font(.caption)
                        ForEach(allDataManager.allDatas[runIndex].sites.indices, id: \.self) { siteIndex in
                            let site = allDataManager.allDatas[runIndex].sites[siteIndex]
                            AllDataSitesPageRow(site : site)
                        }
                    }
                }
                .navigationTitle("Today's Runs > Sites > Tasks")
                .navigationBarTitleDisplayMode(.automatic)
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
            
            ForEach(site.fieldTests.indices, id: \.self) { fieldTestIndex in
                let fieldTest = site.fieldTests[fieldTestIndex]
                AllDataFieldTestsPageRow(fieldTest : fieldTest)
                    .background(fieldTestIndex % 2 == 1 ? Color.clear : Color("Background"))
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
                    .frame(width: 220, alignment: .leading)
                //Spacer()
                //Text("Collected")
                //    .frame(alignment: .leading)
                Spacer()
                Text("Time")
                    .frame(alignment: .trailing)
            }
    
            
            ForEach(site.bottles.indices, id: \.self) { bottleIndex in
                let bottle = site.bottles[bottleIndex]
                AllDataBottlesItemRow( bottle : bottle )
                    .background(bottleIndex % 2 == 1 ? Color.clear : Color("Background"))
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
        .font(.body)
        .padding(.vertical, 8)
    }
}

struct AllDataBottlesItemRow : View {
    
    var bottle: Bottle
    
    var body: some View {
        HStack {
            Text("\(bottle.id)")
                .frame(width: 20, alignment: .leading)
            Text(bottle.name)
                .frame(width: 200, alignment: .leading)//.font(.caption)
            //Text(" ")
            Image(systemName: bottle.collectedTimeStamp == "" ?
                    "square.fill.and.line.vertical.and.square" :
                    "square.and.line.vertical.and.square.fill")
                .resizable()
                .frame(maxWidth: 25, maxHeight: 20, alignment: .trailing)
            Spacer()
            Text(bottle.collectedTimeStamp)
                .frame(alignment: .trailing).font(.body)
        }
        .padding(.vertical, 10)
    }
}

struct AllDataPage_Previews: PreviewProvider {
    static var previews: some View {
        AllDataPage()
            .environmentObject(AllDataManager())
    }
}


