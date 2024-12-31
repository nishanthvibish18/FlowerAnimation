//
//  ContentView.swift
//  FlowerRotateEffectView
//
//  Created by Nishanth on 07/09/24.
//

import SwiftUI

struct FlowerCircleView: View {
    
    @State private var isAnimateAngle: Double = 0
    @State private var isAnimationToggle: Bool = false
    @State private var strokecolorArray: [Color] = [Color.cyan, Color.purple]
    var body: some View {
        
        VStack{
            
            Circle()
                .stroke(LinearGradient(colors: strokecolorArray, startPoint: isAnimationToggle ? .top : .bottom, endPoint: isAnimationToggle ? .bottom : .top),lineWidth: 5)
                .frame(width: 300, height: 300)
                .overlay(
                    FlowerAnimateView()
                        .rotationEffect(Angle(degrees: isAnimateAngle))
                )
        }
        .onAppear(){
            withAnimation(.linear(duration: 10.0).speed(0.5).repeatForever(autoreverses: false)) {
                self.isAnimateAngle = 360
                self.isAnimationToggle.toggle()
                self.strokecolorArray = self.isAnimationToggle ? [Color.cyan,Color.blue] : [Color.cyan, Color.purple]
            }
        }
        
    }
}

#Preview {
    FlowerCircleView()
    
}


struct FlowerAnimateView: View {
    var body: some View {
        ZStack{
            
            ZStack{
                Circle().fill(LinearGradient(colors: [Color.green, Color.cyan], startPoint: .top, endPoint: .bottom))
                    .frame(width: 130,height: 130)
                    .offset(y: 65)

                Circle().fill(LinearGradient(colors: [Color.green, Color.cyan], startPoint: .top, endPoint: .bottom))
                    .frame(width: 130,height: 130)
                    .offset(y: -65)
            }
            .opacity(0.5)

            
            
            ZStack{
                Circle().fill(LinearGradient(colors: [Color.green, Color.cyan], startPoint: .top, endPoint: .bottom))
                    .frame(width: 130,height: 130)
                    .offset(y: 65)

                Circle().fill(LinearGradient(colors: [Color.green, Color.cyan], startPoint: .top, endPoint: .bottom))
                    .frame(width: 130,height: 130)
                    .offset(y: -65)
            }
            .rotationEffect(Angle(degrees: 60))
            .opacity(0.5)
            
            
            ZStack{
                Circle().fill(LinearGradient(colors: [Color.green, Color.cyan], startPoint: .top, endPoint: .bottom))
                    .frame(width: 130,height: 130)
                    .offset(y: 65)

                Circle().fill(LinearGradient(colors: [Color.green, Color.cyan], startPoint: .top, endPoint: .bottom))
                    .frame(width: 130,height: 130)
                    .offset(y: -65)
            }
            .rotationEffect(Angle(degrees: 120))
            .opacity(0.5)
        }
    }
}
