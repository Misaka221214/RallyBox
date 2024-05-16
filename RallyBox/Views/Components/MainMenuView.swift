//
//  MainMenuView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-14.
//

import SwiftUI

struct MainMenuView: View {
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
                RouteBookView(endDistance: 0, speed: 0, startTime: Date.now)
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
