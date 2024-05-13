//
//  MainHeaderView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import SwiftUI

struct MainHeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(
                cornerRadius: 0
            ).foregroundColor(
                Color.blue
            )

            VStack {
                Text("Rally Box")
                    .font(.system(size: 50))
                    .foregroundColor(Color.white)
                    .bold()
                
                Text("Version 0.0.1")
                    .font(.system(size: 20))
                    .foregroundColor(Color.yellow)
                    .bold()
                    .offset(y: 20)
            }
        }.frame(width: UIScreen.main.bounds.width * 3, height: 300).offset(y: -300)
    }
}

#Preview {
    MainHeaderView()
}
