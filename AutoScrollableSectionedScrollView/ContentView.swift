//
//  ContentView.swift
//  AutoScrollableSectionedScrollView
//
//  Created by Juanjo Corbalan on 24/5/24.
//

import SwiftUI

struct ContentView: View {
    private let sections = SectionIndex.allCases
    @State private var selected: SectionIndex = .dogs
    @State private var animating: Bool = false

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.vertical) {
                ForEach(sections) { type in
                    Section {
                        LazyVStack {
                            ForEach(1...5, id: \.self) { _ in
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(type.color.gradient)
                                    .frame(height: 75)
                            }
                        }
                        .updateOffset(for: type, in: "ScrollViewContent")
                    } header: {
                        Text(type.rawValue.capitalized)
                            .font(.title.bold())
                            .foregroundColor(type.color)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding([.horizontal, .bottom])
                    .id(type)
                }
            }
            .onPreferenceChange(BottomOffsetKey.self) { section in
                guard !animating else { return }
                withAnimation(.easeInOut(duration: 0.3)) {
                    selected = section.type
                }
            }
            .onChange(of: selected) { oldVaule, newValue in
                withAnimation(.easeInOut(duration: 0.3)) {
                    proxy.scrollTo(newValue.altID, anchor: .center)
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    animating = false
                }
            }
            .coordinateSpace(name: "ScrollViewContent")
            .safeAreaInset(edge: .top) {
                IndexListView(items: sections, selected: $selected, animating: $animating, proxy: proxy)
                    .background(.thinMaterial)
            }
        }
        .navigationTitle("Animals")
        .toolbarTitleDisplayMode(.inline)
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
