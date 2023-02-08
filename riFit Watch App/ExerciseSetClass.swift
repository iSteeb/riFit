//
//  ExerciseSetClass.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 8/2/2023.
//

import Foundation

class exerciseSet {
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
