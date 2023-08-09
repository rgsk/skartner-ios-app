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

let userId = "b2b5c36e-ad55-45d3-ad6e-51b695911acb"

class GrePageViewModel: ObservableObject {
    @Published var wordInput: String = ""
    @Published var sendSinglePromptQueryResult = ApolloQuery<SendSinglePromptQuery>()
    @Published var createGreWordMutationResult = ApolloMutation<CreateGreWordMutation>()
    private var subscriptionManager = ObservableObjectSubscriptionManager()
    
    func refresh() {
        self.objectWillChange.send()
    }
    
    init() {
        self.subscriptionManager.subscribeToChildObservable(self.sendSinglePromptQueryResult, refresh)
        self.subscriptionManager.subscribeToChildObservable(self.createGreWordMutationResult, refresh)
    }
    
    func getPrompt () -> String {
        return "list meaning and 3 easy example sentences for word - \(wordInput)"
    }
    
    func sendSinglePrompt() {
        let query = SendSinglePromptQuery(
            input: getPrompt(),
            skipCache: true,
            indexesReturned: [],
            resultIndexFromCache: 0
        )
        
        self.sendSinglePromptQueryResult.execute(query, onSuccess: {
            data in
            print("onSuccess")
            print(data.sendSinglePrompt.result ?? " ")
        }, onError: {
            errors in
            print("onError")
            print(errors[0].message ?? " ")
        }, onApolloError: {
            error in
            print("onApolloError")
            print(error.localizedDescription)
        })
    }
    
    func createGreWord() {
        if let promptResponse = sendSinglePromptQueryResult.data?.sendSinglePrompt.result {
            let mutation = CreateGreWordMutation(spelling: wordInput, promptInput: getPrompt(), promptResponse: promptResponse, userId: userId, greWordTags: [])
            self.createGreWordMutationResult.perform(mutation)
        }
        
    }
}
