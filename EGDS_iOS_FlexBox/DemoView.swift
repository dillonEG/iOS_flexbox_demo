//
//  DemoView.swift
//  EGDS_iOS_FlexBox
//
//  Created by Dillon on 6/3/22.
//

import SwiftUI

struct DemoView: View {
    var body: some View {
        FlexBox(.center) {
            FlexChild(shrink: 0, grow: 0)
            
            FlexChild(shrink: 1, grow: 0)
        }
        .padding(24)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            DemoView()
            
            DemoView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
