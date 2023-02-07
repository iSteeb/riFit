//
//  lib.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 6/2/2023.
//

import Foundation

var KMOD: Double = 0.0425

func calculateSetAI(reps: Int) -> Double {
    return 1 / ((Double(reps) * KMOD) - KMOD + 1)
}

func calculateMaxLift(weight: Double, reps: Int) -> Double {
    return weight / calculateSetAI(reps: reps)
}

func calculateWeightAtRI(maxLift: Double, targetRI: Double, targetReps: Int) -> Double {
    return calculateSetAI(reps: targetReps) * targetRI * maxLift
}
