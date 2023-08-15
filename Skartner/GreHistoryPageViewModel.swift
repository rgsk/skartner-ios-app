//
//  GreHistoryPageViewModel.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import Foundation
import SkartnerAPI
typealias SortOrder = SkartnerAPI.SortOrder

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
            where: GraphQLNullable(GreWordWhereInput(
                spelling: GraphQLNullable(StringFilter(
                    startsWith: GraphQLNullable(
                        stringLiteral: self.queryInput
                    )
                ))
            )),
            skip: 0,
            take: 120,
            orderBy: [GreWordOrderByWithRelationInput(updatedAt: GraphQLNullable(SortOrder.desc))]
        )
        self.greWordsQueryResult.execute(query)
    }
}
