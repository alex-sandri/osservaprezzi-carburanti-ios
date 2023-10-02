//
//  StationView.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 30/09/23.
//

import MapKit
import SwiftUI

struct StationView: View {
    private let station: Station

    init(_ station: Station) {
        self.station = station
    }

    let currencyStyle = Decimal.FormatStyle.Currency(code: "EUR")

    var body: some View {
        NavigationStack {
            List {
                Section {
                    AsyncImage(
                        url: station.imageUrl,
                        content: { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(.rect(cornerRadius: 10))
                        },
                        placeholder: {
                            ProgressView()
                        }
                    )
                        .frame(width: 75, height: 75)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }

                Map {
                    Marker(station.name, coordinate: station.location.coordinate)
                }
                .frame(height: 200)
                .listRowInsets(EdgeInsets())
                LabeledContent("Indirizzo", value: station.address)

                Section {
                    ForEach(station.fuels) { fuel in
                        HStack {
                            VStack(alignment: .leading) {
                                Text("**\(fuel.name)** *(\(fuel.isSelf ? "self" : "servito"))*")
                                Text("in vigore dal **\(station.insertDate.formatted())**")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            Text(fuel.price, format: currencyStyle)
                                .bold()
                        }
                    }
                } header: {
                    Text("Carburanti")
                }
            }
            .navigationTitle(station.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    StationView(Station.dummy)
}
