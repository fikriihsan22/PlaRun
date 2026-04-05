//
//  PlaRunApp.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 19/03/26.
//

import SwiftUI
import SwiftData

@main
struct PlaRunApp: App {
    private var isLoggin = false //Mock Only

    var body: some Scene {
        WindowGroup {
            AppRootView(flow: isLoggin ? .home : .onBoarding)
        }
    }
}
