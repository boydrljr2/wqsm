//
//  AppTitle.swift
//  wqsm
//
//  Created by bobsDevMac on 8/23/23.
//

import SwiftUI

struct AppTitle: View {
    
    static func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }

    var body: some View {
        HStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 40)
            Text("WQSM").font(.title).bold()
            Spacer()
            Text(Self.dateString(from: Date()))
                .font(.body)
                .padding(.trailing)
            Spacer()
            Image(systemName: "arrow.triangle.2.circlepath")
                .resizable()
                .frame(maxWidth: 25, maxHeight: 25)
        }
        
        .padding(.leading)
        .padding(.trailing)
    }
}

struct AppTitle_Previews: PreviewProvider {
    static var previews: some View {
        AppTitle()
    }
}
