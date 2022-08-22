//
//  ContentView.swift
//  NYTBooksSwift
//
//  Created by Consultant on 8/22/22.
//

import SwiftUI

struct ContentView<T: BookListViewModelType>: View {
    
    @ObservedObject var bookListVM: T
    
    var body: some View {
        NavigationView {
            VStack {
                Text("New York Times book list")
                
                List {
                    ForEach(0..<self.bookListVM.books.count, id: \.self) { index in
                        NavigationLink(destination: BookDetailView(movieVM: self.bookListVM, index: index)) {
                            BookView(bookListVM: self.bookListVM, index: index)
                                .onAppear {
                                    self.bookListVM.requestMoviesIfNeeded(index: index)
                                }
                        }
                    }
                            
                    if self.bookListVM.isLoading {
                        ProgressView()
                    }
                }

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bookListVM: BookListViewModel())
    }
}
