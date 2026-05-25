//
//  PlarunFont.swift
//  PlaRun
//
//  Created by Fikri Ihsan A on 13/05/26.
//
import SwiftUI

enum PlarunFont {
    enum Title {
        case small
        case regular
        case large
        case smallBold
        case regularBold
        case largeBold

        var font: Font {
            switch self {
            case .small:
                return Font(UIFont.systemFont(ofSize: 17, weight: .regular) as CTFont)
            case .regular:
                return Font(UIFont.systemFont(ofSize: 20, weight: .regular) as CTFont)
            case .large:
                return Font(UIFont.systemFont(ofSize: 23, weight: .regular) as CTFont)
            case .smallBold:
                return Font(UIFont.systemFont(ofSize: 17, weight: .bold) as CTFont)
            case .regularBold:
                return Font(UIFont.systemFont(ofSize: 20, weight: .bold) as CTFont)
            case .largeBold:
                return Font(UIFont.systemFont(ofSize: 23, weight: .bold) as CTFont)
            }

        }
    }

    enum Body {
        case small
        case regular
        case large
        case smallBold
        case regularBold
        case largeBold

        var font: Font {
            switch self {
            case .small:
                return Font(UIFont.systemFont(ofSize: 9, weight: .regular) as CTFont)
            case .regular:
                return Font(UIFont.systemFont(ofSize: 12, weight: .regular) as CTFont)
            case .large:
                return Font(UIFont.systemFont(ofSize: 15, weight: .regular) as CTFont)
            case .smallBold:
                return Font(UIFont.systemFont(ofSize: 9, weight: .bold) as CTFont)
            case .regularBold:
                return Font(UIFont.systemFont(ofSize: 12, weight: .bold) as CTFont)
            case .largeBold:
                return Font(UIFont.systemFont(ofSize: 15, weight: .bold) as CTFont)
            }

        }
    }
}
