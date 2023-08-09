import SwiftUI

struct ContentView: View {
    let textResponses = [
        "Response 1",
        "Response 2",
        "Response 3"
    ]
    
    @State private var selectedTabIndex = 0

    var body: some View {
        VStack {
            Picker(selection: $selectedTabIndex, label: Text("dasdas")) {
                ForEach(0..<textResponses.count, id: \.self) { index in
                    Text(textResponses[index]).tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text(textResponses[selectedTabIndex])
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
