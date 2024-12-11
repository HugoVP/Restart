//
//  HomeView.swift
//  Restart
//
//  Created by Hugo Vázquez Paleo on 07/12/24.
//

import SwiftUI

struct HomeView: View {
    // MARK: Properties
    @AppStorage("onboarding") var isOnboardingViewActive = false
    @State private var isAnimating = false
    
    // MARK: Body
    var body: some View {
        VStack(spacing: 20) {
            // MARK: Header
            
            Spacer()
            
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeInOut(duration: 4).repeatForever(), value: isAnimating)
            }
            
            // MARK: Center
            
            Text("The time that leads to mastery is dependent on the amount of time you spend practicing.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            
            // MARK: Footer
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingViewActive = true
                }                
            }) {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
                    .controlSize(.large)
            } //: Button
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
        } //: VStack
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating = true
            }
        }
    }
}

#Preview {
    HomeView()
}
