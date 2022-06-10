//
//  FlexBox.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/3/22.
//

import SwiftUI

struct FlexBox: View {
    let direction: Direction
    let justify: JustifyContent
    let alignContent: AlignContent
    let alignItems: AlignItem
    @State private var content: [FlexItem]
    @State private var height: CGFloat = 500
    
    @State private var index: Int = 0
    @State private var availableSpace: CGFloat = 0
    @State private var hasSpace: Bool = true
    
    private let alignment: Alignment
    
    init(_ alignment: Alignment = .center, @FlexItemArrayBuilder content: () -> [FlexItem]) {
        self.alignment = alignment
        self.direction = .row
        self.justify = .flexStart
        self.alignContent = .center
        self.alignItems = .center
        self.content = content()
        
        self._index = .init(initialValue: self.content.count - 1)
    }
    
    public var body: some View {
        VStack(spacing: 20) {
            ScrollViewReader { scroll in
                VStack {
                    GeometryReader { proxy in
                        ScrollView(.vertical) {
                            FlexWrap (
                                container: proxy.frame(in: .global),
                                alignment: alignment,
                                spacing: 16,
                                content: self.content
                            )
                            .anchorPreference(
                                key: SizePref.self,
                                value: .bounds,
                                transform: {
                                    proxy[$0].size
                                }
                            )
                            .drawingGroup()
                        }
                        .frame(maxHeight: height)
                        .onPreferenceChange(SizePref.self) {
                            let _ = print(availableSpace, $0.width)
                            let _ = print(self.height, $0.height)
                            self.height = $0.height
                            self.availableSpace = proxy.frame(in: .global).width - $0.width
                        }
                    }
                    
                    
                    HStack {
                        Button("Add static") {
                            let newRect = FlexChild(
                                shrink: 0,
                                grow: 0
                            ).id(index)
                            
                            let flexItem = FlexItem {
                                AnyView(newRect)
                            }
                            
                            withAnimation(.easeInOut) {
                                self.content.append(flexItem)
                            }
                            
                            index += 1
                        }
                        
                        Spacer(minLength: 64)
                            .fixedSize()
                        
                        Button("Add grow") {
                            let newRect = FlexChild(
                                shrink: 0,
                                grow: .random(in: 1...3)
                            ).id(index)
                            
                            let flexItem = FlexItem {
                                AnyView(newRect)
                            }
                            
                            withAnimation(.easeInOut) {
                                self.content.append(flexItem)
                            }
                            
                            index += 1
                        }
                    }
                }
                .onChange(of: index) { newValue in
                    withAnimation {
                        scroll.scrollTo(index)
                    }
                }
            }
            
        }
    }
}

struct FlexBoxRect_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            FlexBox(.center) {
                FlexChild(shrink: 0, grow: 1)
                
                FlexChild(shrink: 1, grow: 1)
            }
            
            FlexBox(.topLeading) {
                FlexChild(shrink: 0, grow: 1)
                
                FlexChild(shrink: 1, grow: 1)
                
            }
            .previewInterfaceOrientation(.landscapeLeft)
        }
        .padding(24)
    }
}
