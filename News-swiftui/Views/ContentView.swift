//
//  ContentView.swift
//  News-swiftui
//
//  Created by Squadzip on 10/3/23.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url ?? "")) {
                    HStack {
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("News Reports")
        }
        .onAppear {
            networkManager.fetchData()
        }
    }
}



