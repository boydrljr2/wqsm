//
//  AllDataPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import SwiftUI

struct ScrollDataPage: View {
    
    @EnvironmentObject var allDataManager : AllDataManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(allDataManager.allDatas.indices, id: \.self) {runIndex in
                    Section(header: Text(allDataManager.allDatas[runIndex].name)
                        .font(.title2).bold()
                        .foregroundColor(Color("Primary"))
                    )
                    {
                        HStack {
                            Text(allDataManager.allDatas[runIndex].serial != "" ? "\(allDataManager.allDatas[runIndex].serial)" : "")
                            //Text(allDataManager.allDatas[runIndex].wn != "" ?
                            //     " \(allDataManager.allDatas[runIndex].wn) " : "" )
                            Text(allDataManager.allDatas[runIndex].numberSites != 0 ? "\(allDataManager.allDatas[runIndex].numberSites) Sites " : "")
                            Text(allDataManager.allDatas[runIndex].numberCompleted != 0 ? "\(allDataManager.allDatas[runIndex].numberCompleted) Completed " : "")
                            Text(allDataManager.allDatas[runIndex].numberOffline != 0 ? "\(allDataManager.allDatas[runIndex].numberOffline) Offline " : "")
                            Text(allDataManager.allDatas[runIndex].numberTasks != 0 ? "\(allDataManager.allDatas[runIndex].numberTasks) Tasks" : "")
                        }
                        .frame(maxWidth: .infinity)
                        .font(.caption)
                        .foregroundColor(Color("Primary"))
                        .padding(.bottom, 20)
                        
                        ForEach(allDataManager.allDatas[runIndex].sites.indices, id: \.self) { siteIndex in
                            ScrollDataSitesPageRow(site : $allDataManager.allDatas[runIndex].sites[siteIndex])
                        }
                        Divider()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ScrollDataSitesPageRow: View {
    
    @Binding var site: Site2
    
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
            .font(.title3)
            .padding(.vertical, 10)
            .foregroundColor(Color.orange)
            
            HStack {
                Text("Field Test")
                    .frame(width: 160, alignment: .leading)
                Spacer()
                Text("Value")
                    .frame(width: 50, alignment: .trailing)
                Spacer()
                Text("Time")
                    .frame(width: 80, alignment: .trailing)
            }
            .font(.body)
            .foregroundColor(Color(red: 0.2, green : 0.4, blue: 0.2))
            .padding(.top, 25)
                        
            ForEach(site.fieldTests.indices, id: \.self) {fieldTestIndex in
                ScrollDataFieldTestsPageRow(fieldTest : $site.fieldTests[fieldTestIndex])
                    .background(fieldTestIndex % 2 == 0 ? Color.clear : Color("Background"))
                    //.padding()
            }
            
            Divider()
            
            HStack {
                Text("Bottle to Collect")
                    .frame(width: 200, alignment: .leading)
                Text("Set")
                Spacer()
                Text("Time")
                    .frame(alignment: .trailing)
            }
            .font(.body)
            //dark green for Field Test and Bottle headers
            .foregroundColor(Color(red: 0.2, green : 0.4, blue: 0.2))
            .padding(.top, 25)
    
            
            ForEach(site.bottles.indices, id: \.self) { bottleIndex in
                ScrollDataBottlesItemRow(bottle : $site.bottles[bottleIndex])
                    .background(bottleIndex % 2 == 0 ? Color.clear : Color("Background"))
                    //.padding(.top, 25)
                
            }
            
            Divider().padding()
            
            HStack {
                TextEditor(text:
                    $site.comment
                )
                .frame(height: 120)
                .background(Color.white)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            }.padding(.bottom, 20)
            
        }
    }
}

struct ScrollDataFieldTestsPageRow: View {
    
    @Binding var fieldTest: FieldTest
    
    var body: some View {
        HStack {
            Text(fieldTest.name)
                .frame(width: 160, alignment: .leading)
            Spacer()
            TextField("Value", text: $fieldTest.value)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50, alignment: .trailing)
                .multilineTextAlignment(.trailing)
            Spacer()
            Text(fieldTest.time)
                .frame(width: 80, alignment: .trailing)
        }
        .font(.body)
    }
}

struct ScrollDataBottlesItemRow : View {
    
    //var bottle: Bottle
    @Binding var bottle : Bottle
    
    var body: some View {
        HStack {
            Text(bottle.name)
                .frame(width: 200, alignment: .leading)//.font(.caption)
            
            /*
            Image(systemName: bottle.collected == true ?
                    "square.fill.and.line.vertical.and.square" :
                    "square.and.line.vertical.and.square.fill")
                .resizable()
                .frame(maxWidth: 25, alignment: .trailing)
            */
            
            Toggle(isOn : $bottle.collected) {
                Text("")
                    .frame(alignment: .leading)
            }
            
            
            Spacer()
            Text(bottle.collectedTimeStamp)
                .frame(alignment: .trailing).font(.body)
        }
    }
}

struct ScrollDataPage_Previews: PreviewProvider {
    static var previews: some View {
        ScrollDataPage()
            .environmentObject(AllDataManager())
    }
}


