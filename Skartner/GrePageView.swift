//
//  GrePageView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SwiftUI
import SkartnerAPI


struct GrePageView: View {
    @State private var wordInput: String = ""
    @State private var sendSinglePromptResult: String?
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                TextField("Word", text: $wordInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    Network.shared.apollo.fetch(query: SendSinglePromptQuery(
                        input: "list meaning and 3 easy example sentences for word - \(wordInput)", skipCache: true,
                        indexesReturned: [],
                        resultIndexFromCache: 0
                    )) { result in
                        switch result {
                        case .success(let graphQLResult):
                            sendSinglePromptResult = graphQLResult.data?.sendSinglePrompt.result
                        case .failure(let error):
                            print("Failure! Error: \(error)")
                        }
                    }
                }) {
                    Image(systemName: "paperplane.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            
            Spacer()
            Text(sendSinglePromptResult ?? "hii")
        }
    }
}

struct GrePageView_Previews: PreviewProvider {
    static var previews: some View {
        GrePageView()
    }
}
