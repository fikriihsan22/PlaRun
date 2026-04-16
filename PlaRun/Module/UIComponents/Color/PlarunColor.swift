//
//  PlarunColor.swift
//  PlarunColor
//
//  Created by Fikri Ihsan A on 08/04/26.
//
import SwiftUI

enum PlarunColor {
    case primary
    case secondary
    case warning
    case success
    case black
    case blackV2
    case white

    var color: Color {
        switch self {
        case .primary:
            return Color(hex: "C96767")
        case .secondary:
            return Color(hex: "F2F5F7")
        case .warning:
            return Color(hex: "")
        case .success:
            return Color(hex: "")
        case .black:
            return Color.black
        case .blackV2:
            return Color(hex: "23262E")
        case .white:
            return Color.white
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)

        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255,
                            int >> 16,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24,
                            int >> 16 & 0xFF,
                            int >> 8 & 0xFF,
                            int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
