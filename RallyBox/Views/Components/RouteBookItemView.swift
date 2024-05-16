//
//  RouteBookItemView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-14.
//

import SwiftUI

struct RouteBookItemView: View {
    func getDateFormatter() -> Formatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss.SSS"
        return dateFormatter
    }
    
    @State var routeBookItem: RouteBookItem

    var body: some View {
        HStack(spacing: 10) {
            Spacer()

            TextField(
                "Start Distance",
                value: $routeBookItem.startDistance,
                format: .number
            )
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)

            TextField(
                "End Distance",
                value: $routeBookItem.endDistance,
                format: .number
            )
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)

            TextField(
                "Speed",
                value: $routeBookItem.speed,
                format: .number
            )
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)

            TextField(
                "Arrival Time",
                value: $routeBookItem.endTime,
                formatter: getDateFormatter()
            )
            .frame(width: 150)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)

            Spacer()
        }
    }
}

#Preview {
    RouteBookItemView(routeBookItem: .init(startDistance: 0, endDistance: 0, startTime: Date.now, endTime: Date.now, speed: 0, pause: false, duration: 0))
}
