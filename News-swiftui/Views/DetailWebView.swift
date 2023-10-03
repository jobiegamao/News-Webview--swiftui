//
//  DetailWebView.swift
//  News-swiftui
//
//  Created by Squadzip on 10/3/23.
//

import SwiftUI
import WebKit

struct DetailWebView: UIViewRepresentable {
    
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

