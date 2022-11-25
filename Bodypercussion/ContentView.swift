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
    @State var tone1Number = 1
    @State var tone2Number = 1
    @State var tone3Number = 1
    @State var tone4Number = 1
    
    @State private var combination = 4
    
    var hits = ["rythm", "dice", "fruit"]

    @State private var hit = "rythm"
    
    @State private var max = 6
    
    var body: some View {
        ZStack {
            VStack {
                //                Text("Body Percussie")
                //                    .font(.system(size: 20))
                //                    .fontWeight(.heavy)
                //                Spacer()
                HStack {
                    RythmView(n: rythm1Number, h: hit)
                    ToneView(n: tone1Number)
                }
                .padding(.horizontal)
                Spacer()
                
                if combination>1 {
                    HStack {
                        RythmView(n: rythm2Number, h: hit)
                        ToneView(n: tone2Number)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                
                if combination>2 {
                    HStack {
                        RythmView(n: rythm3Number, h: hit)
                        ToneView(n: tone3Number)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                
                if combination>3 {
                    HStack {
                        RythmView(n: rythm4Number, h: hit)
                        ToneView(n: tone4Number)
                    }
                    .padding(.horizontal)
                }
                Spacer()
                
                HStack {
                    Button(action: {
                        Throw()
                    }) {
                        Text("Go")
                        //                            .font(.system(size: 30))
                        //                            .foregroundColor(.blue)
                        //                            .padding(.horizontal)
                        //                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    Spacer()
                        
                    Button(action: {
                        var sounds: [Sound] = []
                        sounds.append(Sound(fileName: "\(hit)\(rythm1Number).mp3"))
                        if combination>1 {sounds.append(Sound(fileName: "\(hit)\(rythm2Number).mp3"))}
                        if combination>2 {sounds.append(Sound(fileName: "\(hit)\(rythm3Number).mp3"))}
                        if combination>3 {sounds.append(Sound(fileName: "\(hit)\(rythm4Number).mp3"))}
                        sounds.play()
                    }){
                        Text("play")
                    }
                    .padding(.horizontal)
                    Spacer()
                    
                    Picker("", selection: $hit) {
                                    ForEach(hits, id: \.self) {
                                        Text($0).tag($0)
                                    }
                                }
                    .onChange(of: hit){
                        tag in print("\(tag)")
                        if tag==("fruit") {max = 4}
                    }
                    Spacer()

                    
                    Button(action: {
                        if combination>=4 {
                            combination = 1
                        } else {
                            combination += 1
                        }
                        
                    }){
                        Text("maten")
                    }
                    .padding(.horizontal)
                    
                    

                }
            
            }
        }
    }
    
    func Throw() {
        self.tone1Number = Int.random(in: 1...max)
        self.tone2Number = Int.random(in: 1...max)
        self.tone3Number = Int.random(in: 1...max)
        self.tone4Number = Int.random(in: 1...max)
        self.rythm1Number = Int.random(in: 1...max)
        self.rythm2Number = Int.random(in: 1...max)
        self.rythm3Number = Int.random(in: 1...max)
        self.rythm4Number = Int.random(in: 1...max)
        
        print("\(self.tone1Number)")
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
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(Angle(degrees: 90))
            .padding()
    }
}

struct RythmView: View {
    let n: Int
    let h: String
    var body: some View {
        Image("\(h)\(n)")
//        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .rotationEffect(Angle(degrees: 90))
            .padding()
    }
}
