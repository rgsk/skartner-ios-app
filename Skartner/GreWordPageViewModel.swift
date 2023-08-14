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
    @Published var updateGreWordMutationResult = ApolloMutation<UpdateGreWordMutation>()

    private var subscriptionManager = ObservableObjectSubscriptionManager()
    func refresh() {
        self.objectWillChange.send()
    }

    init() {
        self.subscriptionManager.subscribeToChildObservable(self.greWordQueryResult, self.refresh)
        self.subscriptionManager.subscribeToChildObservable(self.updateGreWordMutationResult, self.refresh)
    }

    func fetchGreWord(spelling: String, forceReload: Bool? = false) {
        let query = GreWordQuery(
            where: GraphQLNullable(
                GreWordWhereUniqueInput(
                    spelling_userId: GraphQLNullable(
                        GreWordSpellingUserIdCompoundUniqueInput(
                            spelling: spelling,
                            userId: userId
                        )
                    )
                )
            )
        )
        self.greWordQueryResult.execute(query, forceReload: forceReload, onSuccess: {
            _ in
        })
    }

    func updateGreWord(status: GreWordStatus) {
//        print("updateGreWord called")
        if let greWord = greWordQueryResult.data?.greWord {
            let mutation = UpdateGreWordMutation(
                updateGreWordId: greWord.id, greWordTags: nil, status: GraphQLNullable(status)
            )
            self.updateGreWordMutationResult.perform(mutation, onSuccess: {
                _ in
                self.fetchGreWord(spelling: greWord.spelling, forceReload: true)
            })
        }
    }
}
