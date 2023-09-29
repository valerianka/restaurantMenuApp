//
//  CapstoneLittleLemonProjectApp.swift
//  CapstoneLittleLemonProject
//
//  Created by Valerie Gorbik on 9/1/23.
//

import SwiftUI

@main
struct CapstoneLittleLemonProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
