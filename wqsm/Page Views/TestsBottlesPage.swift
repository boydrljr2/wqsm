//
//  TestsBottlesPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import SwiftUI

struct TestsBottlesPage: View {
    
    @EnvironmentObject var fieldTestManager : FieldTestManager
    @EnvironmentObject var bottleManager : BottleManager
    
    var body: some View {

        NavigationView {
            VStack {
                FieldTestsPage()
                BottlesPage()
            }
        }
        
    }
}

struct TestsBottlesPage_Previews: PreviewProvider {
    static var previews: some View {
        TestsBottlesPage()
            .environmentObject(FieldTestManager())
            .environmentObject(BottleManager())
    }
}
