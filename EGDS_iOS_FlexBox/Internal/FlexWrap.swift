//
//  FlexWrap.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/4/22.
//

import SwiftUI

struct FlexWrap<Content>: View where Content: View {
    let container: CGRect
    let alignment: Alignment
    let itemSpacing: CGFloat
    let content: [Content]
    
    private let axesCount: Int
    private let axesStarts: [Int]
    
    typealias FlexAxes = (count: Int, starts: [Int], index: Int, size: CGFloat)
    
    init(
        container: CGRect,
        alignment: Alignment = .center,
        spacing: CGFloat,
        content: [Content]
    ) {
        self.container = container
        self.alignment = alignment
        self.itemSpacing = spacing
        self.content = content
        
        let containerAxes = FlexWrap
            .makeAxes(
                content,
                maxAxisSize: container.width,
                spacing: spacing
            )
        self.axesCount = containerAxes.count
        self.axesStarts = containerAxes.starts
    }
    
    func flexStart(_ index: Int) -> Int {
        axesStarts[index]
    }
    
    func flexEnd(_ index: Int) -> Int {
        if index == axesCount - 1 {
            return content.count
        }
        return axesStarts[index + 1]
    }
    
    func makeRow(_ i: Int) -> some View {
        // alignmnet here == vertical alignment of items along main axis
        HStack(alignment: alignment.vertical, spacing: itemSpacing) {
            ForEach(flexStart(i)..<flexEnd(i), id: \.self) {
                content[$0]
            }
        }
        // horizontal alignment of items for each axis
        .frame(maxWidth: container.width, alignment: alignment)
    }
    
    func makeColumn(_ i: Int) -> some View {
        VStack(alignment: alignment.horizontal, spacing: itemSpacing) {
            ForEach(flexStart(i)..<flexEnd(i), id: \.self) {
                content[$0]
            }
        }
    }
    
    var axesViews: some View {
        ForEach(0..<axesCount, id: \.self) { currAxis in
            Group {
                makeRow(currAxis)
            }
        }
    }
    
    var body: some View {
        Group {
            VStack(
                alignment: alignment.horizontal,
                spacing: itemSpacing
            ) {
                axesViews
            }
            .frame(maxWidth: container.width)
        }
    }
    
    
    
    static func makeAxes(
        _ content: [Content],
        maxAxisSize: CGFloat,
        spacing: CGFloat
    ) -> (count: Int, starts: [Int]) {
        let initialAxis: FlexAxes = (0, [], 0, maxAxisSize)
        
        let containerAxes = content.reduce(
            initialAxis
        ) { (axis, flexItem) -> FlexAxes in
            
            let currItemWidth = UIHostingController(rootView: flexItem).view.intrinsicContentSize.width
            var (axesCount, axesStarts, currIndex, currAxisSize) = axis
            
            if currAxisSize + currItemWidth + spacing > maxAxisSize {
                axesCount += 1
                currAxisSize = currItemWidth
                axesStarts.append(currIndex)
            } else {
                currAxisSize += currItemWidth + spacing
            }
            
            currIndex += 1
            
            return (axesCount, axesStarts, currIndex, currAxisSize)
        }
        
        return (containerAxes.count, containerAxes.starts)
    }
}
