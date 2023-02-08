//
//  RICalcView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct RICalcView: View {
    @AppStorage("RICCalcViewMaxLiftVar") private var maxLift = 0.0
    @AppStorage("RICalcViewTargetRepsVar") private var targetReps = 1.0
    @AppStorage("RICalcViewTargetRIVar") private var targetRI = 0.0
        
    var body: some View {
        VStack {
            Text("Weight:\(maxLift)")
                .focusable()
                .digitalCrownRotation($maxLift, from: 0.0, through: 1000, by: 2.5, sensitivity: .low)
            Text("Reps:\(targetReps)")
                .focusable()
                .digitalCrownRotation($targetReps, from: 1.0, through: 25.0, by: 1.0, sensitivity: .low)
            Text("RI:\(targetRI)")
                .focusable()
                .digitalCrownRotation($targetRI, from: 50.0, through: 100.0, by: 2.5, sensitivity: .low)
            Text("Max: \(calculateWeightAtRI(maxLift: maxLift, targetRI: targetRI/100, targetReps: Int(targetReps)))")
        }
    }
}

struct RICalcView_Previews: PreviewProvider {
    static var previews: some View {
        RICalcView()
    }
}
