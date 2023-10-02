//
//  Station.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 28/09/23.
//

import Foundation

struct Station: Codable, Identifiable {
    let id: Int

    let name: String
    let fuels: [Fuel]
    let location: Location

    let insertDate: Date
    let address: String
    let brand: String

    var imageUrl: URL {
        URL(string: "https://carburanti.mise.gov.it/ospzSearch/assets/marchi/\(brand).png")!
    }

    static var dummy: Station {
        Station(
            id: 0,
            name: "TEST",
            fuels: [
                Fuel(id: 0, fuelId: 0, name: "Benzina", price: 1.5, isSelf: true),
                Fuel(id: 1, fuelId: 0, name: "Benzina", price: 1.5, isSelf: false),
                Fuel(id: 2, fuelId: 1, name: "Gasolio", price: 1.5, isSelf: true),
                Fuel(id: 3, fuelId: 1, name: "Gasolio", price: 1.5, isSelf: false)
            ],
            location: Location.dummy,
            insertDate: Date.now,
            address: "Via di Prova, 42",
            brand: "PompeBianche"
        )
    }
}
