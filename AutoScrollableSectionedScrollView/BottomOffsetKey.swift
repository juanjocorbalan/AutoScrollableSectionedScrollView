//
//  BottomOffsetKey.swift
//  AutoScrollableSectionedScrollView
//
//  Created by Juanjo Corbalan on 24/5/24.
//

import SwiftUI

struct ContentSection: Equatable {
    let type: SectionIndex
    let offset: CGFloat
}

struct BottomOffsetKey: PreferenceKey {
    static var defaultValue: ContentSection = .init(type: .dogs, offset: .infinity)

    static func reduce(value: inout ContentSection, nextValue: () -> ContentSection) {
        let new = nextValue()
        if new.offset > 0 && value.offset > new.offset {
            value = new
        }
    }
}
