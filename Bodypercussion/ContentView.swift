//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Ege Çam on 16.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var rythm1Number = 1
    @State var rythm2Number = 1
    @State var rythm3Number = 1
    @State var rythm4Number = 1
    @State var tone1Number = 1
    @State var tone2Number = 1
    @State var tone3Number = 1
    @State var tone4Number = 1
    
    var body: some View {
        ZStack {
            VStack {
//                Text("Body Percussie")
//                    .font(.system(size: 20))
//                    .fontWeight(.heavy)
//                Spacer()
                HStack {
                    RythmView(n: tone1Number)
                    ToneView(n: rythm1Number)
                }
                .padding(.horizontal)
                Spacer()
                HStack {
                    RythmView(n: tone2Number)
                    ToneView(n: rythm2Number)
                }
                .padding(.horizontal)
                Spacer()
                
                HStack {
                    RythmView(n: tone3Number)
                    ToneView(n: rythm3Number)
                }
                .padding(.horizontal)
                Spacer()
      
                HStack {
                    RythmView(n: tone4Number)
                    ToneView(n: rythm4Number)
                }
                .padding(.horizontal)
                Spacer()
                
                Button(action: {
                    self.tone1Number = Int.random(in: 1...6)
                    self.tone2Number = Int.random(in: 1...6)
                    self.tone3Number = Int.random(in: 1...6)
                    self.tone4Number = Int.random(in: 1...6)
                    self.rythm1Number = Int.random(in: 1...6)
                    self.rythm2Number = Int.random(in: 1...6)
                    self.rythm3Number = Int.random(in: 1...6)
                    self.rythm4Number = Int.random(in: 1...6)
                }) {
                    Text("Gooi")
                        .font(.system(size: 30))
                        .foregroundColor(.blue)
                        .padding(.horizontal)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ToneView: View {
    let n: Int
    var body: some View {
        Image("tone\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(Angle(degrees: -90))
            .padding()
    }
}

struct RythmView: View {
    let n: Int
    var body: some View {
        Image("rythm\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(Angle(degrees: -90))
            .padding()
    }
}
