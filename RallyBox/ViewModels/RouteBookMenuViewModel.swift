//
//  RouteBookMenuViewModel.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-21.
//

import Foundation

class RouteBookMenuViewModel: ObservableObject {
    @Published var routeBooks: [RouteBook] = []
    @Published var loadAction: () -> [RouteBook] = { [] }

    init(routeBooks: [RouteBook], load: @escaping () -> [RouteBook]) {
        self.routeBooks = routeBooks
        self.loadAction = load
    }

    init() {}

    func updateModel() {
        self.routeBooks = self.loadAction()
    }
}
