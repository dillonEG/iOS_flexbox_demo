//
//  FlexItem.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/3/22.
//

import SwiftUI

/// Wraps view and exposes properties for FlexBox use
struct FlexItem: View {
    // defaults: grow = 0, shrink = 1, basis = nil (intrinsic size)
    typealias Flex = (grow: CGFloat, shrink: CGFloat, basis: CGFloat?)
    
    var order: Int?
    @State private var flex: Flex = (0, 1, nil)
    var alignSelf: AlignItem?
    @ViewBuilder let content: () -> AnyView
    
    var body: some View {
        content()
    }
}

extension FlexItem {
    func order(_ order: Int) { }
    
    func flex(_ flex: Flex) { }
    
    func flexGrow(_ grow: CGFloat) { }
    
    func flexShrink(_ shrink: CGFloat) { }
    
    func flexBasis(_ basis: CGFloat) { }
}
