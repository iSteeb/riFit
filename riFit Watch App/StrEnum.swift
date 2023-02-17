//
//  StrEnum.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 8/2/2023.
//

import Foundation

enum StrProgramType: String, Equatable, CaseIterable {
    case five = "5/5/5"
    case three = "3/3/3"
    case one = "5/3/1"
    case deload = "Deload"
    case contrast = "Contrast"
    }

func generateFiveThreeOneSets(pattern: StrProgramType, maxLift: Double) -> [ExerciseSet] {
    switch pattern {
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
    case .contrast:
        return [ExerciseSet(reps: 2, intensity: 0.9, maxLift: maxLift),
                ExerciseSet(reps: 4, intensity: 0.3, maxLift: maxLift)]
    }
}
