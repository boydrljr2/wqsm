//
//  SitesPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/24/23.
//

import SwiftUI

struct SitesPage: View {
    
    var sites: [Site] = [
        Site(id: 0, name: "Alameda East"),
        Site(id: 1, name: "IRV_PORTAL"),
        Site(id: 2, name: "SVWTP_EFF")
    ]

    var body: some View {
        
        NavigationView {
            List {
                ForEach(sites.indices, id: \.self) { index in
                    let site = sites[index]
                    //NavigationLink(destination: FieldTestsPage()) {
                    NavigationLink(destination: TestsBottlesPage()) {
                        SitesPageRow(site: site)
                            .background(index % 2 == 1 ? Color.clear : Color("Background"))
                    }
                }
            }
            .navigationTitle("Sites")
        }
    }
}

struct SitesPageRow: View {
    
    var site: Site
    
    var body: some View {
        HStack {
            Image(systemName: "mappin.and.ellipse")
                .frame(width: 50, alignment: .leading)
            Text("\(site.id)")
                .frame(width: 50, alignment: .leading)
            Text(site.name)
                .bold()
            Spacer()
            Image(systemName: "mappin")
            Image(systemName: "gear")
        }
        .font(.body)
        .padding(.vertical, 10)
    }
}


struct SitesPage_Previews: PreviewProvider {
    static var previews: some View {
        SitesPage()
            .environmentObject(FieldTestManager())
            .environmentObject(BottleManager())
    }
}
