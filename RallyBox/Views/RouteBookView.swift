//
//  RouteBookView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import Combine
import SwiftUI

struct RouteBookView: View {
    @StateObject var viewModel: RouteBookViewModel
    let routeBookEntry: Int
    @Environment(\.scenePhase) private var scenePhase
    let saveAction: (RouteBook, Int) -> Void

    func getDateFormatter() -> Formatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss:SSS"
        return dateFormatter
    }

    @State var endDistance: Double
    @State var speed: Double
    @State var startTime: Date
    @State var routeBookItemIndex: Int
    @State var name: String

    var body: some View {
        VStack {
            HStack {
                Text("Route Book")
                    .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding()

                Spacer()

                TextField(
                    name,
                    text: $viewModel.routeBook.name
                )
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)

                Spacer()

                Button {
                    saveAction(viewModel.routeBook, routeBookEntry)
                }
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 8)
                            .frame(width: 128, height: 35)
                            .foregroundColor(Color.blue)
                        Text("Save")
                            .foregroundColor(Color.white).bold()
                    }
                }
            }
            HStack {
                Spacer()
                Text("Start Time")
                Spacer()
                TextField(
                    "Start Time",
                    value: self.$startTime,
                    formatter: self.getDateFormatter()
                )
                .keyboardType(.numberPad)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                .frame(width: 150)
                .onSubmit {
                    self.viewModel.updateStartTime(startTime: self.startTime)
                }
                Spacer()
            }

            HStack(spacing: 10) {
                Spacer()

                TextField(
                    "End Distance",
                    value: self.$endDistance,
                    format: .number
                )
                .keyboardType(.numberPad)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                .onSubmit {
                    self.viewModel.addItem(endDistance: self.endDistance, speed: self.speed, index: self.routeBookItemIndex)

                    self.routeBookItemIndex = self.viewModel.routeBook.items.count
                }

                TextField(
                    "Speed",
                    value: self.$speed,
                    format: .number
                )
                .keyboardType(.numberPad)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                .onSubmit {
                    self.viewModel.addItem(endDistance: self.endDistance, speed: self.speed, index: self.routeBookItemIndex)

                    self.routeBookItemIndex = self.viewModel.routeBook.items.count
                }

                Spacer()
            }
            List(self.viewModel.routeBook.items.reversed()) { item in
                RouteBookItemView(routeBookItem: item)
            }
            Spacer()
        }
    }
}

#Preview {
    RouteBookView(viewModel: RouteBookViewModel(), routeBookEntry: 0, saveAction: { _, _ in }, endDistance: 0, speed: 0, startTime: Date.now, routeBookItemIndex: 0, name: "")
}
