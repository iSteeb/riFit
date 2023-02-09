//
//  TestView.swift
//  riFit Watch App
//
//  Created by Steven Duzevich on 2/2/2023.
//

import SwiftUI
import SpriteKit
import CoreMotion


class GameScene: SKScene {
    private let hamtaroSpriteNode = SKSpriteNode(imageNamed: "hamtaro")
    private let motionManager = CMMotionManager()

    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {
        motionManager.startAccelerometerUpdates()
        
        // game scene
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        // hamtaro node
        hamtaroSpriteNode.position = CGPoint(x: frame.midX, y: frame.midY)
        hamtaroSpriteNode.size = CGSize(width: 20, height: 20)
        self.addChild(hamtaroSpriteNode)
        
        hamtaroSpriteNode.physicsBody = SKPhysicsBody(circleOfRadius: hamtaroSpriteNode.size.width / 2)
        hamtaroSpriteNode.physicsBody?.allowsRotation = true
        hamtaroSpriteNode.physicsBody?.restitution = 0.5
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.x * 0.01, dy: accelerometerData.acceleration.y * 0.01)
        }
    }
}
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
    
    var scene: SKScene {
        let scene = GameScene(size: CGSize(width: 100, height: 100))
        scene.scaleMode = .fill
        
        return scene
    }
    
    var body: some View {
        VStack {
            SpriteView(scene: scene)
//            Button("Add Exercise") {
//                isPresentingModalView.toggle()
//            }
//            .fullScreenCover(isPresented: $isPresentingModalView) {
//                ExerciseModalView(isPresented: $isPresentingModalView)
//            }
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
