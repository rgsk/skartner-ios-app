//
//  GreWordPageViewModel.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import Foundation
import SkartnerAPI

class GreWordPageViewModel: ObservableObject {
    @Published var greWordQueryResult = ApolloQuery<GreWordQuery>()
    
    
    private var subscriptionManager = ObservableObjectSubscriptionManager()
    func refresh() {
        self.objectWillChange.send()
    }
    
    init() {
        self.subscriptionManager.subscribeToChildObservable(self.greWordQueryResult, refresh)
    }
    
    func fetchGreWord(greWordId:String, forceReload:Bool?=false) {
        let query = GreWordQuery(
            where: GraphQLNullable(GreWordWhereUniqueInput(id:GraphQLNullable(stringLiteral: greWordId)))
        )
        greWordQueryResult.execute(query, forceReload: forceReload, onSuccess: {
            data in
        })
    }
    
}
