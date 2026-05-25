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
            return Color(hex: "F59E0B")
        case .success:
            return Color(hex: "2EAD6B")
        case .black:
            return Color(hex: "000000")
        case .blackV2:
            return Color(hex: "23262E")
        case .white:
            return Color(hex: "FFFFFF")
        }
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        let validCharacters = CharacterSet(charactersIn: "0123456789ABCDEFabcdef")
        var int: UInt64 = 0
        guard (hex.count == 6 || hex.count == 8),
              hex.rangeOfCharacter(from: validCharacters.inverted) == nil,
              Scanner(string: hex).scanHexInt64(&int) else {
            assertionFailure("Invalid hex color: \(hex)")
            self = .clear
            return
        }

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
