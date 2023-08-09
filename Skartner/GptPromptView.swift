//
//  GptPromptView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SwiftUI
import SkartnerAPI

struct GptPromptView: View {
    let gptPrompt: GreWordQuery.Data.GreWord.GptPrompt
    @StateObject var viewModel = GptPromptViewModel()
    @State var editModeActive = false
    @State var editedText = ""
    @State private var selectedTabIndex = 0
    let onPromptUpdate: () -> Void

    var body: some View {
        if editModeActive {
            VStack {
                TextEditor(text: $editedText)
                    .padding()
                    .border(Color.blue, width: 1)
                    .frame(minHeight: 200)
                
                Button("Done") {
                    editModeActive = false
                    if gptPrompt.greWordId != nil {
                        viewModel.updateGptPrompt(id: gptPrompt.id, editedResponse: editedText, greWordId: gptPrompt.greWordId!, onSuccess: onPromptUpdate)
                    }
                }
            }
            
        } else {
            
         
            
            if gptPrompt.editedResponse != nil {
                Picker(selection: $selectedTabIndex, label: Text("")) {
                    Text("Edited Response").tag(0)
                    Text("Response").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                
               
                
            }
            
            if gptPrompt.editedResponse == nil || selectedTabIndex == 1 {
                Text(gptPrompt.response)
                    .onTapGesture(count: 2) {
                        editedText = gptPrompt.response
                        editModeActive = true
                    }
               
            } else {
                Text(gptPrompt.editedResponse!)
                    .onTapGesture(count: 2) {
                        editedText = gptPrompt.editedResponse!
                        editModeActive = true
                    }
            }
            
        }
    }
}

//struct GptPromptView_Previews: PreviewProvider {
//    static var previews: some View {
//        GptPromptView()
//    }
//}
