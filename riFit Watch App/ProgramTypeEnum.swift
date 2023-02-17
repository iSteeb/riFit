//
//  ProgramTypeEnum.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 8/2/2023.
//

import Foundation

enum ProgramType: String, Equatable, CaseIterable {
    // 5/3/1
    case five = "5/5/5"
    case three = "3/3/3"
    case one = "5/3/1"
    case deload = "Deload"
    // Contrast
    case contrast = "Contrast"
    // Oly
    case volume = "Volume"
    case singles = "Singles"
    case balanced = "Balanced"
    case pulls = "Pulls"
    // lewis'
    case twelve = "12/10/8/6"
    case eight = "8/6/4/2"
    case fivebyfive = "5x5"
    }

// TODO: Fix the relative intensity input here, probably using the toolsView stuff!

func generateSets(pattern: ProgramType, maxLift: Double, relativeIntensity: Double = 1.0) -> [ExerciseSet] {
    switch pattern {
        // 5/3/1
    case .five:
        return [ExerciseSet(reps: 5, intensity: 0.65, maxLift: maxLift),
                ExerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift),
                ExerciseSet(reps: 5, intensity: 0.85, maxLift: maxLift)]
    case .three:
        return [ExerciseSet(reps: 3, intensity: 0.70, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: 0.80, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: 0.90, maxLift: maxLift)]
    case .one:
        return [ExerciseSet(reps: 5, intensity: 0.75, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift),
                ExerciseSet(reps: 1, intensity: 0.95, maxLift: maxLift)]
    case .deload:
        return [ExerciseSet(reps: 3, intensity: 0.65, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: 0.75, maxLift: maxLift),
                ExerciseSet(reps: 3, intensity: 0.85, maxLift: maxLift)]
        // Contrast TODO: Fix
    case .contrast:
        return [ExerciseSet(reps: 2, intensity: 0.9, maxLift: maxLift),
                ExerciseSet(reps: 4, intensity: 0.0, maxLift: maxLift),
                ExerciseSet(reps: 4, intensity: 0.3, maxLift: maxLift),
                ExerciseSet(reps: 4, intensity: 0.0, maxLift: maxLift)]
        // Oly TODO: Fix????
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
    // lewis'
    case .twelve:
        return [ExerciseSet(reps: 12, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 10, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 8, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 6, intensity: relativeIntensity, maxLift: maxLift)]
    case .eight:
        return [ExerciseSet(reps: 8, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 6, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 4, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 2, intensity: relativeIntensity, maxLift: maxLift)]
    case .fivebyfive:
        return [ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift),
                ExerciseSet(reps: 5, intensity: relativeIntensity, maxLift: maxLift)]
    }
}
