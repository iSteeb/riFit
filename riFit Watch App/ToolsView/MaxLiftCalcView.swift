//
//  MaxLiftCalcView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct MaxLiftCalcView: View {
    @AppStorage("MaxLiftCalcViewWeightVar") var weight: Double = 100.0
    @AppStorage("MaxLiftCalcViewRepsVar") var reps: Int = 1
    @AppStorage("KMOD") var KMOD: Double = 0.0425

    var calculateSetAI: (Int) -> Double
    func calculateMaxLift(weight: Double, reps: Int) -> Double {
        return weight / self.calculateSetAI(reps)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("1RM Calculator")
                Picker("KMOD", selection: $KMOD) {
                    ForEach(Array(stride(from: 0.0, to: 0.1025, by: 0.0025)), id: \.self) { i in
                        Text("\((i*100), specifier: "%.2f")")
                    }
                }
                .labelsHidden()
                .padding(10)
            }
            HStack {
                Picker("Weight", selection: $weight) {
                    ForEach(Array(stride(from: 0.0, to: 1002.5, by: 2.5)), id: \.self) { i in
                        Text("\(i, specifier: "%.1f")")
                    }
                }
                .padding(.leading, 12)
                .padding(.trailing, 12)
                .padding(.top, 15)
                Picker("Reps", selection: $reps) {
                    ForEach(Array(stride(from: 1, to: 26, by: 1)), id: \.self) { i in
                        Text("\(i)")
                    }
                }
                .padding(.leading, 12)
                .padding(.trailing, 12)
                .padding(.top, 15)
            }
            Text("\(calculateMaxLift(weight: weight, reps: reps), specifier: "%.1f")")
                .font(.title)
        }
    }
}

struct MaxLiftCalcView_Previews: PreviewProvider {
    static var previews: some View {
        let parent = ToolsView()
        MaxLiftCalcView(calculateSetAI: parent.calculateSetAI)
    }
}
