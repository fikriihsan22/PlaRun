//
//  WeeklyCardView.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/05/26.
//

import SwiftUI
import Foundation

struct WeeklyCardView: View {
    @State private var weeklyCardData: WeeklyCardData
    let columns = [
        GridItem(.adaptive(minimum: 120), spacing: 8)
    ]

    init(weeklyCardData: WeeklyCardData) {
        self._weeklyCardData = State(initialValue: weeklyCardData)
    }

    var body: some View {
        VStack(spacing: 8) {
            Text(weeklyCardData.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(PlarunFont.Title.smallBold.font)
            HStack(spacing: 18) {
                Text("Workout: \(weeklyCardData.workout)")
                    .font(PlarunFont.Body.regular.font)
                Text("Distance: \(weeklyCardData.distance)")
                    .font(PlarunFont.Body.regular.font)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

            VStack(spacing: 18) {
                ForEach($weeklyCardData.dailyTrainings) { $dailyTraining in
                    HStack(alignment: .top, spacing: 13) {
                        Text("Mon")
                            .font(PlarunFont.Body.regular.font)
                            .padding(.top,10)
                        FlowLayout(spacing: 8) {
                            ForEach($dailyTraining.trainingTodo) { $trainingTodo in
                                TrainingCheckboxView(
                                    isChecked: $trainingTodo.isChecked,
                                    data: TrainingCheckboxData(title: trainingTodo.title)
                                )
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 12)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(style: StrokeStyle(lineWidth: 1))
        }
    }
}

struct WeeklyCardData {
    let title: String
    let workout: String
    let distance: String
    var dailyTrainings: [DailyTrainingData]
}

struct DailyTrainingData: Identifiable {
    let id: UUID = UUID()
    let date: Date
    var trainingTodo:[TrainingTodoData]
}

struct TrainingTodoData: Identifiable {
    let id: UUID = UUID()
    var isChecked: Bool
    let title: String
}

#Preview {
    let mock = WeeklyCardData(title: "Week 1",
                              workout: "0/10",
                              distance: "30 KM",
                              dailyTrainings:[
                                DailyTrainingData(
                                    date: Date(),
                                    trainingTodo: [
                                        TrainingTodoData(isChecked: false, title: "Easy Run - 12KM"),
                                        TrainingTodoData(isChecked: false, title: "Easy Run - 7KM")
                                ]),
                                DailyTrainingData(
                                    date: Date(),
                                    trainingTodo: [
                                        TrainingTodoData(isChecked: false, title: "Easy Run - 12222KM"),
                                        TrainingTodoData(isChecked: false, title: "Easy Run - 7KM"),
                                        TrainingTodoData(isChecked: false, title: "Easy Run - 7KM"),
                                ])
                              ])
    WeeklyCardView(weeklyCardData: mock)
}

struct FlowLayout: Layout {

    var spacing: CGFloat = 8

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) -> CGSize {

        let maxWidth = proposal.width ?? 0

        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var rowHeight: CGFloat = 0

        for subview in subviews {

            let size = subview.sizeThatFits(.unspecified)

            // newline
            if currentX + size.width > maxWidth {
                currentX = 0
                currentY += rowHeight + spacing
                rowHeight = 0
            }

            rowHeight = max(rowHeight, size.height)

            currentX += size.width + spacing
        }

        return CGSize(
            width: maxWidth,
            height: currentY + rowHeight
        )
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout ()
    ) {

        var currentX = bounds.minX
        var currentY = bounds.minY
        var rowHeight: CGFloat = 0

        for subview in subviews {

            let size = subview.sizeThatFits(.unspecified)

            // newline
            if currentX + size.width > bounds.maxX {
                currentX = bounds.minX
                currentY += rowHeight + spacing
                rowHeight = 0
            }

            // TOP align
            subview.place(
                at: CGPoint(x: currentX, y: currentY),
                proposal: ProposedViewSize(size)
            )

            currentX += size.width + spacing

            rowHeight = max(rowHeight, size.height)
        }
    }
}
