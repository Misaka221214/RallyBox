//
//  RouteBookMenuViewModel.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-21.
//

import Foundation

class RouteBookMenuViewModel: ObservableObject {
    @Published var routeBooks: [RouteBook] = []

    init(routeBooks: [RouteBook]) {
        self.routeBooks = routeBooks
    }

    init() {}
}
