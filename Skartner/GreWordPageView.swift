//
//  GreWordPageView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SkartnerAPI
import SwiftUI

let sortedGreWordStatuses = [
    GreWordStatus.startedLearning,
    GreWordStatus.stillLearning,
    GreWordStatus.almostLearnt,
    GreWordStatus.memoryMode,
    GreWordStatus.mastered
]

struct GreWordPageView: View {
    @StateObject var viewModel = GreWordPageViewModel()

    @Binding var spelling: String
    @State var selectedStatus: GreWordStatus = .startedLearning
    @State var selectedTag = ""

    var body: some View {
        VStack {
            if viewModel.greWordQueryResult.loading {
                VStack {
                    Text("Loading...")
                }
            }

            if let greWord = viewModel.greWordQueryResult.data?.greWord {
                VStack {
                    Text(greWord.id)
                    Text(greWord.spelling)

                    Picker("Status", selection: $selectedStatus) {
                        ForEach(sortedGreWordStatuses, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    if let allGreWordTags = viewModel.greWordTagsQueryResult.data?.greWordTags {
                        let tagsUsed = (greWord.greWordTags ?? []).map { $0.name }
                        let notIncluded = allGreWordTags.filter { !tagsUsed.contains($0.name) }
                        Picker("Tag", selection: $selectedTag) {
                            Text("").tag("")
                            ForEach(notIncluded, id: \.self) { tag in
                                Text(tag.name).tag(tag.name)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .onChange(of: selectedTag) { _ in
                            viewModel.updateGreWord(
                                greWordTagNames: (greWord.greWordTags?.map { $0.name } ?? []) + [selectedTag]
                            )
                            selectedTag = ""
                        }
                    }

                    if greWord.greWordTags != nil && !greWord.greWordTags!.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(greWord.greWordTags ?? [], id: \.self) { greWordTag in
                                    TagView(tag: greWordTag.name, onCrossClick: {
                                        viewModel.updateGreWord(
                                            greWordTagNames:
                                            (greWord.greWordTags?.map { $0.name }
                                                ??
                                                []
                                            )
                                            .filter { $0 != greWordTag.name }
                                        )
                                    })
                                }
                            }
                            .padding()
                        }
                    }

                    if let gptPrompts = viewModel.greWordQueryResult.data?.greWord?.gptPrompts {
                        List(gptPrompts, id: \.id) { gptPrompt in
                            GptPromptView(gptPrompt: gptPrompt, onPromptUpdate: {
                                viewModel.fetchGreWord(
                                    spelling: self.spelling,
                                    forceReload: true
                                )
                            })
                        }
                    }
                }
                .onAppear {
                    selectedStatus = greWord.status.value ?? GreWordStatus.startedLearning
                }
                .onChange(of: selectedStatus) { newValue in
//                    print(newValue.rawValue)
                    if greWord.status != newValue {
                        viewModel.updateGreWord(status: newValue)
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchGreWord(spelling: self.spelling)
        }
        .onChange(of: self.spelling) {
            _ in
            viewModel.fetchGreWord(spelling: self.spelling)
        }
    }
}

struct GreWordPageWrapperView: View {
    @State var spelling = "Joker"
    var body: some View {
        GreWordPageView(spelling: $spelling)
    }
}

struct GreWordPageView_Previews: PreviewProvider {
    static var previews: some View {
        GreWordPageWrapperView()
    }
}
