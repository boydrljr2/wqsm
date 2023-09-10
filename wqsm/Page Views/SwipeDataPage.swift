//
//  SwipeDataPage.swift
//  wqsm
//
//  Created by bobsDevMac on 9/8/23.
//

import SwiftUI

struct SwipeDataPage: View {
    
    @EnvironmentObject var allDataManager : AllDataManager
    
    static func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
    
    var body: some View {
        
        NavigationView {
            List {
                VStack {
                    Text("Today's Runs & Tasks")
                        .font(.title).bold().foregroundColor(Color("Primary"))
                        .frame(alignment: .center)
                    HStack {
                        Spacer()
                        Text("Last Successful Sync:" ).font(.caption)
                        Text(Self.dateString(from: Date())).font(.caption)
                        Spacer()
                    }
                }.padding(.bottom)
                
                ForEach(allDataManager.allDatas.indices, id: \.self) { runIndex in
                    
                    VStack {
                        
                        HStack {
                            Text(allDataManager.allDatas[runIndex].name != "" ?
                                 "\(allDataManager.allDatas[runIndex].name)" : "")
                            .font(.title2).bold()
                            .foregroundColor(allDataManager.allDatas[runIndex].serial == "" ? Color.orange : Color.primary)
                            Spacer()
                            if allDataManager.allDatas[runIndex].sites.count > 0 {
                                NavigationLink(destination: SwipeDataRunPage(
                                    allData : $allDataManager.allDatas[runIndex])){
                                    }.frame(maxWidth: 10)
                            }
                        }
                        
                        HStack {
                            // This Text view handles both .serial and the divider |, if needed
                            Text(allDataManager.allDatas[runIndex].serial == "" ?
                                 "\(allDataManager.allDatas[runIndex].wn)" :
                                    "\(allDataManager.allDatas[runIndex].serial)\(allDataManager.allDatas[runIndex].wn != "" ? " | \(allDataManager.allDatas[runIndex].wn)" : "")")
                            .font(.body)
                            Spacer()
                        }
                        
                        
                        HStack{
                            Text(allDataManager.allDatas[runIndex].numberSites != 0 ?
                                 "\(allDataManager.allDatas[runIndex].numberSites) Sites | " : "")
                            .font(.body)
                            Text(allDataManager.allDatas[runIndex].numberSites != 0 &&
                                 (allDataManager.allDatas[runIndex].numberCompleted != 0 ||
                                  allDataManager.allDatas[runIndex].numberOffline != 0 ) ? " | " : "")
                            Text(allDataManager.allDatas[runIndex].numberCompleted != 0 ?
                                 "\(allDataManager.allDatas[runIndex].numberCompleted) Completed" : "")
                            .font(.body)
                            Text(allDataManager.allDatas[runIndex].numberCompleted != 0 &&
                                 allDataManager.allDatas[runIndex].numberOffline != 0 ? " | " : "")
                            Text(allDataManager.allDatas[runIndex].numberOffline != 0 ?
                                 "\(allDataManager.allDatas[runIndex].numberOffline) Offline" : "")
                            .font(.body)
                            .foregroundColor(Color.red)
                            
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct SwipeDataRunPage : View {
    
    @Binding var allData : AllDataModel
    
    var body: some View {
        VStack {
            VStack {
                VStack {
                    Text("\(allData.name)").font(.title3).bold()
                    HStack {
                        Text("\(allData.bottlesCollected) / \(allData.bottleCount) Bottles Collected  |  \(allData.sitesComplete) / \(allData.siteCount) Sites Completed")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("LightGray"))
                Text("Sites")                        .font(.title).bold().foregroundColor(Color("Primary"))
                    .frame(alignment: .center)
            }.padding(.bottom, 10)
            
            ForEach(allData.sites.indices, id: \.self){ siteIndex in
                SwipeDataSiteRow(
                    //allData : $allData,
                    site : $allData.sites[siteIndex])
            }
            
            Spacer()
        }
    }
}

struct SwipeDataSiteRow : View {
    
    //@Binding var allData : AllDataModel
    @Binding var site : SiteModel
    
    
    var body : some View {
        NavigationLink(destination: SwipeDataSitePage(
                //allData : $allData,
                site : $site)) {
            VStack {
                HStack {
                    Image(systemName: "arrowtriangle.down.circle")
                        .padding(.leading)
                    Text("\(site.name)")
                        .font(.title2).bold().foregroundColor(Color.black)
                        .frame(alignment: .leading)
                    Spacer()
                    Image(systemName: "arrowtriangle.down")
                    Image(systemName: "gearshape")
                        .padding(.trailing)
                }
                
                if site.fieldTests.count > 0 {
                    ForEach (site.fieldTests.indices, id: \.self) { fieldTestIndex in
                        HStack{
                            Text("\(site.fieldTests[fieldTestIndex].name)")
                                .padding(.leading, 50)
                            
                            Text("\(site.fieldTests[fieldTestIndex].value)")
                            
                            Spacer()
                        }
                        .font(.caption)
                        .foregroundColor(Color.gray)
                    }
                } else { Text("No Collected Field/Test Data")}
            }
        }
        Divider()
    }
}

struct SwipeDataSitePage : View {
    
    //@Binding var allData : AllDataModel
    @Binding var site : SiteModel
    
    var body : some View {
        VStack {
            /*
            VStack {
                Text("\(allData.name)").font(.title3).bold()
                HStack {
                    Text("\(allData.bottlesCollected) / \(allData.bottleCount) Bottles Collected  |  \(allData.sitesComplete) / \(allData.siteCount) Sites Completed")
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("LightGray"))
            */
            Text("\(site.name)").font(.title).bold().foregroundColor(Color("Primary"))
            
            Text("Field/Test Data")
                .font(.title2).bold().foregroundColor(Color.black)
                .padding(.bottom)
            
            ForEach(site.fieldTests.indices, id: \.self) {fieldTestIndex in
                SwipeDataFieldTestsRow(fieldTest : $site.fieldTests[fieldTestIndex])
            }
            
            VStack {
                Text("Comments")
                HStack {
                    TextEditor(text: $site.comment )
                        .frame(height: 120)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }
            }.padding()
            
            Text("Bottles to Collect")
                .font(.title2).bold().foregroundColor(Color.black)
                .padding(.top)
                .padding(.bottom)
            
            ForEach(site.bottles.indices, id: \.self) {bottleIndex in
                SwipeDataBottlesRow(bottle : $site.bottles[bottleIndex])
            }
            
            Spacer()
        }
    }
}


struct SwipeDataFieldTestsRow : View {
    
    @Binding var fieldTest : FieldTestModel
    
    var body: some View {
        HStack {
            Text(fieldTest.name)
                .font(.title3).bold()
            Spacer()
            TextField("Value", text: $fieldTest.value)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50, alignment: .trailing)
                .multilineTextAlignment(.trailing)
        }
        .padding(.leading).padding(.trailing)
    }
}

struct SwipeDataBottlesRow : View {

    @Binding var bottle : BottleModel
    
    var body: some View {
        VStack {
            HStack {
                Text(bottle.name)
                    .frame(width: 200, alignment: .leading)//.font(.caption)
                Spacer()
                Toggle(isOn : $bottle.collected) {
                    Text("")
                        .frame(alignment: .leading)
                }
            }
            Divider()
        }
        .padding(.leading).padding(.trailing)
    }
}

struct SwipeDataPage_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDataPage()
            .environmentObject(AllDataManager())
    }
}
