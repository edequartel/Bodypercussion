//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Ege Çam on 16.07.2022.
//

import SwiftUI
import Soundable

struct ContentView: View {
    
    @State var rythm1Number = 1
    @State var rythm2Number = 1
    @State var rythm3Number = 1
    @State var rythm4Number = 1
    @State var instrument1Nr = 1
    @State var instrument2Nr = 1
    @State var instrument3Nr = 1
    @State var instrument4Nr = 1
    
    @State private var combination = 4
    
    var rythm = ["key", "dice", "fruit"]
    var hitImages = ["dice.fill","leaf.fill","music.note"]
    
    @State private var hit = 0
    
    @State private var max = 6
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    RythmView(n: rythm1Number, h: hit)
                    ToneView(n: instrument1Nr)
                }
                .padding(.horizontal)
                
                if combination>1 {
                    HStack {
                        RythmView(n: rythm2Number, h: hit)
                        ToneView(n: instrument2Nr)
                    }
                    .padding(.horizontal)
                }
                if combination>2 {
                    HStack {
                        RythmView(n: rythm3Number, h: hit)
                        ToneView(n: instrument3Nr)
                    }
                    .padding(.horizontal)
                }
                if combination>3 {
                    HStack {
                        RythmView(n: rythm4Number, h: hit)
                        ToneView(n: instrument4Nr)
                    }
                    .padding(.horizontal)
                }
            }
            
        }
        .padding(.vertical)
        
        Spacer()
        
        HStack {
            Button(action: {
                Throw()
            }) {
                StyleImage(name: "dice")
            }
            .padding(.horizontal)
            
            Button(action: {
                Soundable.stopAll()
                var sounds: [Sound] = []
                sounds.append(Sound(fileName: "\(rythm[hit])\(rythm1Number).mp3"))
                if combination>1 {sounds.append(Sound(fileName: "\(rythm[hit])\(rythm2Number).mp3"))}
                if combination>2 {sounds.append(Sound(fileName: "\(rythm[hit])\(rythm3Number).mp3"))}
                if combination>3 {sounds.append(Sound(fileName: "\(rythm[hit])\(rythm4Number).mp3"))}
                sounds.play()
            }){
                StyleImage(name: "play.circle.fill")
            }
            .padding(.horizontal)
            
            Button(action: {
                if hit>=rythm.count-1 {
                    hit = 0
                } else {
                    hit += 1
                }
                print("hit (\(hit)")
                if (hit==2) { Throw() }
            }){
//                StyleImage(name: "\(hitImages[hit])")
                StyleImage(name: "square.split.1x2.fill")
//                square.split.1x2.fill
            }
            .padding(.horizontal)
            
            Button(action: {
                if combination>=4 {
                    combination = 1
                } else {
                    combination += 1
                }
            }){
                StyleImage(name: "\(combination).circle.fill")
            }
            .padding(.horizontal)
            
        }
        .padding(.vertical)
    }
    
    func Throw() {
        if hit==2 {max=4} else {max=6}
        self.instrument1Nr = Int.random(in: 1...max)
        self.instrument2Nr = Int.random(in: 1...max)
        self.instrument3Nr = Int.random(in: 1...max)
        self.instrument4Nr = Int.random(in: 1...max)
        self.rythm1Number = Int.random(in: 1...max)
        self.rythm2Number = Int.random(in: 1...max)
        self.rythm3Number = Int.random(in: 1...max)
        self.rythm4Number = Int.random(in: 1...max)
        
        print("\(self.instrument1Nr)")
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
        Image("body\(n)")
            .resizable()
//            .frame(width: 120, height: 120) // resizes image to specified width and heigh
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(Angle(degrees: 90))
            .background(.blue)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.green, lineWidth: 4))
            .shadow(radius: 10)
            .padding()
    }
}

struct RythmView: View {
    let n: Int
    let h: Int
    var hits = ["key", "dice", "fruit"]
    var body: some View {
        Image("\(hits[h])\(n)")
            .resizable()
//            .frame(width: 120, height: 120) // resizes image to specified width and heigh
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(Angle(degrees: 90))
            .background(.blue)
            .cornerRadius(10)
            .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 4))
            .shadow(radius: 10)
            .padding()
    }
}

struct StyleImage : View {
    let name: String
    var body: some View {
        Image(systemName: name)
            .font(Font.system(.largeTitle))
            .rotationEffect(Angle(degrees: 90))
    }
}
