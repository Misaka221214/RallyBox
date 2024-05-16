//
//  RouteBookItemViewModel.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-14.
//

import Foundation

class RouteBookItemViewModel: ObservableObject {
    @Published var item: RouteBookItem = .init(startDistance: -1, endDistance: -1, startTime: Date.now, endTime: Date.now, speed: -1, pause: false, duration: 0)

    @Published var isEditted: Bool = false

    init() {}

    func checkEdit() {
        if item.endDistance >= 0 && item.speed >= 0 {
            isEditted = true
        }
    }
}
