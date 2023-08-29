//
//  BottlesPage.swift
//  wqsm
//
//  Created by bobsDevMac on 8/28/23.
//

import SwiftUI

struct BottlesPage: View {
    
    @EnvironmentObject var bottleManager : BottleManager
    
    var body: some View {
        
        NavigationView {
            List {
                
                //Bottle table header
                HStack {
                    Text("Id")
                        //.frame(width: 20, alignment : .leading)
                    //Spacer()
                    Text("Bottle")
                        //.frame(width: 80, alignment: .leading)
                    //Spacer()
                    //Text("Collected")
                    //    .frame(alignment: .leading)
                    Spacer()
                    Text("Time")
                        .frame(alignment: .trailing)
                }

                ForEach(bottleManager.bottles.indices, id: \.self) {index in
                    let bottle = bottleManager.bottles[index]
                    BottlesItemRow(bottle: bottle)
                        .background(index % 2 == 1 ? Color.clear : Color("Background"))
                    //BottlesItemRow(bottle: self.$bottleManager.bottles[index])
                    //  .background(index % 2 == 1 ? Color.clear : Color("Background"))
                }
                .navigationTitle("Bottles to Collect")

            }
            
        }
    }
}

struct BottlesItemRow : View {
    
    var bottle: Bottle
    //@Binding var bottle: Bottle //using @Binding instead of just a var
    
    
    var body: some View {
        HStack {
            Text("\(bottle.id)")
            Text(bottle.name)
                .frame(width: 220)
            //Text(" ")
            Image(systemName: bottle.collectedTimeStamp == "" ?
                    "square.fill.and.line.vertical.and.square" :
                    "square.and.line.vertical.and.square.fill")
                .resizable()
                .frame(maxWidth: 25, maxHeight: 20, alignment: .trailing)
            //Add Toggle here
            //Toggle(isOn: $bottle.collected) {
            //    Text("Collected")
            // }
            // .labelsHidden()
            
            Spacer()
            Text(bottle.collectedTimeStamp)
                .frame(alignment: .trailing)
        }
    }
}

struct BottlesPage_Previews: PreviewProvider {
    static var previews: some View {
        BottlesPage()
            .environmentObject(BottleManager())
    }
}
