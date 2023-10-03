//
//  PostDataModel.swift
//  News-swiftui
//
//  Created by Squadzip on 10/3/23.
//

import Foundation

struct Result: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let author: String?
    let url: String?
    let created_at_i: Int?
}
