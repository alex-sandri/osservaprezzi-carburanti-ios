//
//  Logger.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 28/09/23.
//

import Foundation
import os

extension Logger {
    static func initFor<T>(_ type: T.Type) -> Logger {
        return self.init(
            subsystem: Bundle.main.bundleIdentifier ?? "",
            category: String(describing: type)
        )
    }
}
