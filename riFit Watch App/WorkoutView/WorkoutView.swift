//
//  WorkoutView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI

struct WorkoutView: View {
    @State var maxLift: Double = 100.0
    @State var pattern: StrProgramType = .five

    @State var output: [ExerciseSet] = []

    var body: some View {
        
        VStack {
            Picker("Weight", selection: $maxLift) {
                ForEach(Array(stride(from: 0.0, to: 1002.5, by: 2.5)), id: \.self) { i in
                    Text("\(i, specifier: "%.1f")")
                }
            }
            Picker("Pattern", selection: $pattern) {
                ForEach(StrProgramType.allCases, id: \.self) { i in
                    Text("\(i.rawValue)")
                }
            }
            ForEach(output) { exerciseSet in
                Text("\(exerciseSet.getSetDetails().0)x\(exerciseSet.getSetDetails().1)kg")
            }
        }
        .onAppear {
            output = generateFiveThreeOneSets(pattern: pattern, maxLift: maxLift)
        }
        .onChange(of: maxLift, perform: { newValue in
            output = generateFiveThreeOneSets(pattern: pattern, maxLift: maxLift)
        })
        .onChange(of: pattern, perform: { newValue in
            output = generateFiveThreeOneSets(pattern: pattern, maxLift: maxLift)
        })
    }
}

//struct WorkoutView_Previews: PreviewProvider {
//    static var previews: some View {
//        WorkoutView()
//    }
//}
