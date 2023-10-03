//
//  DetailView.swift
//  News-swiftui
//
//  Created by Squadzip on 10/3/23.
//

import SwiftUI


struct DetailView: View {
    var url: String
    
    var body: some View {
        DetailWebView(urlString: url)
    }
}


