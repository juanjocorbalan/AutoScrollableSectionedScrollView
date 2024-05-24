//
//  View+Extensions.swift
//  AutoScrollableSectionedScrollView
//
//  Created by Juanjo Corbalan on 24/5/24.
//

import SwiftUI

extension View {
    func updateOffset(for section: SectionIndex, in coordinateSpace: String) -> some View {
        self
            .overlay {
                GeometryReader { proxy in
                    let offset = proxy.frame(in: .named(coordinateSpace)).maxY
                    Color.clear
                        .preference(key: BottomOffsetKey.self, value: .init(type: section, offset: offset))
                }
            }
    }
}
