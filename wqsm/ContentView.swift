//
//  ContentView.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                AppTitle()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                
                TabView {
                    ScrollDataPage()
                        .tabItem {
                            Image(systemName: "rosette")
                            Text("Scroll View")
                        }
                    RunsPage()
                        .tabItem {
                            Image(systemName: "hare")
                            Text("Swipe View")
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
