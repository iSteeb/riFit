//
//  OlyEnum.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 8/2/2023.
//

import Foundation

enum OlyProgramType {
    case volume
    case singles
    case balanced
    case pulls
}

func generateOlySets(pattern: OlyProgramType, maxLift: Double, relativeIntensity: Double) -> [ExerciseSet] {
    switch pattern {
    case .volume:
        return [ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift)]
    case .singles:
        return [ExerciseSet(reps: 3, intensity: 0.75 * relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 2, intensity: 0.8 * relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 1, intensity: 0.85 * relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 1, intensity: 0.9 * relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 1, intensity: 0.95 * relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 1, intensity: 0.975 * relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 1, intensity: 1.0 * relativeIntensity, maxLift: maxLift)]
    case .balanced:
        return [ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: relativeIntensity + 0.025, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 2, intensity: relativeIntensity + 0.025, maxLift: maxLift),
                ExerciseSet(reps: 2, intensity: relativeIntensity, maxLift: maxLift)]
    case .pulls:
        return [ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 5, intensity: relativeIntensity + 0.025, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 2, intensity: relativeIntensity + 0.025, maxLift: maxLift)]
    }
}
