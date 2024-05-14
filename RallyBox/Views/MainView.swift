//
//  ContentView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            MainHeaderView()
                .offset(y: -150)

            Spacer()

            MainMenuView()
                .offset(y: -60)

            Spacer()
        }
    }
}

#Preview {
    MainView()
}
