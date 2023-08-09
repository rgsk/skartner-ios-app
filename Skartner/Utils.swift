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
    @Published var loading: Bool = false
    
    private var cancellable: Apollo.Cancellable?
    
    func execute(
        client: ApolloClient = Network.shared.apollo,
        _ query: T,
        onSuccess: ((_ data: T.Data) -> Void)? = nil,
        onError: ((_ errors: [GraphQLError]) -> Void)? = nil,
        onApolloError: ((_ apolloError: Error) -> Void)? = nil
    ) {
        loading = true
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
            self?.loading = false
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}


class ApolloMutation<T: GraphQLMutation>: ObservableObject {
    @Published var data: T.Data?
    @Published var errors: [GraphQLError]?
    @Published var apolloError: Error?
    @Published var loading: Bool = false
    
    private var cancellable: Apollo.Cancellable?
    
    func perform(
        client: ApolloClient = Network.shared.apollo,
        _ mutation: T,
        onSuccess: ((_ data: T.Data) -> Void)? = nil,
        onError: ((_ errors: [GraphQLError]) -> Void)? = nil,
        onApolloError: ((_ apolloError: Error) -> Void)? = nil
    ) {
        loading = true
        cancellable?.cancel()
        
        cancellable = client.perform(mutation: mutation) { [weak self] result in
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
            self?.loading = false
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
}


func convertToJSON<T>(_ object: T) -> String? {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    
    if let encodableObject = object as? Encodable {
        do {
            let jsonData = try encoder.encode(encodableObject)
            return String(data: jsonData, encoding: .utf8)
        } catch {
            print("Error encoding JSON: \(error)")
        }
    } else {
        print("Object is not encodable.")
    }
    
    return nil
}
