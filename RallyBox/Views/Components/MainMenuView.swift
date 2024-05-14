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
            Button {
                // Action
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

            Button {
                // Action
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

            Button {
                // Action
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

            Button {
                // Action
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
