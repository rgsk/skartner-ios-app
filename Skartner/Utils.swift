//
//  Utils.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import Foundation
import SkartnerAPI
import SwiftUI
import Apollo
import Combine


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
    @Published var errors: [GraphQLError]?
    @Published var apolloError: Error?
    @Published var isLoading: Bool = false
    
    private var cancellable: Apollo.Cancellable?
    
    func execute(
        client: ApolloClient = Network.shared.apollo,
        _ query: T,
        onSuccess: ((_ data: T.Data) -> Void)? = nil,
        onError: ((_ errors: [GraphQLError]) -> Void)? = nil,
        onApolloError: ((_ apolloError: Error) -> Void)? = nil
    ) {
        isLoading = true
        cancellable?.cancel()
        
        cancellable = client.fetch(query: query) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                self?.data = graphQLResult.data
                self?.errors = graphQLResult.errors
                if (graphQLResult.data != nil) {
                    onSuccess?(graphQLResult.data!)
                }
                if (graphQLResult.errors != nil) {
                    onError?(graphQLResult.errors!)
                }
                
            case .failure(let apolloError):
                self?.data = nil
                self?.apolloError = apolloError
                onApolloError?(apolloError)
            }
            self?.isLoading = false
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}


class ApolloMutation<T: GraphQLMutation>: ObservableObject {
    @Published var data: T.Data?
    @Published var error: Error?
    @Published var isPerforming: Bool = false
    
    private var cancellable: Apollo.Cancellable?
    
    func perform(client: ApolloClient = Network.shared.apollo, _ mutation: T) {
        isPerforming = true
        cancellable?.cancel()
        
        cancellable = client.perform(mutation: mutation) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                self?.data = graphQLResult.data
                self?.error = nil
            case .failure(let apolloError):
                self?.data = nil
                self?.error = apolloError
            }
            self?.isPerforming = false
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}
