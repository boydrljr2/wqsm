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
            Spacer()
            NavigationView {
                VStack {
                    TabView {
                        Text("Runs")
                            .tabItem {
                                Image(systemName: "star.fill")
                                Text("Runs")
                            }
                        SitesPage()
                            .tabItem {
                                Image(systemName: "map.fill")
                                Text("Sites")
                            }
                        TestsPage()
                            .tabItem {
                                Image(systemName: "map.fill")
                                Text("Tests")
                            }
                        Text("Info")
                            .tabItem {
                                Image(systemName: "info.circle")
                                Text("Sites")
                            }
                    }
                    .background(Color("Secondary"))
                    
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
