//
//  TrainingCheckboxView.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/05/26.
//

import SwiftUI

struct TrainingCheckboxView: View {
    @Binding private var isChecked: Bool
    private let data: TrainingCheckboxData
    private let onToggle: (Bool) -> Void

    init(
        isChecked: Binding<Bool>,
        data: TrainingCheckboxData,
        onToggle: @escaping (Bool) -> Void = { _ in }
    ) {
        self._isChecked = isChecked
        self.data = data
        self.onToggle = onToggle
    }

    var body: some View {
        HStack(spacing: 8) {
            Button(action: {
                isChecked.toggle()
                onToggle(isChecked)
            }) {
                Image(systemName: isChecked ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 16))
                    .foregroundColor(data.color.color)
            }
            .accessibilityLabel(data.title)
            .accessibilityValue(isChecked ? "Checked" : "Unchecked")
            .accessibilityHint("Toggles training completion")

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
    @Previewable @State var isChecked = false

    TrainingCheckboxView(
        isChecked: $isChecked,
        data: TrainingCheckboxData(title: "Longrun - 44Km")
    )
}
