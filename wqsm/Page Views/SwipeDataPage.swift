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
                
                ForEach (allDataManager.runs, id: \.id) { run in
                    VStack (alignment: .leading){
                        
                        //Hstack for name and navigation link
                        HStack {
                            Text(run.name != "" ? "\(run.name)" : "")
                                .font(.title2).bold()
                                .foregroundColor(run.serial == "" ? Color.orange : Color.primary)
                            Spacer()
                            
                            if run.sites.count > 0 {
                                NavigationLink(destination: RunPage(run : run)){
                                    EmptyView()
                                    //Image(systemName: "arrow.right.circle.fill")
                                }.frame(maxWidth: 10)
                            } else
                             { EmptyView()
                            }
                            
                            
                        }
                        
                        // HStack for serial and wn
                        HStack {
                            Text(run.serial == "" ?
                                 "\(run.wn)" :
                                    "\(run.serial)\(run.wn != "" ? " | \(run.wn)" : "")")
                            .font(.body)
                            Spacer()
                        }
                        
                        //HStack for other data
                        HStack{
                            Text(run.numberSites != 0 ? "\(run.numberSites) Sites | " : "")
                                .font(.body)
                            Text(run.numberSites != 0 &&
                                 (run.numberCompleted != 0 ||
                                  run.numberOffline != 0 ) ? " | " : "")
                            Text(run.numberCompleted != 0 ?
                                 "\(run.numberCompleted) Completed" : "")
                            .font(.body)
                            Text(run.numberCompleted != 0 &&
                                 run.numberOffline != 0 ? " | " : "")
                            Text(run.numberOffline != 0 ?
                                 "\(run.numberOffline) Offline" : "")
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

struct RunPage : View {

    var run : RunModel
    
    var body: some View {
        VStack {
                VStack {
                    Text("\(run.name)").font(.title3).bold()
                    HStack {
                        Text("\(run.bottlesCollected) / \(run.bottleCount) Bottles Collected  |  \(run.sitesComplete) / \(run.siteCount) Sites Completed")
                            .font(.caption)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color("LightGray"))
                Text("Sites")                        .font(.title).bold().foregroundColor(Color("Primary"))
                    .frame(alignment: .center)
            }.padding(.bottom, 10)
            
            
            ForEach(run.sites, id: \.id){ site in
                SiteRow(
                    run : run,
                    site : site)
            }
            
        
            Spacer()
        }

}

struct SiteRow : View {
    
    var run : RunModel
    var site : SiteModel
    
    var body : some View {
        NavigationLink(destination: SitePage(
                run : run,
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

struct SitePage : View {
    
    var run : RunModel
    var site : SiteModel
    @State private var editedComment : String
    @State private var navigateToRunPage: Bool = false
    
    init(run: RunModel, site: SiteModel) {
        self.run = run
        self.site = site
        _editedComment = State(initialValue: site.comment)
    }
    
    var body : some View {
        VStack {
            VStack {
                Text("\(run.name)").font(.title3).bold()
                HStack {
                    Text("\(run.bottlesCollected) / \(run.bottleCount) Bottles Collected  |  \(run.sitesComplete) / \(run.siteCount) Sites Completed")
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
                FieldTestsRow(fieldTest : fieldTest)
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
                BottlesRow(bottle : bottle)
            }
            
            Spacer()
            
            NavigationLink("",destination: RunPage(run: run),
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

    
    
struct FieldTestsRow : View {
    
    @ObservedObject var fieldTest : FieldTestModel
    @State private var editedFieldTestValue : String
    
    init(fieldTest : FieldTestModel) {
        self.fieldTest = fieldTest
        _editedFieldTestValue = State(initialValue : fieldTest.value)
    }
    
    var body: some View {
        HStack {
            VStack {
                Text(fieldTest.name).font(.title3).bold()
                Text(fieldTest.time).multilineTextAlignment(.leading).font(.caption)
            }
            
            Spacer()
            VStack {
                TextField("Value", text: $editedFieldTestValue)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 50, alignment: .trailing)
                    .multilineTextAlignment(.trailing)
                    .onChange(of: editedFieldTestValue) { newValue in
                        fieldTest.value = newValue
                    }
                //This is where the measure goes
                Text(fieldTest.measure).font(.caption)
            }
        }
        .padding(.leading).padding(.trailing)
    }

}
    
struct BottlesRow : View {
    
    @ObservedObject var bottle : BottleModel
    @State private var editedBottleCollected : Bool
    
    init(bottle : BottleModel) {
        self.bottle = bottle
        _editedBottleCollected = State(initialValue : bottle.collected)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(bottle.name)
                    .frame(width: 200, alignment: .leading)//.font(.caption)
                Spacer()
                Toggle("", isOn: $editedBottleCollected)
                    .frame(alignment: .leading)
                    .onChange(of: editedBottleCollected) { newValue in
                        updateBottleCollected()
                    }
            }
            Divider()
        }
        .padding(.leading).padding(.trailing)
    }
    
    func updateBottleCollected() {
        bottle.collected = editedBottleCollected
    }
}
 

struct SwipeDataPage_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDataPage()
            .environmentObject(AllDataManager())
    }
}
