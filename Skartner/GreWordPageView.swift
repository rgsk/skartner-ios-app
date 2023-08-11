//
//  GreWordPageView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SwiftUI

struct GreWordPageView: View {
    @StateObject var viewModel = GreWordPageViewModel()
  
    @Binding var spelling: String
   

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
                                viewModel.fetchGreWord(spelling: self.spelling, forceReload: true)
                            })
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchGreWord(spelling: self.spelling)
        }
        .onChange(of: self.spelling) {
            _ in
            viewModel.fetchGreWord(spelling: self.spelling)
        }
    }
}

struct GreWordPageWrapperView: View {
    @State var spelling = "Joker"
    var body: some View {
        GreWordPageView(spelling: $spelling)
    }
}

struct GreWordPageView_Previews: PreviewProvider {
    static var previews: some View {
        GreWordPageWrapperView()
    }
}
