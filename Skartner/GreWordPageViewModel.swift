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
    
    @Published var greWordId: String?
   
    private var subscriptionManager = ObservableObjectSubscriptionManager()
    func refresh() {
        self.objectWillChange.send()
    }
    
    init() {
        self.subscriptionManager.subscribeToChildObservable(self.greWordQueryResult, refresh)
    }
    
    func fetchGreWord() {
        if (greWordId != nil) {
            let query = GreWordQuery(
                where: GraphQLNullable(GreWordWhereUniqueInput(id:GraphQLNullable(stringLiteral: greWordId!)))
            )
            greWordQueryResult.execute(query)
        }
    }
    
}
