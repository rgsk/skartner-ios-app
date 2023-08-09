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
    @State var editModeActive = false
    @State var editedText = ""
    
    var body: some View {
        if editModeActive {
            VStack {
                TextEditor(text: $editedText)
                    .padding()
                    .border(Color.blue, width: 1)
                
                Button("Done") {
                    editModeActive = false
                }
            }
            
        } else {
            Text(gptPrompt.response)
                .onTapGesture(count: 2) {
                    editedText = gptPrompt.response
                    editModeActive = true
                }
        }
    }
}

//struct GptPromptView_Previews: PreviewProvider {
//    static var previews: some View {
//        GptPromptView()
//    }
//}
