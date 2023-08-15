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
    @State var selectedOption: GreWordStatus = .startedLearning

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

                    Picker("Status", selection: $selectedOption) {
                        ForEach(sortedGreWordStatuses, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())

                    if greWord.greWordTags != nil && !greWord.greWordTags!.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(greWord.greWordTags ?? [], id: \.self) { greWordTag in
                                    TagView(tag: greWordTag.name, onCrossClick: {
                                        viewModel.updateGreWord(
                                            status: greWord.status.value!,
                                            greWordTags: (greWord.greWordTags ?? []).filter { $0 != greWordTag }
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
                    selectedOption = greWord.status.value ?? GreWordStatus.startedLearning
                }
                .onChange(of: selectedOption) { newValue in
//                    print(newValue.rawValue)
                    if greWord.status != newValue {
                        viewModel.updateGreWord(status: newValue, greWordTags: greWord.greWordTags ?? [])
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
