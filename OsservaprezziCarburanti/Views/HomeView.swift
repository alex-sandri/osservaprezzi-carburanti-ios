//
//  HomeView.swift
//  OsservaprezziCarburanti
//
//  Created by Alex Sandri on 28/09/23.
//

import SwiftUI

struct HomeView: View {
    @State private var progressViewId = 0

    @State private var locationManager = LocationManager()

    @State private var zone: Zone? = nil

    @State private var searchTask: Task<(), Error>?

    @State private var showFilters = false

    func loadZone(_ location: Location) async {
        let result = try? await Zone.list(location: location)

        if let result {
            zone = result
        }
    }

    var body: some View {
        NavigationStack {
            VStack {
                if locationManager.authorizationStatus == .denied {
                    Button {
                        // TODO
                    } label: {
                        Label("Allow", systemImage: "location")
                    }
                }

                if let zone {
                    List {
                        if zone.results.isEmpty {
                            Text("Non sono stati trovati risultati")
                                .foregroundColor(.secondary)
                        } else {
                            Text("Trovati **\(zone.results.count)** risultati")
                                .foregroundColor(.secondary)
                        }

                        ForEach(zone.results) { station in
                            StationRow(station)
                        }
                    }
                } else {
                    HStack {
                        Spacer()
                        ProgressView()
                            .id(progressViewId)
                            .onAppear { progressViewId += 1 }
                        Spacer()
                    }
                }
            }
                .navigationTitle("Osservaprezzi Carburanti")
                .navigationBarTitleDisplayMode(.inline)
                .onChange(of: locationManager.location) {
                    if let location = locationManager.location {
                        Task {
                            await loadZone(location)
                        }
                    }
                }
                .task {
                    if let location = locationManager.location {
                        Task {
                            await loadZone(location)
                        }
                    }
                }
        }
    }
}

#Preview {
    HomeView()
}
