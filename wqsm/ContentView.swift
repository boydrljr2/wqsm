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
            GeometryReader { geometry in
                VStack {
                    AppTitle()
                        .padding(.top, geometry.safeAreaInsets.top)
                    
                    TabView {
                        
                        SwipeDataPage()
                            .tabItem {
                                Image(systemName: "chevron.right.2")
                                Text("Swipe View")
                            }
                        
                        ScrollDataPage()
                            .frame(maxWidth: .infinity)
                            .tabItem {
                                Image(systemName: "chevron.up.chevron.down")
                                Text("Scroll View")
                            }
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AllDataManager())

    }
}
