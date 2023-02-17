//
//  WorkoutView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct WorkoutView: View {
    @State var pattern: ProgramType = .five
    @State var maxLift: Double = 100.0
    @State var relativeIntensity: Double = 1.0

    @State var output: [ExerciseSet] = []

    var body: some View {
        
        VStack {
            HStack {
                Picker("Weight", selection: $maxLift) {
                    ForEach(Array(stride(from: 0.0, to: 1002.5, by: 2.5)), id: \.self) { i in
                        Text("\(i, specifier: "%.1f")")
                    }
                }
                Picker("RI", selection: $relativeIntensity) {
                    ForEach(Array(stride(from: 50.0, to: 102.5, by: 2.5)), id: \.self) { i in
                        Text("\(i, specifier: "%.1f")")
                    }
                }
            }
            Picker("Pattern", selection: $pattern) {
                ForEach(ProgramType.allCases, id: \.self) { i in
                    Text("\(i.rawValue)")
                }
            }
            ForEach(output) { exerciseSet in
                Text("\(exerciseSet.getSetDetails().0)x\(exerciseSet.getSetDetails().1)kg")
            }
        }
        .onAppear {
            output = generateSets(pattern: pattern, maxLift: maxLift, relativeIntensity: relativeIntensity/100)
        }
        .onChange(of: pattern, perform: { newValue in
            output = generateSets(pattern: pattern, maxLift: maxLift, relativeIntensity: relativeIntensity/100)
        })
        .onChange(of: maxLift, perform: { newValue in
            output = generateSets(pattern: pattern, maxLift: maxLift, relativeIntensity: relativeIntensity/100)
        })
        .onChange(of: relativeIntensity, perform: { newValue in
            output = generateSets(pattern: pattern, maxLift: maxLift, relativeIntensity: relativeIntensity/100)
        })
    }
}

//struct WorkoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutView()
//    }
//}
