//
//  GptPromptView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SwiftUI
import SkartnerAPI
import SwiftUIIntrospect

struct GptPromptView: View {
    let gptPrompt: GreWordQuery.Data.GreWord.GptPrompt
    @StateObject var viewModel = GptPromptViewModel()
    @State var editModeActive = false
    @State var editedText = ""
    @State private var selectedTabIndex = 0
    let onPromptUpdate: () -> Void
    @State var becomeFirstResponder = true
    
    var body: some View {
        
        
        
        VStack {
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
            
        }.sheet(isPresented: $editModeActive) {
            
            VStack {
                TextEditor(text: $editedText)
                    .padding()
                    .border(Color.blue, width: 1)
                    .frame(minHeight: 200)
                    .onAppear {
                        self.becomeFirstResponder = true
                    }
                    .introspect(.textEditor, on: .iOS(.v14, .v15, .v16, .v17)) { textEditor in
                        if self.becomeFirstResponder {
                            // if condition is added to prevent cycles
                            textEditor.becomeFirstResponder()
                            self.becomeFirstResponder = false
                        }
                    }
                   
                
            }
            
            Button("Done") {
                editModeActive = false
                if gptPrompt.greWordId != nil {
                    viewModel.updateGptPrompt(id: gptPrompt.id, editedResponse: editedText, greWordId: gptPrompt.greWordId!, onSuccess: onPromptUpdate)
                }
            }
        }
        .presentationDetents([.height(200), .medium, .large])
        .presentationDragIndicator(.automatic)
    }
    
}


//struct GptPromptView_Previews: PreviewProvider {
//    static var previews: some View {
//        GptPromptView()
//    }
//}
