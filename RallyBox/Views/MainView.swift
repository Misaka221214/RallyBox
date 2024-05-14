//
//  ContentView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import SwiftUI

struct MainView: View {
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SSS"
        return formatter.string(from: Date.now)
    }
    
    
    @State private var currentDate = Date.now
    let timer = Timer.publish(every: 0.001, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            MainHeaderView()

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
            
            Text(getCurrentTime())
            
            Text("\(currentDate)")
                .onReceive(timer) { input in
                    currentDate = input
                }
        }
    }
}

#Preview {
    MainView()
}
