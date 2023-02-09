//
//  StrEnum.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 8/2/2023.
//

import Foundation

enum strProgramType {
    case five
    case three
    case one
    case deload
    case contrast
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
