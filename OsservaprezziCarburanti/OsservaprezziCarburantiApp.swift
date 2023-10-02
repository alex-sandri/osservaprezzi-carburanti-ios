//
//  OsservaprezziCarburantiApp.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 23/09/23.
//

import SwiftUI

@main
struct OsservaprezziCarburantiApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}

var isPreview: Bool {
    return ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
}
