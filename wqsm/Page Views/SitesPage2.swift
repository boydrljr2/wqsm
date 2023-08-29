//
//  SitesPage2.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import SwiftUI

struct SitesPage2: View {
    
    var site : Site
    
    var body: some View {
        HStack {
            //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("\(site.id)")
            Text(site.name)
        }
    }
}

struct SitesPage2_Previews: PreviewProvider {
    static var previews: some View {
        SitesPage2(site : Site(id: 0, name: "Alameda West"))
    }
}
