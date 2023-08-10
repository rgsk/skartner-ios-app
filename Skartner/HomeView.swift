//
//  HomeView.swift
//  Skartner
//
//  Created by Rahul Gupta on 11/08/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            // Tab 1
            GrePageView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(0)
            
            // Tab 2
            GreHistoryPageView()
                .tabItem {
                    Image(systemName: "clock")
                    Text("History")
                }
                .tag(1)
            
            // Tab 3
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
