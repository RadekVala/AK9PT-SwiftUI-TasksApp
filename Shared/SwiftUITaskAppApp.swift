//
//  SwiftUITaskAppApp.swift
//  Shared
//
//  Created by Radek Vala on 04.12.2021.
//

import SwiftUI

@main
struct SwiftUITaskAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
