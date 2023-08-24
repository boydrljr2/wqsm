import SwiftUI

struct FieldTestItemList: View {
    var fieldTests: [FieldTest] = [
        FieldTest(id: 0, name: "C12 Residual, free", value: "3", time: "3:45pm"),
        FieldTest(id: 1, name: "Temperature (F)", value: "82", time: "4:05pm"),
        FieldTest(id: 2, name: "C12 Residual, free", value: "3", time: "3:45pm"),
        FieldTest(id: 3, name: "Temperature (F)", value: "82", time: "4:05pm")
    ]
    
    var body: some View {
        List {
            ForEach(fieldTests) { fieldTest in
                FieldTestRow(fieldTest: fieldTest)
            }
        }
    }
}

struct FieldTestRow: View {
    var fieldTest: FieldTest
    
    var body: some View {
        HStack {
            Text("\(fieldTest.id)")
                .frame(width: 50, alignment: .leading) // Adjust the width as needed
            Text(fieldTest.name)
            Spacer()
            Text(fieldTest.value)
            Spacer()
            Text(fieldTest.time)
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct FieldTestItemList_Previews: PreviewProvider {
    static var previews: some View {
        FieldTestItemList()
    }
}
