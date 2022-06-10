//
//  RefactorFlexBox.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/7/22.
//

//struct FlexBox {
//    let direction: Direction
//    let justify: JustifyContent
//    let alignContent: AlignContent
//    let alignItems: AlignItem
//    let content: () -> [AnyView]
//}

//struct FlexItemView<Content: View>: FlexItem {
//    // defaults: grow = 0, shrink = 1, basis = intrinsic size
//    typealias Flex = (grow: CGFloat, shrink: CGFloat, basis: CGFloat?)
//
//    var flex: Flex
//    var alignSelf: AlignItem
//    var content: () -> Content
//
//    init(flex: Flex, alignSelf: AlignItem, content: @escaping () -> Content) {
//        self.flex = flex
//        self.alignSelf = alignSelf
//        self.content = content
//    }
//
//    var body: some View {
//        content()
//    }
//}
//
//protocol FlexItem: View {
//    associatedtype Content
//    init(flex: Flex, alignSelf: AlignItem, content: @escaping () -> Content)
//
//    associatedtype Flex
//    var flex: Flex { get set }
//    var alignSelf: AlignItem { get set }
//}
//
//extension FlexItem {
//    init(_ flex: Flex, alignSelf: AlignItem, @ViewBuilder _ content: @escaping () -> Content) {
//        self.init(flex: flex, alignSelf: alignSelf, content: content)
//    }
//}
