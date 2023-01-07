//
//  MainModel.swift
//  PetProject
//
//  Created by Niyazov Makhmujan on 07.01.2023.
//

import Foundation

struct MainModel: Codable {
    let results: [NewsResults]
}

struct NewsResults: Codable {
    let section: String
    let subsection: String
    let abstract: String
    let title: String
    let url: String
    let publishedData: String
    let multimedia: [Multimedia]
    
    enum CodingKeys: String, CodingKey {
        case section, subsection, abstract, title, url, publishedData = "published_data", multimedia
    }
}

struct Multimedia: Codable {
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case imageUrl = "url"
    }
}
