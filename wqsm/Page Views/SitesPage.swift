//
//  SitesPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/24/23.
//

import SwiftUI

struct SitesPage: View {
    
    @State var name = ""
    
    var body: some View {
        
        VStack {
            TextField("Enter your name: ", text: $name)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            Text("Hello \(name)")
            Spacer()
        }
    }
}

struct SitesPage_Previews: PreviewProvider {
    static var previews: some View {
        SitesPage()
    }
}
