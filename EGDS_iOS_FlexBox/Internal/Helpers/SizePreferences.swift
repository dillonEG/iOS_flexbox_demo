//
//  SizePreferences.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/10/22.
//

import SwiftUI

struct SizePref: PreferenceKey {
    static var defaultValue = CGSize.zero
    static func reduce(value: inout CGSize , nextValue: () -> CGSize) {
        value = nextValue()
    }
}
