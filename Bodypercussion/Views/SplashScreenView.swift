//
//  SplashScreenView.swift
//  Braille
//
//  Created by Eric de Quartel on 03/06/2022.
//

import SwiftUI
import Soundable



struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                LottieView(lottieFile: "dotsloader")
                    .frame(width: 150, height: 150)
            }
            .onAppear {
//                let sound = Sound(fileName: "dice1.mp3")
//                sound.play()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
