//
//  U_ToursApp.swift
//  U-Tours
//
//  Created by Anshumaan Singh on 08/01/24.
//

import SwiftUI

@main
struct U_ToursApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
            
//            CoreDatabase()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
