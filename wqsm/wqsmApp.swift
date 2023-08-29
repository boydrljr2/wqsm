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
    var runsManager = RunsManager()
    var runsManager2 = RunsManager2()
    var bottleManager = BottleManager()
    var fieldTestManager = FieldTestManager()
    var allDataManager = AllDataManager()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(runsManager)
                .environmentObject(runsManager2)
                .environmentObject(bottleManager)
                .environmentObject(fieldTestManager)
                .environmentObject(allDataManager)
        }
    }
}
