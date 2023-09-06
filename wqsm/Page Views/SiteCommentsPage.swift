//
//  SiteCommentsPage.swift
//  wqsm
//
//  Created by bobsDevMac on 9/6/23.
//

import SwiftUI

struct SiteCommentsPage: View {
    
    //@EnvironmentObject var siteCommentsManager : SiteCommentsManager
    @EnvironmentObject var runSiteCommentsManager : RunSiteCommentsManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach (runSiteCommentsManager.runSiteComments.indices, id: \.self) { runIndex in
                    Section(header: Text(runSiteCommentsManager.runSiteComments[runIndex].name)
                        .font(.title3))
                    {
                        ForEach(runSiteCommentsManager.runSiteComments[runIndex].sites.indices, id: \.self) { siteIndex in
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(runSiteCommentsManager.runSiteComments[runIndex].sites[siteIndex].name)
                                    Spacer()
                                    TextField("", value: $runSiteCommentsManager.runSiteComments[runIndex].sites[siteIndex].value,
                                              formatter: NumberFormatter())
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding([.top, .bottom])
                                    .frame(width: 100, alignment: .trailing)
                                }
                                TextEditor(text: $runSiteCommentsManager.runSiteComments[runIndex].sites[siteIndex].comment)
                                    .frame (height: 120)
                                    .background(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.gray, lineWidth: 1)  // Provides a border
                                    ).padding([.top, .bottom])
                                
                            }
                        }
                    }
                }
            }
        }
    }
}

import Foundation

class RunSiteCommentsManager : ObservableObject {
    
    @Published var runSiteComments : [RunSiteComment] = [
        RunSiteComment (id: 0, name : "EB1 Run 1",
                        sites: [
                            SiteComment(id:0, name: "EB1 Run Site 1",
                                        comment: "Enter comment...",
                                        value: 1),
                            SiteComment(id: 1, name: "EB1 Run Site 2",
                                        comment: "Enter comment...",
                                        value: 2),
                        ]
        ),
        RunSiteComment (id: 1, name : "Sunol Run 2",
                        sites: [
                            SiteComment(id:0, name: "Sunol Run Site 1",
                                        comment: "Enter comment...",
                                        value: 3),
                            SiteComment(id: 1, name: "Sunol Run Site 2",
                                        comment: "Enter comment...",
                                        value: 4),
                        ]
            )
    ]
}

/*
class SiteCommentsManager: ObservableObject {
    
    @Published var siteComments : [SiteComment] = [
        
        SiteComment(id: 0, name: "Site 1", comment: "Enter a comment...", value:0),
        SiteComment(id: 1, name: "Site 2", comment: "  ", value:0)
    ]
}
 */

struct RunSiteComment : Identifiable {
    var id: Int
    var name : String
    var sites : [SiteComment]
}

struct SiteComment: Identifiable {
    var id: Int
    var name: String
    var comment : String
    var value : Int
}

struct SiteCommentsPage_Previews: PreviewProvider {
    static var previews: some View {
        SiteCommentsPage()
            .environmentObject(RunSiteCommentsManager())
            //.environmentObject(SiteCommentsManager())
    }
}
