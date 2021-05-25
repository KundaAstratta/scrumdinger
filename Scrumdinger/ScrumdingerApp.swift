//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Christophe Humbert on 30/04/2021.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.data
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: $scrums)
            }
        }
    }
}
