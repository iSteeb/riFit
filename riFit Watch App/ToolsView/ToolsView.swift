//
//  ToolsView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        TabView {
            MaxLiftCalcView()
            RICalcView()
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
