//
//  BookDetailView.swift
//  NYTBooksSwift
//
//  Created by Consultant on 8/22/22.
//

import SwiftUI

struct BookDetailView<T: BookListViewModelType>: View {
    @ObservedObject var movieVM: T
    let index: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            BookView(bookListVM: self.bookVM, index: index)
            Text(self.bookVM.movies[index].overview)
                .padding()
            Spacer()
            Button("Back") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
            .navigationBarBackButtonHidden(true)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(movieVM: BookListViewModel(), index: 0)
    }
}
