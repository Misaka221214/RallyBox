//
//  RouteBookMenuView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-17.
//

import SwiftUI

struct RouteBookMenuView: View {
    @StateObject var viewModel: RouteBookMenuViewModel
    let saveAction: (RouteBook, Int) -> Void
    let loadAction: () -> Void

    var body: some View {
        VStack {
            HStack {
                Text("Route Books")

                NavigationLink {
                    RouteBookView(viewModel: RouteBookViewModel(), routeBookEntry: viewModel.routeBooks.count, saveAction: saveAction, endDistance: 0, speed: 0, startTime: Date.now, routeBookItemIndex: 0, name: "Regularity #" + String(viewModel.routeBooks.count))
                }
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .padding(.horizontal, 8)
                            .frame(width: 256, height: 44)
                            .foregroundColor(Color.blue)
                        Text("Create")
                            .foregroundColor(Color.white).bold()
                    }
                }
                .onDisappear {
                    loadAction()
                }
            }

            VStack {
                List {
                    ForEach(Array(viewModel.routeBooks.enumerated()), id: \.1.id) { index, item in
                        NavigationLink {
                            RouteBookView(viewModel: RouteBookViewModel(routeBook: item), routeBookEntry: index, saveAction: saveAction, endDistance: item.items.last?.endDistance ?? 0, speed: 0, startTime: item.startTime, routeBookItemIndex: viewModel.routeBooks.count - 1, name: item.name)
                        }
                        label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .padding(.horizontal, 8)
                                    .frame(width: 256, height: 44)
                                    .foregroundColor(Color.blue)
                                Text(item.name)
                                    .foregroundColor(Color.white).bold()
                            }
                        }
                        .onDisappear {
                            loadAction()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    RouteBookMenuView(viewModel: RouteBookMenuViewModel(), saveAction: { _, _ in }, loadAction: {})
}
