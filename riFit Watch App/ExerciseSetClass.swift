//
//  ExerciseSetClass.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 8/2/2023.
//

import Foundation

// TODO: Improve access to vars, i.e. reps should be public, constructor should form a public weight var, and relative intensity should be calculated and also made public.
// TODO: Probably include an exercise name/type in this as well, public.

class ExerciseSet: Identifiable {
    let id = UUID()
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
