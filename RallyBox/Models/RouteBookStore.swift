//
//  RouteBookStore.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-19.
//

import SwiftUI

class RouteBookStore: ObservableObject {
    var routeBooks: [RouteBook] = []

    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
            .appendingPathComponent("routeBooks.data")
    }

    func load() async throws {
        let task = Task<[RouteBook], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let decodedData = try JSONDecoder().decode([RouteBook].self, from: data)
            return decodedData
        }
        let decodedData = try await task.value
        self.routeBooks = decodedData
    }

    func save(routeBooksData: [RouteBook]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(routeBooksData)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
