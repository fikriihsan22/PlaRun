//
//  PlarunButton.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 08/04/26.
//

import SwiftUI

struct PlarunButton: View {
    var title: String
    var buttonHeight : CGFloat = 50
    var bgStyle: PlarunColor
    var cornerRadius : CGFloat = 24
    var onClick: () -> Void

    var body: some View {
        ZStack {
            Button(action: onClick) {
                Text(title)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity)
                    .frame(height: buttonHeight)
                    .background(bgStyle.color)
                    .cornerRadius(cornerRadius)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    PlarunButton(title: "test", bgStyle: .primary) {
        print("Button Clicked")
    }
}
