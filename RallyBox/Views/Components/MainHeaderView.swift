//
//  MainHeaderView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import SwiftUI

struct MainHeaderView: View {
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter.string(from: Date.now)
    }

    @State var currentPerciseTime: String = ""

    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()

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
                    .padding()

                Text(currentPerciseTime)
                    .onReceive(timer) { _ in
                        currentPerciseTime = getCurrentTime()
                    }
                    .foregroundColor(Color.white)
            }
            .offset(y: 90)
        }.frame(width: UIScreen.main.bounds.width * 3, height: 500)
    }
}

#Preview {
    MainHeaderView()
}
