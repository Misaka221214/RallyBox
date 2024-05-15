//
//  RouteBookItem.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import Foundation

struct RouteBookItem: Hashable, Identifiable {
    var id: String {
        self.endDistance + self.speed
    }

    var startDistance: String
    var endDistance: String
    var startTime: String
    var endTime: String
    var speed: String
    var pause: Bool
    var duration: String
}
