//
//  ContentView.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    AppTitle()
                    SwipeDataPage()
                }
                .navigationBarTitle("", displayMode: .inline) // You can modify the title here
            }
            .tabItem {
                Image(systemName: "chevron.right.2")
                Text("Swipe View")
            }
            
            NavigationView {
                VStack {
                    AppTitle()
                    ScrollDataPage()
                }
                .navigationBarTitle("", displayMode: .inline) // You can modify the title here
            }
            .tabItem {
                Image(systemName: "chevron.up.chevron.down")
                Text("Scroll View")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AllDataManager())
    }
}
