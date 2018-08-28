//
//  Pagination.swift
//  Tradersapp
//
//  Created by Ranjith Ravichandran on 17/08/18.
//  Copyright © 2018 Ranjith Ravichandran. All rights reserved.
//

import Foundation
struct Pagination: Decodable {
    
    let total: Int?
    let count: Int?
    let perPage: Int?
    let currentPage: Int?
    let totalPages: Int?
    
    let nextPage: String?
    let previousPage: String?
    
    var hasNext: Bool { return (nextPage != nil) }
    
    var hasPrevious: Bool { return (previousPage != nil) }
    
    enum CodingKeys: String, CodingKey {
        
        case total
        case count
        case perPage  = "per_page"
        case currentPage = "current_page"
        case totalPages = "total_pages"
        case links
        case previous = "previous"
        case next = "next"
    }
    
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.total = try? container.decode(Int.self, forKey: .total)
        self.count = try? container.decode(Int.self, forKey: .count)
        self.perPage = try? container.decode(Int.self, forKey: .perPage)
        self.currentPage = try? container.decode(Int.self, forKey: .currentPage)
        self.totalPages = try? container.decode(Int.self, forKey: .totalPages)
        
        if let linksContainer = try? container.nestedContainer(keyedBy: CodingKeys.self, forKey: .links) {
            
            self.nextPage = try? linksContainer.decode(String.self, forKey: .next)
            self.previousPage = try? linksContainer.decode(String.self, forKey: .previous)
            
        } else {
            self.nextPage = nil
            self.previousPage = nil
        }
    }
}
