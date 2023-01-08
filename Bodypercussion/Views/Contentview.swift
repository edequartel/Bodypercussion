//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Ege Çam on 16.07.2022.
//

import SwiftUI
import Soundable

struct ContentView: View {
    
    @State var rythm1Nr = 1
    @State var rythm2Nr = 1
    @State var rythm3Nr = 1
    @State var rythm4Nr = 1
    @State var instrument1Nr = 1
    @State var instrument2Nr = 1
    @State var instrument3Nr = 1
    @State var instrument4Nr = 1
    
    @State private var combination = 4
    
    var rythm = ["key", "dice", "fruit"]
    var instrument = ["body"]
    
    @State private var rythmIndex = 0
    @State private var instrumentIndex = 0
    
    @State private var max = 6
    
    var body: some View {
//        NavigationViiew{
        ZStack {
            VStack {
                HStack {
                    BodyView(index: rythm1Nr, bank: rythm[rythmIndex])
                    BodyView(index: instrument1Nr, bank: instrument[instrumentIndex])
                }
                .padding(.horizontal)
                
                if combination>1 {
                    HStack {
                        BodyView(index: rythm2Nr, bank: rythm[rythmIndex])
                        BodyView(index: instrument2Nr, bank: instrument[instrumentIndex])
                    }
                    .padding(.horizontal)
                }
                if combination>2 {
                    HStack {
                        BodyView(index: rythm3Nr, bank: rythm[rythmIndex])
                        BodyView(index: instrument3Nr, bank: instrument[instrumentIndex])
                    }
                    .padding(.horizontal)
                }
                if combination>3 {
                    HStack {
                        BodyView(index: rythm4Nr, bank: rythm[rythmIndex])
                        BodyView(index: instrument4Nr, bank: instrument[instrumentIndex])
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
                print("\(rythm[rythmIndex])\(rythm1Nr).mp3")
                sounds.append(Sound(fileName: "\(rythm[rythmIndex])\(rythm1Nr).mp3"))
                if combination>1 {sounds.append(Sound(fileName: "\(rythm[rythmIndex])\(rythm2Nr).mp3"))}
                if combination>2 {sounds.append(Sound(fileName: "\(rythm[rythmIndex])\(rythm3Nr).mp3"))}
                if combination>3 {sounds.append(Sound(fileName: "\(rythm[rythmIndex])\(rythm4Nr).mp3"))}
                sounds.play()
            }){
                StyleImage(name: "play.circle.fill")
            }
            .padding(.horizontal)
            
//            Button(action: {
//                if rythmIndex>=rythm.count-1 {
//                    rythmIndex = 0
//                } else {
//                    rythmIndex += 1
//                }
//                print("rythmIndex (\(rythmIndex)")
//                if (rythmIndex==2) { Throw() }
//            }){
//                StyleImage(name: "square.split.1x2.fill")
//            }
//            .padding(.horizontal)
            
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
        if rythmIndex==2 {max=4} else {max=6}
        self.instrument1Nr = Int.random(in: 1...max)
        self.instrument2Nr = Int.random(in: 1...max)
        self.instrument3Nr = Int.random(in: 1...max)
        self.instrument4Nr = Int.random(in: 1...max)
        self.rythm1Nr = Int.random(in: 1...max)
        self.rythm2Nr = Int.random(in: 1...max)
        self.rythm3Nr = Int.random(in: 1...max)
        self.rythm4Nr = Int.random(in: 1...max)
        
        print("\(self.instrument1Nr)")
    }
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct DiceView: View {
//    let n: Int
//    var body: some View {
//        Image("dice\(n)")
//            .resizable()
//            .aspectRatio(1, contentMode: .fit)
//            .padding()
//    }
//}


struct BodyView: View {
    let index: Int //index van de set
    let bank: String //uit welke set van images/audio moet er 1 gepakt worden
    
    var body: some View {
        Image("\(bank)\(index)")
            .resizable()
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
