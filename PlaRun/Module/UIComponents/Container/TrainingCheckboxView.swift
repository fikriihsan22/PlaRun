//
//  TrainingCheckboxView.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/05/26.
//

import SwiftUI

struct TrainingCheckboxView: View {
    @State var isChecked: Bool = false
    var checkedOnClick: () -> Void = { }
    let data: TrainingCheckboxData

    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                isChecked = !isChecked
                checkedOnClick()
            }) {
                if isChecked {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.system(size: 16))
                        .foregroundColor(data.color.color)
                }
                else {
                    Image(systemName: "circle")
                        .font(.system(size: 16))
                        .foregroundColor(data.color.color)
                }
            }

            Text(data.title)
                .font(PlarunFont.Body.regular.font)
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(PlarunColor.secondary.color)
        .cornerRadius(8)
    }
}

struct TrainingCheckboxData {
    let title: String
    var color: PlarunColor = .primary
}

#Preview {
    TrainingCheckboxView(data:TrainingCheckboxData(title: "Longrun - 44Km"))
}
