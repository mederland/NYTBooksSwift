//
//  BookListViewModel.swift
//  NYTBooksSwift
//
//  Created by Consultant on 8/22/22.
//

import Foundation
import Combine


protocol BookListViewModelType: ObservableObject {
    var books: [Book] { get }
    var isLoading: Bool { get }
    func requestMoviesIfNeeded(index: Int)
}

class BookListViewModel: BookListViewModelType {
    
    private let networkService: NetworkService
    private var subs = Set<AnyCancellable>()
    @Published var books: [Book] = []
    var currentPage = 0
    @Published var isLoading: Bool = false
    
    init(network: NetworkService = NetworkManager()) {
        self.networkService = network
        self.requestMoviesIfNeeded(index: 0)
    }
    
    func requestMoviesIfNeeded(index: Int) {
        guard index == (self.books.count - 1) || self.books.isEmpty else { return }
        self.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.requestMovies()
        }
    }
    
    func requestMovies() {
        self.networkService.getModel(url: NetworkParams.popularBooks(self.currentPage + 1).url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] (page: Kitab) in
                self?.books.append(contentsOf: page.results.books)
                self?.isLoading = false
            }.store(in: &self.subs)
    }
    
    
}
