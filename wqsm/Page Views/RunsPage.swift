//
//  RunsPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/25/23.
//

import SwiftUI

struct RunsPage: View {
    
    var runs: [Run] = [
        Run(id: 0, name: "EB1 (MON) SUNOL",
            serial: "2303889", wn: "WN",
            numberSites: 5, numberCompleted: 5, numberOffline: 0, numberTasks: 0),
        Run(id: 1, name: "Sunol NRD Pickup",
            serial: "", wn: "WN",
            numberSites: 0, numberCompleted: 0, numberOffline: 0, numberTasks: 0),
        Run(id: 2, name: "CITY A1 w/SE",
            serial: "2304028", wn: "WN",
            numberSites: 7, numberCompleted: 5, numberOffline: 2, numberTasks: 0),
        Run(id: 3, name: "CITY A2",
            serial: "2304024", wn: "WN",
            numberSites: 9, numberCompleted: 8, numberOffline: 1, numberTasks: 1),
        Run(id: 4, name: "City Deliver Sample Millbrae to Sunol",
            serial: "", wn: "WN, BH",
            numberSites: 0, numberCompleted: 0, numberOffline: 0, numberTasks: 0),
    ]
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(runs.indices, id: \.self) { index in
                    let run = runs[index]
                    NavigationLink( destination: SitesPage()) {
                        RunsPageRow(run: run)
                            .background(index % 2 == 1 ? Color.clear : Color("Background"))
                    }
                }
            }
            .navigationTitle("Runs")
        }
    }
}

struct RunsPageRow : View {
    
    var run: Run
    
    var body: some View {
        VStack {
            
            HStack{
                Text("\(run.name)").font(.title3).bold()
                Spacer()
            }
            
            HStack {
                Text(run.serial != "" ? run.serial + " | " : "")
                Text(run.wn == "" ? "" : run.wn)
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
            }
        }
    }
}

struct RunsPage_Previews: PreviewProvider {
    static var previews: some View {
        RunsPage()
    }
}
