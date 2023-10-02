//
//  StationRow.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 28/09/23.
//

import SwiftUI

struct StationRow: View {
    private var station: Station

    init(_ station: Station) {
        self.station = station
    }

    var body: some View {
        NavigationLink {
            StationView(station)
        } label: {
            HStack {
                AsyncImage(
                    url: station.imageUrl,
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: 30, height: 30)
                .padding(.trailing)
                VStack(alignment: .leading) {
                    Text("**\(station.name)**")
                    Text(station.address)
                        .font(.caption)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        List {
            StationRow(Station.dummy)
        }
    }
}
