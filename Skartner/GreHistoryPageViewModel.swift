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
    @Published var queryInput = ""
    private var subscriptionManager = ObservableObjectSubscriptionManager()
    func refresh() {
        self.objectWillChange.send()
    }

    init() {
        self.subscriptionManager.subscribeToChildObservable(self.greWordsQueryResult, self.refresh)
        self.fetchGreWords()
    }

    func fetchGreWords() {
        let query = GreWordsQuery(
            where: .some(.init(
                spelling: .some(.init(
                    startsWith: .some(
                        self.queryInput
                    )
                ))
            )),
            skip: 0,
            take: 120,
            orderBy: [.init(updatedAt: .some(.case(.desc)))]
        )
        self.greWordsQueryResult.execute(query)
    }
}
