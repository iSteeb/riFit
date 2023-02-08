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

// TODO: 
func generateFiveThreeOneSets(pattern: fiveThreeOneProgramType, maxLift: Double) -> [exerciseSet] {
    switch pattern {
    case .five:
        return [exerciseSet(reps: 5, intensity: 0.65, maxLift: maxLift), exerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift), exerciseSet(reps: 5, intensity: 0.85, maxLift: maxLift)]
    case .three:
        return [exerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift), exerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift), exerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
    case .one:
        return [exerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift), exerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift), exerciseSet(reps: 1, intensity: 0.95, maxLift: maxLift)]
    case .deload:
        return [exerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift), exerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift), exerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
    }
}
