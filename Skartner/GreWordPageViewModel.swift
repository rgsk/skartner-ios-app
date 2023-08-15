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

    @Published var greWordTagsQueryResult = ApolloQuery<GreWordTagsQuery>()

    private var subscriptionManager = ObservableObjectSubscriptionManager()
    func refresh() {
        self.objectWillChange.send()
    }

    func subscribeToChildObservables() {
        self.subscriptionManager.subscribeToChildObservable(self.greWordQueryResult, self.refresh)
        self.subscriptionManager.subscribeToChildObservable(self.updateGreWordMutationResult, self.refresh)
        self.subscriptionManager.subscribeToChildObservable(self.greWordTagsQueryResult, self.refresh)
    }

    init() {
        self.subscribeToChildObservables()
        self.onMount()
    }

    func onMount() {
        self.fetchGreWordTags()
    }

    func fetchGreWord(spelling: String, forceReload: Bool? = false) {
        let query = GreWordQuery(
            where: .some(.init(
                spelling_userId: .some(.init(
                    spelling: spelling,
                    userId: userId
                ))
            ))
        )
        self.greWordQueryResult.execute(query, forceReload: forceReload, onSuccess: {
            _ in
        })
    }

    func updateGreWord(status: GreWordStatus? = nil, greWordTagNames: [String]? = nil) {
//        print("updateGreWord called")

        if let greWord = greWordQueryResult.data?.greWord {
            let mutation = UpdateGreWordMutation(
                updateGreWordId: greWord.id,
                greWordTags: greWordTagNames != nil ?
                    .some(greWordTagNames!.map { name in
                        .init(name: .some(name))
                    })
                    : nil,
                status: status != nil ? .some(.init(status!)) : nil
            )
            self.updateGreWordMutationResult.perform(mutation, onSuccess: {
                _ in
                self.fetchGreWord(spelling: greWord.spelling, forceReload: true)
            })
        }
    }

    func fetchGreWordTags() {
        let query = GreWordTagsQuery(where: nil)
        self.greWordTagsQueryResult.execute(query, onSuccess: {
            _ in
        })
    }
}
