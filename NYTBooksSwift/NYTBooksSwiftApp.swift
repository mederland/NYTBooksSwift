//
//  NYTBooksSwiftApp.swift
//  NYTBooksSwift
//
//  Created by Consultant on 8/22/22.
//

import SwiftUI

@main
struct NYTBooksSwiftApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(bookListVM: BookListViewModel())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
