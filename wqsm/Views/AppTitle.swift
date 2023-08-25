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
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 50)
            Spacer()
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
