//
//  IndexListView.swift
//  AutoScrollableSectionedScrollView
//
//  Created by Juanjo Corbalan on 24/5/24.
//

import SwiftUI

struct IndexListView: View {
    let items: [SectionIndex]
    @Binding var selected: SectionIndex
    @Binding var animating: Bool
    var proxy: ScrollViewProxy
    @Namespace private var animation

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(items, id: \.rawValue) { item in
                    Label(item.rawValue.capitalized, systemImage: item.image)
                        .symbolVariant(selected == item ? .none : .fill)
                        .foregroundColor(selected == item ? .white : .black)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background {
                            if selected == item {
                                Capsule()
                                    .foregroundStyle(.black)
                                    .matchedGeometryEffect(id: "ItemAnimation", in: animation)
                            }
                        }
                        .contentShape(.capsule)
                        .id(item.altID)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                animating = true
                                selected = item
                                proxy.scrollTo(item, anchor: .top)
                            }
                        }
                }
            }
            .padding(.vertical, 2)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ScrollViewReader { proxy in
        IndexListView(items: SectionIndex.allCases, selected: .constant(.dogs), animating: .constant(false), proxy: proxy)
    }
}
