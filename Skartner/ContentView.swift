import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            // Tab 1
            Text("Tab 1 Content")
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Tab 1")
                }
                .tag(0)
            
            // Tab 2
            Text("Tab 2 Content")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Tab 2")
                }
                .tag(1)
            
            // Tab 3
            Text("Tab 3 Content")
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Tab 3")
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
