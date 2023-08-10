//
//  SampleWebView.swift
//  OddEven
//
//  Created by Rahul Gupta on 25/07/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView  {
        let wkwebView = WKWebView()
        let request = URLRequest(url: url)
        wkwebView.load(request)
        return wkwebView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
    }
}

struct SampleWebView: View {
    var body: some View {
//        WebView(url: URL(string: "https://store.pw.live")!)
//            .ignoresSafeArea(.all)
           WebView(url: URL(string: "http://192.168.29.114:3001/prac2")!)
            .ignoresSafeArea(.all)
    
    }
}

struct SampleWebView_Previews: PreviewProvider {
    static var previews: some View {
        SampleWebView()
    }
}
