//
//  ContentView.swift
//  Skartner
//
//  Created by Rahul Gupta on 08/08/23.
//

import SwiftUI
import SkartnerAPI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!").onAppear {
                Network.shared.apollo.fetch(query: HelloQuery()) { result in
                       switch result {
                       case .success(let graphQLResult):
                           print("Success! Result: \(graphQLResult)")
                           print("Result: \(graphQLResult.data?.hello.message ?? "hii")")
                       case .failure(let error):
                           print("Failure! Error: \(error)")
                       }
                   }
                
                
                Network.shared.apollo.fetch(query: SendSinglePromptQuery(input: "list meaning and 3 easy example sentences for word - cool", skipCache: true, indexesReturned: [], resultIndexFromCache: 0)) { result in
                       switch result {
                       case .success(let graphQLResult):
                           print("Success! Result: \(graphQLResult)")
                           print("Result: \(graphQLResult.data?.sendSinglePrompt.result ?? "hii")")
                       case .failure(let error):
                           print("Failure! Error: \(error)")
                       }
                   }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
