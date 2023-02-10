//
//  ToolsView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct ToolsView: View {
    @AppStorage("KMOD") var KMOD: Double = 0.0425

    func calculateSetAI(reps: Int) -> Double {
        return 1 / ((Double(reps) * KMOD) - KMOD + 1)
    }
    
    var body: some View {
        TabView {
            MaxLiftCalcView(calculateSetAI: calculateSetAI)
            RICalcView(calculateSetAI: calculateSetAI)
            Picker("KMOD", selection: $KMOD) {
                ForEach(Array(stride(from: 0.0, to: 0.1025, by: 0.0025)), id: \.self) { i in
                    Text("\((i*100), specifier: "%.2f")")
                }
            }
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
