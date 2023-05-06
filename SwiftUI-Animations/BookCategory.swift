//
//  BookCategory.swift
//  SwiftUI-Animations
//
//  Created by Bhoopendra Umrao on 05/05/2023.
//

import Foundation

struct Category: Identifiable, Equatable {
    let id: UUID
    let name: String
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
    
    static let sample: [Category] = [
        Category(name: "Adventure"),
        Category(name: "Sci-Fi"),
        Category(name: "Love"),
        Category(name: "Space"),
        Category(name: "Spritual"),
        Category(name: "Finance")
    ]
}

struct Book: Identifiable, Equatable {
    let id: UUID
    let name: String
    let image: String
    let rating: Int
    
    init(id: UUID = UUID(), name: String, image: String, rating: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.rating = rating
    }
    
    static let sample: [Book] = [
        .init(name: "Rich Dad", image: "1", rating: 3),
        .init(name: "Poor Dad", image: "2", rating: 2),
        .init(name: "Rich Dad Poor Dad", image: "3", rating: 5),
        .init(name: "Rich Dad Poor Dad", image: "1", rating: 1),
        .init(name: "Rich Dad Poor Dad", image: "2", rating: 3),
        .init(name: "Rich Dad Poor Dad", image: "3", rating: 2)
    ]
}
