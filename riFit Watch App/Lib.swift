//
//  Lib.swift
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

func generateFiveThreeOneSets(pattern: strProgramType, maxLift: Double) -> [exerciseSet] {
    switch pattern {
    case .five:
        return [exerciseSet(reps: 5, intensity: 0.65, maxLift: maxLift),
                exerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift),
                exerciseSet(reps: 5, intensity: 0.85, maxLift: maxLift)]
    case .three:
        return [exerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
    case .one:
        return [exerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift),
                exerciseSet(reps: 1, intensity: 0.95, maxLift: maxLift)]
    case .deload:
        return [exerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
    case .contrast:
        return [exerciseSet(reps: 2, intensity: 0.9, maxLift: maxLift),
                exerciseSet(reps: 4, intensity: 0.3, maxLift: maxLift)]
    }
}

func generateOlySets(pattern: olyProgramType, maxLift: Double, relativeIntensity: Double) -> [exerciseSet] {
    switch pattern {
    case .volume:
        return [exerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift)]
    case .singles:
        return [exerciseSet(reps: 3, intensity: 0.75 * relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 2, intensity: 0.8 * relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 1, intensity: 0.85 * relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 1, intensity: 0.9 * relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 1, intensity: 0.95 * relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 1, intensity: 0.975 * relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 1, intensity: 1.0 * relativeIntensity, maxLift: maxLift)]
    case .balanced:
        return [exerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: relativeIntensity + 0.025, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 2, intensity: relativeIntensity + 0.025, maxLift: maxLift),
                exerciseSet(reps: 2, intensity: relativeIntensity, maxLift: maxLift)]
    case .pulls:
        return [exerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 5, intensity: relativeIntensity + 0.025, maxLift: maxLift),
                exerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift),
                exerciseSet(reps: 2, intensity: relativeIntensity + 0.025, maxLift: maxLift)]
    }
}
