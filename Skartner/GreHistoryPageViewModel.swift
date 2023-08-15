//
//  GreHistoryPageViewModel.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import Foundation
import SkartnerAPI

class GreHistoryPageViewModel: ObservableObject {
    @Published var greWordsQueryResult = ApolloQuery<GreWordsQuery>()
    @Published var greWordTagsQueryResult = ApolloQuery<GreWordTagsQuery>()

    @Published var queryInput = ""
    @Published var isFilterSheetPresented = false
    @Published var selectedStatuses: Set<GreWordStatus> = Set(GreWordStatus.allCases)
    @Published var selectedTags: Set<String> = Set()

    private var subscriptionManager = ObservableObjectSubscriptionManager()
    func refresh() {
        self.objectWillChange.send()
    }

    func subscribeToChildObservables() {
        self.subscriptionManager.subscribeToChildObservable(self.greWordsQueryResult, self.refresh)
        self.subscriptionManager.subscribeToChildObservable(self.greWordTagsQueryResult, self.refresh)
    }

    init() {
        self.subscribeToChildObservables()
        self.onMount()
    }

    func onMount() {
        self.fetchGreWords()
        self.fetchGreWordTags()
    }

    func fetchGreWords() {
        let query = GreWordsQuery(
            where: .some(.init(
                spelling: .some(.init(
                    startsWith: .some(
                        self.queryInput
                    )
                )),
                greWordTags: self.selectedTags.count > 0
                    ? .some(.init(some: .some(.init(name: .init(.init(in: .some(Array(self.selectedTags))))))))
                    : .none,
                status: .some(.init(in: .some(self.selectedStatuses.map { GraphQLEnum($0) })))
            )),
            skip: 0,
            take: 120,
            orderBy: [.init(updatedAt: .some(.case(.desc)))]
        )
        self.greWordsQueryResult.execute(query)
    }

    func fetchGreWordTags() {
        let query = GreWordTagsQuery(where: nil)
        self.greWordTagsQueryResult.execute(query, onSuccess: {
            _ in
        })
    }
}
