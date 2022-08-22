//
//  Kitap.swift
//  NYTBooksSwift
//
//  Created by Consultant on 8/22/22.
//

//import Foundation
//
//// MARK: - Kitab
//struct Kitab: Decodable {
//    let status, copyright: String
//    let numResults: Int
//    let lastModified: Date
//    let results: Results
//}
//
//// MARK: - Results
//struct Results: Decodable {
//    let listName, listNameEncoded, bestsellersDate, publishedDate: String
//    let publishedDateDescription, nextPublishedDate, previousPublishedDate, displayName: String
//    let normalListEndsAt: Int
//    let updated: String
//    let books: [Book]
//    let corrections: [Any?]
//}
//
//// MARK: - Book
//struct Book: Decodable {
//    let rank, rankLastWeek, weeksOnList, asterisk: Int
//    let dagger: Int
//    let primaryIsbn10, primaryIsbn13, publisher, bookDescription: String
//    let price, title, author, contributor: String
//    let contributorNote: String
//    let bookImage: String
//    let bookImageWidth, bookImageHeight: Int
//    let amazonProductURL: String
//    let ageGroup, bookReviewLink, firstChapterLink, sundayReviewLink: String
//    let articleChapterLink: String
//    let bookURI: String
//}
//


import Foundation

// MARK: - Kitab
struct Kitab: Decodable {
    let status, copyright: String
    let numResults: Int
    let lastModified: Date
    let results: Results
}

// MARK: - Results
struct Results: Decodable {
    let listName, listNameEncoded, bestsellersDate, publishedDate: String
    let publishedDateDescription, nextPublishedDate, previousPublishedDate, displayName: String
    let normalListEndsAt: Int
    let updated: String
    let books: [Book]
}

// MARK: - Book
struct Book: Decodable {
    let rank, rankLastWeek, weeksOnList, asterisk: Int
    let dagger: Int
    let primaryIsbn10, primaryIsbn13, publisher, bookDescription: String
    let price, title, author, contributor: String
    let contributorNote: String
    let bookImage: String
    let bookImageWidth, bookImageHeight: Int
    let amazonProductURL: String
    let ageGroup, bookReviewLink, firstChapterLink, sundayReviewLink: String
    let articleChapterLink: String
    let isbns: [Isbn]
    let buyLinks: [BuyLink]
    let bookURI: String
}

// MARK: - BuyLink
struct BuyLink: Decodable {
    let name: Name
    let url: String
}

enum Name: Decodable {
    case amazon
    case appleBooks
    case barnesAndNoble
    case booksAMillion
    case bookshop
    case indieBound
}

// MARK: - Isbn
struct Isbn: Decodable {
    let isbn10, isbn13: String
}
