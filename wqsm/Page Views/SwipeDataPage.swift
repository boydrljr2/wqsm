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
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
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
                ForEach(allDataManager.allDatas.indices, id: \.self) { runIndex in

                    VStack {
                       
                        HStack {
                            Text(allDataManager.allDatas[runIndex].name != "" ?
                                 "\(allDataManager.allDatas[runIndex].name)" : "")
                                .font(.title2).bold()
                                .foregroundColor(allDataManager.allDatas[runIndex].serial == "" ? Color.orange : Color.primary)
                            Spacer()
                        }
                        
                        HStack {
                            // This Text view handles both .serial and the divider |, if needed
                            Text(allDataManager.allDatas[runIndex].serial == "" ?
                                "\(allDataManager.allDatas[runIndex].wn)" :
                                    "\(allDataManager.allDatas[runIndex].serial)\(allDataManager.allDatas[runIndex].wn != "" ? " | \(allDataManager.allDatas[runIndex].wn)" : "")")
                                .font(.body)
                            NavigationLink(destination: SwipeDataRunPage(
                                allData : $allDataManager.allDatas[runIndex])){
                                //EmptyView()
                            }
                            //.opacity(0)
                            //.frame(width: 0, height: 0)
                            //.fixedSize()

                            
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
                Text("\(allData.name)").font(.title3).bold()
                HStack {
                    Text("0/2 Bottles Collected | 2/3 Sites Completed")
                        .font(.caption)
                }
                Text("Sites").font(.title3).bold().foregroundColor(Color("Primary"))
            }.padding(.bottom, 10)
            
                
            ForEach(allData.sites.indices, id: \.self){ siteIndex in
                SwipeDataSiteRow(site : $allData.sites[siteIndex])
            }
            
            Spacer()
        }
    }
}

struct SwipeDataSiteRow : View {
    
    @Binding var site : Site2
    
    var body : some View {
        VStack {
            HStack {
                Image(systemName: "arrowtriangle.down.circle")
                    .frame(width: 50, alignment: .leading)
                    .padding(.leading)
                Text("\(site.name)")
                    .font(.title3).bold()
                    .frame(alignment: .leading)
                Spacer()
            }
            
        }
    }
}

struct SwipeDataPage_Previews: PreviewProvider {
    static var previews: some View {
        SwipeDataPage()
            .environmentObject(AllDataManager())
    }
}
