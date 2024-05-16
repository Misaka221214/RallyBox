//
//  RouteBook.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import Foundation

struct RouteBook: Hashable {
    var items: [RouteBookItem]
    var name: String
    var startTime: Date
}
