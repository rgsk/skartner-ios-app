//
//  GreHistoryPageView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SwiftUI

struct GreHistoryPageView: View {
    @StateObject var viewModel = GreHistoryPageViewModel()

    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $viewModel.queryInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .onChange(of: viewModel.queryInput) {
                        _ in

                        viewModel.fetchGreWords()
                    }

                Button(action: {
                    viewModel.isFilterSheetPresented = true
                }) {
                    Text("Open Filters")
                }

                List(viewModel.allGreWords, id: \.id) { greWord in
                    NavigationLink(destination: GreWordPageWrapperView(spelling: greWord.spelling)) {
                        VStack {
                            Text(greWord.spelling)
                        }
                        .onAppear {
                            if greWord == viewModel.allGreWords.last {
                                viewModel.loadMoreWords()
                            }
                        }
                    }
                }
            }

            .sheet(isPresented: $viewModel.isFilterSheetPresented) {
                if let greWordTags = viewModel.greWordTagsQueryResult.data?.greWordTags {
                    GreHistoryFiltersView(
                        allStatuses: sortedGreWordStatuses,
                        allTags: greWordTags.map {
                            tag in
                            tag.name
                        },
                        selectedStatuses: $viewModel.selectedStatuses,
                        selectedTags: $viewModel.selectedTags,
                        onClose: {
                            viewModel.isFilterSheetPresented = false
                            viewModel.fetchGreWords()
                        }
                    )
                }
            }
        }
    }
}

struct GreHistoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        GreHistoryPageView()
    }
}
