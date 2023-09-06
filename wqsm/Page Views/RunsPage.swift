//
//  RunsPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/25/23.
//

import SwiftUI

struct RunsPage: View {
    
    @EnvironmentObject var runsManager : RunsManager
    
    var body: some View {
        
        NavigationView {
            List {
                //ForEach(runs.indices, id: \.self) { index in
                //    let run = runs[index]
                ForEach(runsManager.runs.indices, id: \.self) { index in
                    let run = runsManager.runs[index]
                    NavigationLink( destination: SitesPage()) {
                        RunsPageRow(run: run)
                            .background(index % 2 == 1 ? Color.clear : Color("Background"))
                    }
                }
            }
            .navigationTitle("Today's Runs & Tasks")
            //.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct RunsPageRow : View {
    
    var run: Run
    
    var body: some View {
        VStack {
            
            HStack{
                Text("\(run.name)")
                    .font(.title3)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            
            HStack {
                Text(run.serial != "" ? run.serial + " | " : "")
                    //.frame(maxWidth: .infinity, alignment: .leading)
                Text(run.wn == "" ? "" : run.wn)
                    // .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.body)
            
            HStack {
                Text(run.numberSites != 0 ? "\(run.numberSites) Sites " : "")
                Text(run.numberCompleted != 0 ? "\(run.numberCompleted) Completed " : "")
                Text(run.numberOffline != 0 ? "\(run.numberOffline) Offline " : "")
                Text(run.numberTasks != 0 ? "\(run.numberTasks) Tasks" : "")
                Spacer()
            }.font(.caption)
        }
    }
}

struct RunsPage_Previews: PreviewProvider {
    static var previews: some View {
        RunsPage()
            .environmentObject(RunsManager())
    }
}
