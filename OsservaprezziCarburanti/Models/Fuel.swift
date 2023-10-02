//
//  Fuel.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 28/09/23.
//

import Foundation

struct Fuel: Codable, Identifiable {
    let id: Int
    let fuelId: Int

    let name: String
    let price: Decimal
    let isSelf: Bool
}
