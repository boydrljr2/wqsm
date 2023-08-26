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
            AppTitle()
            //Spacer()
            NavigationView {
                VStack {
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
                        Text("Info")
                            .tabItem {
                                Image(systemName: "info.circle")
                                Text("Info")
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
    }
}
