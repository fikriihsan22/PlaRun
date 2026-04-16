//
//  ContentView.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 19/03/26.
//

import SwiftUI
import SwiftData

struct WelcomeView: View {
    let viewModel: WelcomeVMProtocol

    init(_ viewModel: WelcomeVMProtocol) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Spacer()
            PlarunButton(title: "Get Started", bgStyle: .primary) {
                viewModel.createNewUser()
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal,20)
        .padding(.vertical,50)
        .background(PlarunColor.blackV2.color)
    }
}

//#Preview {
//    WelcomeView(Welco)
//}
