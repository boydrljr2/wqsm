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
                }
                .padding(.bottom)
                
                ForEach (allDataManager.allDatas, id: \.id) { allData in
                    VStack (alignment: .leading){
                        
                        //Hstack for name and navigation link
                        HStack {
                            Text(allData.name != "" ? "\(allData.name)" : "")
                                .font(.title2).bold()
                                .foregroundColor(allData.serial == "" ? Color.orange : Color.primary)
                            Spacer()
                            
                            if allData.sites.count > 0 {
                                NavigationLink(destination: SwipeDataRunPage(allData : allData)){
                                    EmptyView()
                                    //Image(systemName: "arrow.right.circle.fill")
                                }.frame(maxWidth: 10)
                            } else
                             { EmptyView()
                            }
                            
                            
                        }
                        
                        // HStack for serial and wn
                        HStack {
                            Text(allData.serial == "" ?
                                 "\(allData.wn)" :
                                    "\(allData.serial)\(allData.wn != "" ? " | \(allData.wn)" : "")")
                            .font(.body)
                            Spacer()
                        }
                        
                        //HStack for other data
                        HStack{
                            Text(allData.numberSites != 0 ? "\(allData.numberSites) Sites | " : "")
                                .font(.body)
                            Text(allData.numberSites != 0 &&
                                 (allData.numberCompleted != 0 ||
                                  allData.numberOffline != 0 ) ? " | " : "")
                            Text(allData.numberCompleted != 0 ?
                                 "\(allData.numberCompleted) Completed" : "")
                            .font(.body)
                            Text(allData.numberCompleted != 0 &&
                                 allData.numberOffline != 0 ? " | " : "")
                            Text(allData.numberOffline != 0 ?
                                 "\(allData.numberOffline) Offline" : "")
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
    
    //@Binding var allData : AllDataModel
    var allData : AllDataModel
    
    var body: some View {
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
            
            
            ForEach(allData.sites, id: \.id){ site in
                SwipeDataSiteRow(
                    allData : allData,
                    site : site)
            }
            
        
            Spacer()
        }

}

struct SwipeDataSiteRow : View {
    
    var allData : AllDataModel
    var site : SiteModel
    
    var body : some View {
        NavigationLink(destination: SwipeDataSitePage(
                allData : allData,
                site : site)) {
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
                    ForEach (site.fieldTests, id: \.id) { test in
                        HStack{
                            Text("\(test.name)")
                                .padding(.leading, 50)
                            
                            Text("\(test.value)")
                            
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
    
    var allData : AllDataModel
    var site : SiteModel
    @State private var editedComment : String
    @State private var navigateToRunPage: Bool = false
    
    init(allData: AllDataModel, site: SiteModel) {
        self.allData = allData
        self.site = site
        _editedComment = State(initialValue: site.comment)
    }
    
    var body : some View {
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
            
            Text("\(site.name)").font(.title).bold().foregroundColor(Color("Primary"))
            
            Text("Field/Test Data")
                .font(.title2).bold().foregroundColor(Color.black)
                .padding(.bottom)
            
            ForEach(site.fieldTests, id: \.id) {fieldTest in
                SwipeDataFieldTestsRow(fieldTest : fieldTest)
            }
            
            VStack {
                Text("Comments")
                HStack {
                    TextEditor(text: $editedComment )
                        .frame(height: 120)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                }
            }.padding()
            
            Text("Bottles to Collect")
                .font(.title2).bold().foregroundColor(Color.black)
                .padding(.top)
                .padding(.bottom)
            
            ForEach(site.bottles, id: \.id) {bottle in
                SwipeDataBottlesRow(bottle : bottle)
            }
            
            Spacer()
            
            NavigationLink("",destination: SwipeDataRunPage(allData: allData),
                           isActive: $navigateToRunPage).hidden()
                
            
            Button(action: {
                updateSiteComment()
                navigateToRunPage = true
                
            }) {
                Text("Continue")
                    .font(.title3).bold()
                    .padding(5)
                    .frame(maxWidth: 300)
                    .background(Color("Primary"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
    func updateSiteComment() {
        site.comment = editedComment
    }
}

    
    
struct SwipeDataFieldTestsRow : View {
    
    var fieldTest : FieldTestModel
    @State private var editedFieldTestValue : String
    
    init(fieldTest : FieldTestModel) {
        self.fieldTest = fieldTest
        _editedFieldTestValue = State(initialValue : fieldTest.value)
    }
    
    var body: some View {
        HStack {
            Text(fieldTest.name)
            Spacer()
            TextField("Value", text: $editedFieldTestValue)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 50, alignment: .trailing)
                .multilineTextAlignment(.trailing)
        }
        .padding(.leading).padding(.trailing)
    }
}
    
struct SwipeDataBottlesRow : View {
    
    var bottle : BottleModel
    @State private var editedBottleCollected : Bool
    
    init(bottle : BottleModel) {
        self.bottle = bottle
        _editedBottleCollected = State(initialValue : bottle.collected)
    }
    
    

    
    var body: some View {
        VStack {
            HStack {
                //Text($name)
                Text(bottle.name)
                    .frame(width: 200, alignment: .leading)//.font(.caption)
                Spacer()
                //Toggle(isOn : $collected) {
                Toggle(isOn : $editedBottleCollected) {
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
