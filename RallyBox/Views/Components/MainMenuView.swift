//
//  MainMenuView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-14.
//

import SwiftUI

struct MainMenuView: View {
    @StateObject private var store = RouteBookStore()

    func loadAction() -> [RouteBook] {
        Task {
            do {
                try await store.load()
            } catch {
                fatalError("Loading Error!")
            }
        }

        return store.routeBooks
    }

    func saveAction(routeBook: RouteBook, index: Int) {
        var routeBooks = store.routeBooks

        if routeBooks.count == 0 {
            routeBooks = [routeBook]
        }

        if index < routeBooks.count {
            routeBooks[index] = routeBook
        }

        if index >= routeBooks.count {
            routeBooks.append(routeBook)
        }

        Task {
            do {
                try await store.save(routeBooksData: routeBooks)

            } catch {
                fatalError("Save Error!")
            }
        }
    }

    var body: some View {
        VStack(spacing: 20) {
            NavigationLink {
                NavigationView()
            }
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .padding(.horizontal, 8)
                        .frame(width: 256, height: 44)
                        .foregroundColor(Color.blue)
                    Text("Navigation")
                        .foregroundColor(Color.white).bold()
                }
            }

            NavigationLink {
                RouteBookMenuView(viewModel: RouteBookMenuViewModel(routeBooks: store.routeBooks, load: loadAction), saveAction: saveAction, loadAction: loadAction)
            }
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .padding(.horizontal, 8)
                        .frame(width: 256, height: 44)
                        .foregroundColor(Color.blue)
                    Text("Route Book")
                        .foregroundColor(Color.white).bold()
                }
            }
            .onAppear {
                _ = loadAction()
            }

            NavigationLink {
                ToolBoxView()
            }
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .padding(.horizontal, 8)
                        .frame(width: 256, height: 44)
                        .foregroundColor(Color.blue)
                    Text("Tool Box")
                        .foregroundColor(Color.white).bold()
                }
            }

            NavigationLink {
                SettingsView()
            }
            label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .padding(.horizontal, 8)
                        .frame(width: 256, height: 44)
                        .foregroundColor(Color.blue)
                    Text("Setting")
                        .foregroundColor(Color.white).bold()
                }
            }
        }
    }
}

#Preview {
    MainMenuView()
}
