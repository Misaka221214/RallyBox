//
//  RouteBookViewModel.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-14.
//

import Foundation

class RouteBookViewModel: ObservableObject {
    @Published var routeBook: RouteBook = .init(items: [], name: "", startTime: "")

    init() {}

    func addItem(endDistance: String, speed: String, index: Int) {
        if index < routeBook.items.count {
            routeBook.items[index].endDistance = endDistance
            routeBook.items[index].speed = speed
        } else {
            routeBook.items.append(RouteBookItem(startDistance: "", endDistance: endDistance, startTime: "", endTime: "", speed: speed, pause: false, duration: ""))
        }
    }
}
