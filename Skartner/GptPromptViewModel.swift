//
//  GptPromptViewModal.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import Foundation
import SkartnerAPI

class GptPromptViewModel: ObservableObject {
    @Published var updateGptPromptMutationResult = ApolloMutation<UpdateGptPromptMutation>()
    
    
    private var subscriptionManager = ObservableObjectSubscriptionManager()
    func refresh() {
        self.objectWillChange.send()
    }
    
    init() {
        self.subscriptionManager.subscribeToChildObservable(self.updateGptPromptMutationResult, refresh)
    }
    
    func updateGptPrompt(id: String, editedResponse: String) {
        let mutation = UpdateGptPromptMutation(
            id: id, editedResponse:GraphQLNullable(stringLiteral: editedResponse)
        )
        self.updateGptPromptMutationResult.perform(mutation)
    }
    
}
