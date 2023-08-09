//
//  GreHistoryPageView.swift
//  Skartner
//
//  Created by Rahul Gupta on 09/08/23.
//

import SwiftUI

struct GreHistoryPageView: View {
    @StateObject var viewModel = GreHistoryPageViewModel()

    var body: some View {
        VStack {
            if let greWords = viewModel.greWordsQueryResult.data?.greWords {
                List(greWords, id:\.id) { greWord in
                    VStack {
                        Text(greWord.spelling)
                    }
                }
            }
        }
    }
}

struct GreHistoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        GreHistoryPageView()
    }
}
