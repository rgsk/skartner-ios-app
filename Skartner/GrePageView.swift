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
            .padding()
            
            Spacer()
            if viewModel.sendSinglePromptResult.isLoading {
                Text("Loading...")
            } else if let data = viewModel.sendSinglePromptResult.data {
                Text(viewModel.sendSinglePromptResult.data?.sendSinglePrompt.result ?? "hii")
            }
            
        }
    }
}

struct GrePageView_Previews: PreviewProvider {
    static var previews: some View {
        GrePageView()
    }
}
