//
//  RouteBookItem.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import Foundation

struct RouteBookItem: Hashable, Identifiable {
    var id: String {
        String(self.startDistance) + String(self.endDistance) + String(self.speed)
    }

    var startDistance: Double
    var endDistance: Double
    var startTime: Date
    var endTime: Date // arrival time
    var speed: Double
    var pause: Bool
    var duration: Double // in second
}
