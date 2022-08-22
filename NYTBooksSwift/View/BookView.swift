//
//  BookView.swift
//  NYTBooksSwift
//
//  Created by Consultant on 8/22/22.
//

import SwiftUI

struct BookView<T: BookListViewModelType>: View {
    
    @ObservedObject var bookListVM: T
    let index: Int
    
    var body: some View {
        HStack {
            AsyncImage(url: NetworkParams.bookPoster(self.bookListVM.books[index].bookImage ).url) { realImage in
                realImage
                    .resizable()
                    .frame(width: 150, height: 200, alignment: .center)
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 200, alignment: .center)
            }
                .padding([.top, .bottom, .trailing], 8)
            Text(bookListVM.books[index].title)
                .padding([.top, .bottom, .trailing], 8)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(bookListVM: BookListViewModel(), index: 0)
    }
}
