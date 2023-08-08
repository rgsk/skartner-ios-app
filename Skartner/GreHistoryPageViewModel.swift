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
    private var subscriptionManager = ObservableObjectSubscriptionManager()
    func refresh() {
        self.objectWillChange.send()
    }
    
    init() {
        self.subscriptionManager.subscribeToChildObservable(self.greWordsQueryResult, refresh)
        fetchGreWords()
    }
    
    func fetchGreWords() {
        let query = GreWordsQuery(
            where: GraphQLNullable(GreWordWhereInput(
                spelling: GraphQLNullable(StringFilter(startsWith: "c"))
            )),
            skip: 0,
            take: 10,
            orderBy:[GreWordOrderByWithRelationInput(updatedAt: GraphQLNullable(SortOrder.desc))]
        )
        greWordsQueryResult.execute(query)
    }
    
}
