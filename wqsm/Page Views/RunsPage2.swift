//
//  RunsPage2.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import SwiftUI

struct RunsPage2: View {
    
    @EnvironmentObject var runsManager2 : RunsManager2
    
    var body: some View {
        NavigationView {
            List {
                ForEach(runsManager2.runs2) { run2 in
                    Section(header: Text(run2.name)
                        .font(.title3)
                        .bold())
                    {
                        ForEach(run2.sites) { site in
                            NavigationLink(destination: SitesPage2(site : site)) {
                                SitesPage2(site : site)
                            }
                        }
                    }
                }
            }.navigationTitle("Runs")
        }
    }
}

struct RunsPage2_Previews: PreviewProvider {
    static var previews: some View {
        RunsPage2()
            .environmentObject(RunsManager2())
    }
}
