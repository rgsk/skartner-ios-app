//
//  GreHistoryFiltersView.swift
//  Skartner
//
//  Created by Rahul Gupta on 15/08/23.
//

import SkartnerAPI
import SwiftUI

struct GreHistoryFiltersView: View {
    let allStatuses: [GreWordStatus]
    let allTags: [String]
    @Binding var selectedStatuses: Set<GreWordStatus>
    @Binding var selectedTags: Set<String>
    let onClose: () -> Void

    var body: some View {
        NavigationView {
            VStack {
                List(allStatuses, id: \.self) { status in
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
                List(allTags, id: \.self) { tag in
                    Toggle(isOn: Binding(
                        get: { selectedTags.contains(tag) },
                        set: { newValue in
                            if newValue {
                                selectedTags.insert(tag)
                            } else {
                                selectedTags.remove(tag)
                            }
                        }
                    )) {
                        Text(tag)
                    }
                }
            }
            .navigationTitle("Filters")
            .navigationBarItems(trailing: Button("Done") {
                // Close the modal sheet
                // You can perform any necessary actions here
                onClose()
            })
            .onDisappear {
                onClose()
            }
        }
    }
}

struct GreHistoryFiltersView_Wrapper: View {
    @State private var selectedStatuses: Set<GreWordStatus> = Set(GreWordStatus.allCases)
    @State private var selectedTags: Set<String> = Set()

    var body: some View {
        GreHistoryFiltersView(
            allStatuses: sortedGreWordStatuses,
            allTags: ["rahul", "mehak", "kiara"],
            selectedStatuses: $selectedStatuses,
            selectedTags: $selectedTags,
            onClose: {
                print("close called")
            }
        )
    }
}

struct GreHistoryFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        GreHistoryFiltersView_Wrapper()
    }
}
