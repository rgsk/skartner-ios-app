//
//  GreWordPageView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SwiftUI

struct GreWordPageView: View {
    @StateObject var viewModel = GreWordPageViewModel()
  
    let greWordId: String
    
    init(greWordId: String) {
        self.greWordId = greWordId;
    }

    var body: some View {
        VStack {
            if viewModel.greWordQueryResult.loading {
                VStack {
                    Text("Loading...")
                }
            }
            
            if let greWord = viewModel.greWordQueryResult.data?.greWord {
                VStack {
                    Text(greWord.id)
                    Text(greWord.spelling)
                    if let gptPrompts = viewModel.greWordQueryResult.data?.greWord?.gptPrompts {
                        List(gptPrompts, id:\.id) { gptPrompt in
                            GptPromptView(gptPrompt: gptPrompt, onPromptUpdate: {
                                viewModel.fetchGreWord(greWordId: self.greWordId, forceReload: true)
                            })
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchGreWord(greWordId: self.greWordId)
        }
    }
}

struct GreWordPageView_Previews: PreviewProvider {
    static var previews: some View {
        GreWordPageView(greWordId: "3036263c-cbd5-4cd2-8dac-7acc04de93eb")
    }
}
