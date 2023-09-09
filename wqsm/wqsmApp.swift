//
//  wqsmApp.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

@main
struct wqsmApp: App {
    
    //Create environmentobject singletons
    var allDataManager = AllDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(allDataManager)

        }
    }
}
