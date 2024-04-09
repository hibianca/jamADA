//
//  ContentView.swift
//  jogo
//
//  Created by Raquel Ribeiro Hatem de Farias on 06/04/24.
//

import SwiftUI
import AVFoundation

struct MenuView : View {
    var body: some View {
        NavigationStack{
            ZStack{
                Image("mainBackground")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .frame(alignment: .center)
                
                VStack {
                    NavigationLink(destination: ContentView()) {
                        Image("button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 320)
                            .padding(.leading, 6)
                            .padding(.top, 700)
                    }
                }
                
                VStack{
                    SoundOnOff()
                        .frame(width: 70)
                        .padding(.leading, -380)
                        .padding(.top, -550)
                }
            }
        }
//        .onAppear {
//            playSound(sound: "artemisSoundTrack", type: "m4a", volume: 0.2, numberOfLoops: -1)
//        }
//        .onDisappear(){
//            stopSound()
//        }
    }
}

#Preview {
    MenuView()
}
