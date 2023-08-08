//
//  GrePageViewModal.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import Foundation
import SkartnerAPI
import SwiftUI
import Apollo
import Combine  

class GrePageViewModel: ObservableObject {
    @Published var wordInput: String = ""
    @Published var sendSinglePromptResult = ApolloQuery<SendSinglePromptQuery>()
    private var subscriptionManager = ObservableObjectSubscriptionManager()
    
    init() {
        self.subscriptionManager.subscribeToChildObservable(self.sendSinglePromptResult) {
            self.objectWillChange.send()
        }
    }
    
    func sendSinglePrompt() {
        let query = SendSinglePromptQuery(
            input: "list meaning and 3 easy example sentences for word - \(wordInput)",
            skipCache: true,
            indexesReturned: [],
            resultIndexFromCache: 0
        )
        
        self.sendSinglePromptResult.execute(query)
    }
    
    
}

class ObservableObjectSubscriptionManager: ObservableObject {
    private var cancellables: [AnyCancellable] = []
    
    
    func subscribeToChildObservable<ChildType: ObservableObject>(_ child: ChildType, _ fn: @escaping () -> Void) {
        let propertyPublisher = child
            .objectWillChange
            .map { _ in () }
            .eraseToAnyPublisher()
        
        cancellables.append(
            propertyPublisher.sink { _ in
                fn()
            }
        )
    }
    
    deinit {
        for cancellable in cancellables {
            cancellable.cancel()
        }
    }
}




class ApolloQuery<T: GraphQLQuery>: ObservableObject {
    @Published var data: T.Data?
    @Published var error: Error?
    @Published var isLoading: Bool = false
    
    private var cancellable: Apollo.Cancellable?
    
    func execute(client: ApolloClient = Network.shared.apollo, _ query: T) {
        isLoading = true
        cancellable?.cancel()
        
        cancellable = client.fetch(query: query) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                self?.data = graphQLResult.data
                self?.error = nil
            case .failure(let apolloError):
                self?.data = nil
                self?.error = apolloError
            }
            self?.isLoading = false
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}
