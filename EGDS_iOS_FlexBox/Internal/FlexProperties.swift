//
//  FlexProperties.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/6/22.
//

enum Direction {
    case row // leading --> trailing (CSS default)
    case rowReverse // trailing <-- leading
    case column // top --> bottom
    case columnReverse // top <-- bottom
}

enum JustifyContent {
    case flexStart
    case center
    case flexEnd
    case spaceBetween
    case spaceAround
    case spaceEvenly
}

enum AlignContent {
    case center
    case flexStart
    case flexEnd
    case baseline
    case stretch
    case spaceBetween
    case spaceAround
}

enum AlignItem {
    case center
    case flexStart
    case flexEnd
    case baseline
    case stretch
}
