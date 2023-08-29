//
//  AppTitle.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

struct AppTitle: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .resizable()
                .frame(maxWidth: 25, maxHeight:25)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 40)
            Text("WQSM").font(.title).bold()
            Spacer()
            Image(systemName: "cloud")
                .resizable()
                .frame(maxWidth: 50, maxHeight: 25)
            Spacer()
            Text("Aug 29, 2023").font(.body)
        }
        //.frame(maxWidth: .infinity, maxHeight: 50)
        .padding(.leading)
    }
}

struct AppTitle_Previews: PreviewProvider {
    static var previews: some View {
        AppTitle()
    }
}
