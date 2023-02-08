//
//  RICalcView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct RICalcView: View {
    @AppStorage("RICCalcViewMaxLiftVar") private var maxLift: Double = 0.0
    @AppStorage("RICalcViewTargetRepsVar") private var targetReps: Int = 1
    @AppStorage("RICalcViewTargetRIVar") private var targetRI: Double = 75.0
        
    var body: some View {
        VStack {
            Picker("1RM", selection: $maxLift) {
                ForEach(Array(stride(from: 0.0, to: 1002.5, by: 2.5)), id: \.self) { i in
                    Text("\(i, specifier: "%.1f")")
                }
            }
            Picker("Rep Target", selection: $targetReps) {
                ForEach(Array(stride(from: 1, to: 26, by: 1)), id: \.self) { i in
                    Text("\(i)")
                }
            }
            Picker("RI Target", selection: $targetRI) {
                ForEach(Array(stride(from: 50.0, to: 102.5, by: 2.5)), id: \.self) { i in
                    Text("\(i, specifier: "%.1f")")
                }
            }
            Text("\(calculateWeightAtRI(maxLift: maxLift, targetRI: targetRI/100, targetReps: targetReps), specifier: "%.1f")")
        }
    }
}

struct RICalcView_Previews: PreviewProvider {
    static var previews: some View {
        RICalcView()
    }
}
