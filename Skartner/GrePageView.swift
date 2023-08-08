//
//  GrePageView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SwiftUI
import SkartnerAPI


struct GrePageView: View {
    
    @StateObject var viewModel = GrePageViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                HStack {
                    TextField("Word", text: $viewModel.wordInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        viewModel.sendSinglePrompt()
                    }) {
                        Image(systemName: "paperplane.fill")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
                Button(action: {
                    viewModel.createGreWord()
                }) {
                   Text("Save")
                }
            }
            .padding()
            
            Spacer()
            if viewModel.sendSinglePromptQueryResult.isLoading {
                Text("Loading...")
            } else if let data = viewModel.sendSinglePromptQueryResult.data {
                Text(data.sendSinglePrompt.result ?? " ")
            }
            
        }
    }
}

struct GrePageView_Previews: PreviewProvider {
    static var previews: some View {
        GrePageView()
    }
}
