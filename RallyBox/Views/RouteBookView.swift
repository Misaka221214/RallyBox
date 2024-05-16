//
//  RouteBookView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import Combine
import SwiftUI

struct RouteBookView: View {
    func getDateFormatter() -> Formatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        return dateFormatter
    }
    
    @StateObject var viewModel = RouteBookViewModel()

    @State var endDistance: Double
    @State var speed: Double
    @State var startTime: Date
    @State var index = 0

    var body: some View {
        VStack {
            HStack {
                Text("Route Book")
                    .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding()
                Spacer()

                TextField(
                    "Start Time",
                    value: $startTime,
                    formatter: getDateFormatter()
                )
                .keyboardType(.numberPad)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                .onSubmit {
                    viewModel.updateStartTime(startTime: startTime)
                }
                Spacer()
            }

            HStack(spacing: 10) {
                Spacer()

                TextField(
                    "End Distance",
                    value: $endDistance,
                    format: .number
                )
                .keyboardType(.numberPad)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                .onSubmit {
                    viewModel.addItem(endDistance: endDistance, speed: speed, index: index)

                    index = viewModel.routeBook.items.count
                }

                TextField(
                    "Speed",
                    value: $speed,
                    format: .number
                )
                .keyboardType(.numberPad)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                .onSubmit {
                    viewModel.addItem(endDistance: endDistance, speed: speed, index: index)

                    index = viewModel.routeBook.items.count
                }

                Spacer()
            }
            List(viewModel.routeBook.items.reversed()) { item in
                RouteBookItemView(routeBookItem: item)
            }
            Spacer()
        }
    }
}

#Preview {
    RouteBookView(endDistance: 0, speed: 0, startTime: Date.now)
}
