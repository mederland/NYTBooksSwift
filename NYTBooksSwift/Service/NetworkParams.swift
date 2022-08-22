//
//  NetworkParams.swift
//  NYTBooksSwift
//
//  Created by Consultant on 8/22/22.
//

import Foundation

enum NetworkParams {
    
    private struct NetworkConstants {
        static let popularBooksBase = "https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json?api-key=Y9mZT8QW3fANfh1SfZAiVcu1OZ7bvvyA"
        static let bookPosterBase = "https://storage.googleapis.com/du-prd/books/images/9780062653314.jpg"
    }
    
    case popularBooks(Int)
    case bookPoster(String)
    
    
    var url: URL? {
        switch self {
        case .popularBooks(let page):
            var components = URLComponents(string: NetworkConstants.popularBooksBase)
            var queryItems: [URLQueryItem] = []
            queryItems.append(URLQueryItem(name: "api_key", value: "Y9mZT8QW3fANfh1SfZAiVcu1OZ7bvvyA"))
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
            components?.queryItems = queryItems
            
            return components?.url
            
            // MARK: Check for '/' in path
        case .bookPoster(let path):
            return URL(string: NetworkConstants.bookPosterBase + path)
        }
    }
    
    
}
