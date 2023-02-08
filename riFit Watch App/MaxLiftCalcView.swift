//
//  MaxLiftCalcView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct MaxLiftCalcView: View {
    @AppStorage("MaxLiftCalcViewWeightVar") private var weight: Double = 100.0
    @AppStorage("MaxLiftCalcViewRepsVar") private var reps: Int = 1

    var body: some View {
        VStack {
            Picker("Weight Lifted", selection: $weight) {
                ForEach(Array(stride(from: 0.0, to: 1002.5, by: 2.5)), id: \.self) { i in
                    Text("\(i, specifier: "%.1f")")
                }
            }
            Picker("Number of Reps", selection: $reps) {
                ForEach(Array(stride(from: 1, to: 26, by: 1)), id: \.self) { i in
                    Text("\(i)")
                }
            }
            Text("\(calculateMaxLift(weight: weight, reps: reps), specifier: "%.1f")")
        }
    }
}

struct MaxLiftCalcView_Previews: PreviewProvider {
    static var previews: some View {
        MaxLiftCalcView()
    }
}
