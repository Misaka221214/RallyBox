//
//  RouteBookView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import SwiftUI

struct RouteBookView: View {
    @StateObject var viewModel = RouteBookViewModel()

    @State var endDistance: String
    @State var speed: String
    @State var index = 0

    var body: some View {
        VStack {
            HStack {
                Text("Route Book")
                    .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .padding()
                Spacer()
            }

            HStack(spacing: 10) {
                Spacer()

                TextField(
                    "End Distance",
                    text: $endDistance
                )
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
                .onSubmit {
                    viewModel.addItem(endDistance: endDistance, speed: speed, index: index)

                    index = viewModel.routeBook.items.count
                }

                TextField(
                    "Speed",
                    text: $speed
                )
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
    RouteBookView(endDistance: "", speed: "")
}
