//
//  Model.swift
//  GameStream
//
//  Created by Enrique Ramos on 8/8/21.
//

import Foundation

struct Resultados: Codable {
    
    var results:[Game]
}

struct Games: Codable {
    
    var games:[Game]
}

struct Game: Codable, Hashable {
    
    var title: String
    var studio: String
    var contentRaiting: String
    var publicationYear: String
    var description: String
    var platforms: [String]
    var tags: [String]
    var videosUrls: videosUrl
    var galleryImages: [String]
    
    
}

struct videosUrl: Codable, Hashable {
    var mobile: String
    var tablet: String
}
