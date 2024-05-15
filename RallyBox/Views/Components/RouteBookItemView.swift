//
//  RouteBookItemView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-14.
//

import SwiftUI

struct RouteBookItemView: View {
    @State var routeBookItem: RouteBookItem

    var body: some View {
        HStack(spacing: 10) {
            Spacer()

            TextField(
                "End Distance",
                text: $routeBookItem.endDistance
            )
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)

            TextField(
                "Speed",
                text: $routeBookItem.speed
            )
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)

            Spacer()
        }
    }
}

#Preview {
    RouteBookItemView(routeBookItem: .init(startDistance: "", endDistance: "", startTime: "", endTime: "", speed: "", pause: false, duration: ""))
}
