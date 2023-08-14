import SwiftUI

struct ContentView: View {
    @State private var selectedOption = "Option 1"
    private let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
    
    var body: some View {
        VStack {
            Text("Select an option:")
                .font(.headline)
            
            Picker("Options", selection: $selectedOption) {
                ForEach(options, id: \.self) { option in
                    Text(option).tag(option)
                }
            }
            .pickerStyle(MenuPickerStyle())
            
            Text("Selected Option: \(selectedOption)")
        }
        .padding()
        .onChange(of: selectedOption) { newValue in
                    // This closure will be called whenever the selected option changes
                    print("Selected option changed to: \(newValue)")
                }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
