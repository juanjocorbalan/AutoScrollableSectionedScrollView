//
//  ContentView.swift
//  AutoScrollableSectionedScrollView
//
//  Created by Juanjo Corbalan on 24/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selected: SectionIndex = .dogs

    var body: some View {
        NavigationStack {
            ScrollViewReader { proxy in
                ScrollView(.vertical) {
                    ForEach(SectionIndex.allCases, id: \.rawValue) { type in
                        LazyVStack {
                            Text(type.rawValue.capitalized)
                                .font(.title)
                                .foregroundColor(type.color)
                                .frame(maxWidth: .infinity, alignment: .leading)

                            ForEach(1...5, id: \.self) { _ in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(type.color)
                                    .frame(height: 75)
                            }
                        }
                        .padding([.horizontal, .bottom])
                        .id(type)
                    }
                }
                .coordinateSpace(name: "ScrollViewContent")
                .safeAreaInset(edge: .top, content: {
                    IndexListView(items: SectionIndex.allCases, selected: $selected, proxy: proxy)
                })
            }
            .navigationTitle("Animals")
            .toolbarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
