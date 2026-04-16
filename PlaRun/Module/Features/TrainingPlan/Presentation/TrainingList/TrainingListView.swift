//
//  TrainingListView.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/04/26.
//

import SwiftUI

struct TrainingListView: View {
    @ObservedObject private var viewModel: TrainingListVM
    @State private var isDidLoad: Bool = false

    init(viewModel: TrainingListVM) {
        self.viewModel = viewModel
    }

    var body: some View {
        Text(viewModel.nickname)
            .onAppear {
                didLoad()
            }
    }

    func didLoad() {
        if !isDidLoad {
            self.viewModel.didLoad()
            isDidLoad = true
        }
    }
}

//#Preview {
//    TrainingListView()
//}
