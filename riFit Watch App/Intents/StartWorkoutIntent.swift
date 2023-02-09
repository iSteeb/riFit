//
//  StartWorkoutIntent.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 9/2/2023.
//

import Foundation
import AppIntents

enum WorkoutStyle: String, AppEnum, CustomStringConvertible {

    static let typeDisplayRepresentation: TypeDisplayRepresentation = "Style"

    static let caseDisplayRepresentations: [WorkoutStyle : DisplayRepresentation] = [
        .lift: "Weightlifting",
    ]

    case lift

    var description: String {
        return rawValue.capitalized
    }
}

struct BeginWorkoutIntent: StartWorkoutIntent {

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(workoutStyle)")
    }

    static var title: LocalizedStringResource {
        "Start Workout"
    }

    @Parameter(title: "Workout")
    var workoutStyle: WorkoutStyle

    static var openAppWhenRun: Bool {
        true
    }

    static var suggestedWorkouts: [BeginWorkoutIntent] {
        return [
            BeginWorkoutIntent(
                style: .lift
            )
        ]
    }

    init() {
        self.workoutStyle = .lift
    }

    func perform() async throws -> some IntentResult {
        NSLog("Perform: \(workoutStyle)")
        return .result(actionButtonIntent: PauseIntent())
    }
}

struct PauseIntent: PauseWorkoutIntent {

    static var title: LocalizedStringResource = .init(stringLiteral: "Pause")

    func perform() async throws -> some IntentResult {
        NSLog("Perform pause")
        return .result()
    }
}

struct ResumeIntent: ResumeWorkoutIntent {

    static var title: LocalizedStringResource = .init(stringLiteral: "Resume")

    func perform() async throws -> some IntentResult {
        NSLog("Perform resume")
        return .result()
    }
}

