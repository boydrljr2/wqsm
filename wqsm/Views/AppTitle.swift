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
            Image(systemName: "line.horizontal.3")
                .resizable()
                .frame(maxWidth: 25, maxHeight:25)
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxHeight: 40)
            Text("WQSM").font(.title).bold()
            Spacer()
            Image(systemName: "arrow.clockwise.icloud")
                .resizable()
                .frame(maxWidth: 50, maxHeight: 25)
            Spacer()
            /*
            Text("Aug 29, 2023")
                .font(.body)
                .padding(.trailing)
            */
            Text(Self.dateString(from: Date()))
                .font(.body)
                .padding(.trailing)


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
