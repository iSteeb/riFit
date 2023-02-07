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

enum StrengthProgramType {
    case five
    case three
    case one
    case deload
    case contrast
}

class StrengthExerciseSet {
    private var reps: Int
    private var intensity: Double
    private var maxLift: Double
    
    init(reps: Int, intensity: Double, maxLift: Double) {
        self.reps = reps
        self.intensity = intensity
        self.maxLift = maxLift
    }
    
    func getSetDetails() -> (reps: String, weight: String) {
        return (String(reps), String(intensity * maxLift))
    }
}

func generateStrengthExerciseSets(pattern: StrengthProgramType, maxLift: Double) -> [StrengthExerciseSet] {
    switch pattern {
    case .five:
        return [StrengthExerciseSet(reps: 5, intensity: 0.65, maxLift: maxLift), StrengthExerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift), StrengthExerciseSet(reps: 5, intensity: 0.85, maxLift: maxLift)]
    case .three:
        return [StrengthExerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift), StrengthExerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift), StrengthExerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
    case .one:
        return [StrengthExerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift), StrengthExerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift), StrengthExerciseSet(reps: 1, intensity: 0.95, maxLift: maxLift)]
    case .deload:
        return [StrengthExerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift), StrengthExerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift), StrengthExerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
    case .contrast:
        return [StrengthExerciseSet(reps: 2, intensity: 0.90, maxLift: maxLift), StrengthExerciseSet(reps: 4, intensity: 0.30, maxLift: maxLift)]
    }
}

enum OlyLiftProgramType {
    case hang
    case pull
    case regular
    case deload
}

//clean ["ri=, 3", "ri+, 3", "ri=, 3", "ri+, 2", "ri=, 2"]
//hang clean ["ri=, 5", "ri+, 3", "ri=, 3", "ri+, 2", "ri=, 2"]
//clean pull ["ri=, 5", "ri+, 5", "ri=, 3", "ri+, 2"]
//
//snatch ["ri=, 3", "ri+, 3", "ri=, 3", "ri+, 2", "ri=, 2"]
//hang snatch ["ri=, 5", "ri+, 3", "ri=, 3", "ri+, 2", "ri=, 2"]
//snatch pull ["ri=, 5", "ri+, 5", "ri=, 3", "ri+, 2"]

class OlyLiftExerciseSet {
    private var reps: Int
    private var intensity: Double
    private var maxLift: Double
    
    init(reps: Int, intensity: Double, maxLift: Double) {
        self.reps = reps
        self.intensity = intensity
        self.maxLift = maxLift
    }
    
    func getSetDetails() -> (reps: String, weight: String) {
        return (String(reps), String(intensity * maxLift))
    }
}

func generateOlyLiftExerciseSets(pattern: OlyLiftProgramType, maxLift: Double) -> [OlyLiftExerciseSet] {
    switch pattern {
    case .hang:
        return [OlyLiftExerciseSet(reps: 5, intensity: 0.65, maxLift: maxLift), OlyLiftExerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift), OlyLiftExerciseSet(reps: 5, intensity: 0.85, maxLift: maxLift)]
    case .pull:
        return [OlyLiftExerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift), OlyLiftExerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift), OlyLiftExerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
    case .regular:
        return [OlyLiftExerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift), OlyLiftExerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift), OlyLiftExerciseSet(reps: 1, intensity: 0.95, maxLift: maxLift)]
    case .deload:
        return [OlyLiftExerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift), OlyLiftExerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift), OlyLiftExerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
    }
}
