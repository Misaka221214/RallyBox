//
//  NavigatorView.swift
//  RallyBox
//
//  Created by Muhan Li on 2024-05-13.
//

import SwiftUI

struct NavigationView: View {
    @ObservedObject var viewModel: NavigationViewModel = .init()

    var body: some View {
        VStack {
            Text("Current Speed: \(String(format: "%.1f", viewModel.currentSpeed)) km/h")
                .font(.title)
                .padding()

            Spacer()
            Text("Average Speed: \(String(format: "%.1f", viewModel.averageSpeed)) km/h")
                .font(.title)
                .padding()

            Spacer()
        }
        .onAppear {
            viewModel.startRecordLocation()
        }
    }
}

#Preview {
    NavigationView()
}
