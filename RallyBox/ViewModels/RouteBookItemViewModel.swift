//
//  RouteBookItemViewModel.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-14.
//

import Foundation

class RouteBookItemViewModel: ObservableObject {
    @Published var item: RouteBookItem = .init(startDistance: "", endDistance: "", startTime: "", endTime: "", speed: "", pause: false, duration: "")

    @Published var isEditted: Bool = false

    init() {}

    func checkEdit() {
        if item.endDistance != "" && item.speed != "" {
            isEditted = true
        }
    }
}
