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
            where:nil,
            skip:0,
            take:10,
            orderBy:[]
        )
        greWordsQueryResult.execute(query)
    }
    
}
