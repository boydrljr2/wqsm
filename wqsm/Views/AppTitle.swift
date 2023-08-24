//
//  AppTitle.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

struct AppTitle: View {
    var body: some View {
        VStack {
            Text("WQSM App")
                .foregroundColor(Color("Primary"))
                .bold()
        }
        .padding()
    }
}

struct AppTitle_Previews: PreviewProvider {
    static var previews: some View {
        AppTitle()
    }
}
