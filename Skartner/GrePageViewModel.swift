//
//  GrePageViewModal.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import Foundation
import SkartnerAPI

class GrePageViewModel: ObservableObject {
    @Published var wordInput: String = ""
    @Published var sendSinglePromptResult: String?
    
    func sendSinglePrompt() {
        Network.shared.apollo.fetch(query: SendSinglePromptQuery(
            input: "list meaning and 3 easy example sentences for word - \(wordInput)", skipCache: true,
            indexesReturned: [],
            resultIndexFromCache: 0
        )) { [weak self] result in
            switch result {
            case .success(let graphQLResult):
                self?.sendSinglePromptResult = graphQLResult.data?.sendSinglePrompt.result
            case .failure(let error):
                print("Failure! Error: \(error)")
            }
        }
    }
}
