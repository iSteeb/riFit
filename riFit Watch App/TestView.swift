//
//  TestView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI
import CoreMotion

struct ExerciseModalView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Image(systemName: "dumbbell")
                .font(.system(size: 30))

            Text("To play audio, connect Bluetooth headphones to your Apple Watch.")
                .font(.footnote)
                .multilineTextAlignment(.center)
            
            Spacer()

            Button("Connect a Device") {
                isPresented.toggle()
            }.padding(.horizontal)
        }
        .opacity(0.8)
        .padding(10)
    }
}

struct TestView: View {
    @State private var isPresentingModalView = false
    
    @State var numberOfPeople = 100

    
    var body: some View {
        VStack {
            Button("Add Exercise") {
                isPresentingModalView.toggle()
            }
            .fullScreenCover(isPresented: $isPresentingModalView) {
                ExerciseModalView(isPresented: $isPresentingModalView)
            }
            Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
