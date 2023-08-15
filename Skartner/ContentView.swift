import SkartnerAPI
import SwiftUI

struct ContentView: View {
    @State private var isFilterSheetPresented = false
    @State private var selectedStatuses: Set<GreWordStatus> = Set(GreWordStatus.allCases)

    let sortedGreWordStatuses: [GreWordStatus] = [
        .startedLearning,
        .stillLearning,
        .almostLearnt,
        .memoryMode,
        .mastered
    ]

    var body: some View {
        VStack {
            Button(action: {
                isFilterSheetPresented.toggle()
            }) {
                Text("Open Filters")
            }
        }
        .sheet(isPresented: $isFilterSheetPresented) {
            FiltersView(selectedStatuses: $selectedStatuses, sortedGreWordStatuses: sortedGreWordStatuses)
        }
    }
}

struct FiltersView: View {
    @Binding var selectedStatuses: Set<GreWordStatus>
    let sortedGreWordStatuses: [GreWordStatus]

    var body: some View {
        NavigationView {
            List(sortedGreWordStatuses, id: \.self) { status in
                Toggle(isOn: Binding(
                    get: { selectedStatuses.contains(status) },
                    set: { newValue in
                        if newValue {
                            selectedStatuses.insert(status)
                        } else {
                            selectedStatuses.remove(status)
                        }
                    }
                )) {
                    Text(status.rawValue)
                }
            }
            .navigationTitle("Filters")
            .navigationBarItems(trailing: Button("Done") {
                // Close the modal sheet
                // You can perform any necessary actions here
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
