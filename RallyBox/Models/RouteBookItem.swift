//
//  RouteBookItem.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import Foundation

struct RouteBookItem: Hashable, Identifiable, Codable {
    var id = UUID()

    var startDistance: Double
    var endDistance: Double
    var startTime: Date
    var endTime: Date // arrival time
    var speed: Double
    var pause: Bool
    var duration: Double // in second
}
