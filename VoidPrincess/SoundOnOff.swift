//
//  InterchangeableImages.swift
//  jogo
//
//  Created by Raquel Ribeiro Hatem de Farias on 06/04/24.
//

import Foundation
import SwiftUI
import AVFoundation

struct SoundOnOff: View {
    @State private var isImage1Visible = true
    
    var body: some View {
        Button(action: {
            self.isImage1Visible.toggle()
            
            if self.isImage1Visible{
                playSound(sound: "artemisSoundTrack", type: "m4a", volume: 1.0, numberOfLoops: -1)
            } else{
                stopSound()
            }
        }) {
            
            if isImage1Visible {
                Image("soundOn")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
            } else {
                Image("soundOff")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}
