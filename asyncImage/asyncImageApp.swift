//
//  asyncImageApp.swift
//  asyncImage
//
//  Created by 최기훈 on 2022/07/05.
//

import SwiftUI

@main
struct asyncImageApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
