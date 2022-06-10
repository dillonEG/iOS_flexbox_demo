//
//  FlexChild.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/4/22.
//

import SwiftUI

struct FlexChild: View {
    @State private var width: CGFloat
    @State private var height: CGFloat
    let shrink: CGFloat
    let grow: CGFloat
    
    private let color: Color
    private let priority: CGFloat
    
    init(
        w: State<CGFloat> = .init(initialValue: .random(in: 30...160)),
        h: State<CGFloat> = .init(initialValue: .random(in: 80...220)),
        shrink: CGFloat,
        grow: CGFloat
    ) {
        self._width = w
        self._height = h
        self.shrink = shrink
        self.grow = grow
        self.color = Color.random()
        
        switch (Int(shrink), Int(grow)) {
            case (0..., 1...):
                priority = 1
            case (1..., 0):
                priority = -1
            default:
                priority = 0
        }
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: min(width, height) / 6)
            .frame(minWidth: width,
                   idealWidth: width,
                   maxWidth: priority < 1 ? width : .infinity,
                   minHeight: height,
                   idealHeight: height,
                   maxHeight: height)
            .fixedSize(horizontal: shrink == 0 && grow == 0, vertical: true)
            .foregroundColor(color.opacity(0.25))
            .layoutPriority(priority)
            .overlay {
                sizeReader
            }
    }
}


// MARK: Read Child View Size
extension FlexChild {
    var sizeReader: some View {
        GeometryReader { proxy in
            let initial = (w: Int(width), h: Int(height))
            let actual = (w: Int(proxy.size.width), h: Int(proxy.size.height))
            
            VStack(spacing: 2) {
                Group {
                    Text("\(initial.w)w x \(initial.h)h")
                        .bold()
                        .scaledToFit()
                        .minimumScaleFactor(0.3)
                    
                    Text("s: \(Int(shrink)), g: \(Int(grow))")
                        .scaledToFit()
                        .minimumScaleFactor(0.3)
                    
                    Text("priority: \(Int(priority))")
                        .bold()
                        .scaledToFit()
                        .minimumScaleFactor(0.3)
                    
                    Text("\(actual.w)w x \(actual.h)h")
                        .scaledToFit()
                        .minimumScaleFactor(0.3)
                        .padding(3)
                        .background {
                            if actual.w > initial.w {
                                Color.green.opacity(0.5)
                            } else if actual.w == initial.w {
                                Color.orange.opacity(0.5)
                            } else {
                                Color.pink.opacity(0.5)
                            }
                        }
                        .padding(4)
                }
                .font(.system(size: 10))

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


// MARK: Random Color Helper
extension Color {
    static func random() -> Color {
        return [.red, .blue, .green, .yellow, .purple].randomElement()!
    }
}
