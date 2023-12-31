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
                SwipeDataPage()
            }
            .navigationBarTitle("", displayMode: .inline) // You can modify the title here
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AllDataManager())
    }
}
