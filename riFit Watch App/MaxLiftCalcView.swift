//
//  MaxLiftCalcView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct MaxLiftCalcView: View {
    @AppStorage("MaxLiftCalcViewWeightVar") private var weight = 0.0
    @AppStorage("MaxLiftCalcViewRepsVar") private var reps = 1.0

    var body: some View {
        VStack {
            Text("Weight:\(weight)")
                .focusable()
                .digitalCrownRotation($weight, from: 0.0, through: 2500, by: 2.5)
            Text("Reps:\(Int(reps))")
                .focusable()
                .digitalCrownRotation($reps, from: 1.0, through: 100.0, by: 1.0)
            Text("Max: \(calculateMaxLift(weight: weight, reps: Int(reps)))")
        }
    }
}

struct MaxLiftCalcView_Previews: PreviewProvider {
    static var previews: some View {
        MaxLiftCalcView()
    }
}
