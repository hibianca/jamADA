//
//  PlaySound.swift
//  jogo
//
//  Created by Raquel Ribeiro Hatem de Farias on 06/04/24.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String, volume: Float, numberOfLoops: Int = 0) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.volume = volume
            audioPlayer?.numberOfLoops = numberOfLoops
            audioPlayer?.play()
        } catch {
            print("ERROR: Could not find and play the sound file!")
        }
    }
}

func stopSound(){
    audioPlayer?.stop()
}
