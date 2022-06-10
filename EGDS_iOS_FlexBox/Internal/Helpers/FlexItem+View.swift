//
//  FlexItem+View.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/3/22.
//

import SwiftUI

extension View {
    func makeFlexItem() -> FlexItem {
        FlexItem() {
            AnyView(self)
        }
    }
}
