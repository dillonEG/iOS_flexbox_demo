//
//  FlexItemArrayBuilder.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/3/22.
//

import SwiftUI

// MARK: FlexItems Result Builder DSL
@resultBuilder
enum FlexItemArrayBuilder {
    static func buildBlock(_ components: AnyView...) -> [FlexItem] {
        return components.map({ $0.makeFlexItem() })
    }
}

extension FlexItemArrayBuilder {
    public static func buildBlock<C0, C1>(
        _ c0: C0,
        _ c1: C1
    ) -> [FlexItem] where C0 : View, C1 : View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
        ]
    }
    
    public static func buildBlock<C0, C1, C2>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2
    ) -> [FlexItem] where C0 : View, C1 : View, C2: View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
            c2.makeFlexItem()
        ]
    }
    
    public static func buildBlock<C0, C1, C2, C3>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3
    ) -> [FlexItem] where C0 : View, C1 : View, C2: View, C3: View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
            c2.makeFlexItem(),
            c3.makeFlexItem()
        ]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4
    ) -> [FlexItem] where C0 : View, C1 : View, C2: View, C3: View, C4: View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
            c2.makeFlexItem(),
            c3.makeFlexItem(),
            c4.makeFlexItem()
        ]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5
    ) -> [FlexItem] where C0 : View, C1 : View, C2: View, C3: View, C4: View, C5: View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
            c2.makeFlexItem(),
            c3.makeFlexItem(),
            c4.makeFlexItem(),
            c5.makeFlexItem()
        ]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5,
        _ c6: C6
    ) -> [FlexItem] where C0 : View, C1 : View, C2: View, C3: View, C4: View, C5: View, C6: View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
            c2.makeFlexItem(),
            c3.makeFlexItem(),
            c4.makeFlexItem(),
            c5.makeFlexItem(),
            c6.makeFlexItem()
        ]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5,
        _ c6: C6,
        _ c7: C7
    ) -> [FlexItem] where C0 : View, C1 : View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
            c2.makeFlexItem(),
            c3.makeFlexItem(),
            c4.makeFlexItem(),
            c5.makeFlexItem(),
            c6.makeFlexItem(),
            c7.makeFlexItem()
        ]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5,
        _ c6: C6,
        _ c7: C7,
        _ c8: C8
    ) -> [FlexItem] where C0 : View, C1 : View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
            c2.makeFlexItem(),
            c3.makeFlexItem(),
            c4.makeFlexItem(),
            c5.makeFlexItem(),
            c6.makeFlexItem(),
            c7.makeFlexItem(),
            c8.makeFlexItem()
        ]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5,
        _ c6: C6,
        _ c7: C7,
        _ c8: C8,
        _ c9: C9
    ) -> [FlexItem] where C0: View, C1: View, C2: View, C3: View, C4: View, C5: View, C6: View, C7: View, C8: View, C9: View {
        [
            c0.makeFlexItem(),
            c1.makeFlexItem(),
            c2.makeFlexItem(),
            c3.makeFlexItem(),
            c4.makeFlexItem(),
            c5.makeFlexItem(),
            c6.makeFlexItem(),
            c7.makeFlexItem(),
            c8.makeFlexItem(),
            c9.makeFlexItem()
        ]
    }
}
