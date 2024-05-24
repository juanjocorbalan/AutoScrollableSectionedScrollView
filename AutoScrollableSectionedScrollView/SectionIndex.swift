//
//  SectionIndex.swift
//  AutoScrollableSectionedScrollView
//
//  Created by Juanjo Corbalan on 24/5/24.
//

import SwiftUI

enum SectionIndex: String, CaseIterable {
    case dogs
    case cats
    case birds
    case fish
    case turtles
    case ants
    case lizards

    var image: String {
        switch self {
        case .dogs:
            return "dog"
        case .cats:
            return "cat"
        case .birds:
            return "bird"
        case .fish:
            return "fish"
        case .turtles:
            return "tortoise"
        case .ants:
            return "ant"
        case .lizards:
            return "lizard"
        }
    }

    var color: Color {
        switch self {
        case .dogs:
            return .blue
        case .cats:
            return .orange
        case .birds:
            return .green
        case .fish:
            return .teal
        case .turtles:
            return .red
        case .ants:
            return .yellow
        case .lizards:
            return .pink
        }
    }

    var ID: String {
        return self.rawValue
    }

    var altID: String {
        return "_" + self.rawValue
    }
}
