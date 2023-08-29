//
//  ContentView.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            //AppTitle()
            //Spacer()
            NavigationView {
                VStack {
                    AppTitle()
                    TabView {
                        RunsPage()
                            .tabItem {
                                Image(systemName: "hare")
                                Text("Runs")
                            }
                        SitesPage()
                            .tabItem {
                                Image(systemName: "globe")
                                Text("Sites")
                            }
                        FieldTestsPage()
                            .tabItem {
                                Image(systemName: "rosette")
                                Text("Tests")
                            }
                        BottlesPage()
                            .tabItem {
                                Image(systemName: "hourglass")
                                Text("Bottles")
                            }
                        AllDataPage()
                            .tabItem {
                                Image(systemName: "info.circle")
                                Text("All")
                            }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BottleManager())
            .environmentObject(RunsManager())
            .environmentObject(RunsManager2())
            .environmentObject(FieldTestManager())
            .environmentObject(AllDataManager())
    }
}
