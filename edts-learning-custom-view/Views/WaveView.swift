//
//  WaveAnimation.swift
//  edts-learning-custom-view
//
//  Created by Fauzan Sukmapratama on 25/06/25.
//

import SwiftUI

struct WaveView: View {
    @State private var amplitude: CGFloat = 10
    @State private var frequency: CGFloat = 2
    @State private var isAnimating = false

    var body: some View {
        VStack {
            Text("Animated Wave")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(Color.black)
                .padding(.bottom, 24)

            AnimatedWave(amplitude: amplitude, frequency: frequency, phase: 0)
                .stroke(Color.blue, lineWidth: 8)
                .frame(width: 300, height: 300)
                .padding(.horizontal, 20)
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .fill(Color.gray)
                        .opacity(0.2)
                )
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                        amplitude = 56
                        frequency = 4
                    }
                }
        }
    }
}


struct AnimatedWave: Shape {
    var amplitude: CGFloat
    var frequency: CGFloat
    var phase: CGFloat
    var animatableData: CGFloat {
        get {
            amplitude
        }
        set {
            amplitude = newValue
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let centerY = rect.height / 2
        
        path.move(to: CGPoint(x: 0, y: centerY))
        
        for x in stride(from: 0, to: rect.width, by: 1) {
            let y = centerY + sin((x / rect.width * frequency * .pi * 2) + phase) * amplitude
            
            path.addLine(to: CGPoint(x: CGFloat(x), y: y))
        }
        
        return path
        
    }
}

#Preview {
    WaveView()
}
