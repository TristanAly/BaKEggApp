//
//  TimerView.swift
//  BaKEggApp
//
//  Created by apprenant1 on 27/11/2022.
//

import SwiftUI
import AVFAudio

struct TimerView: View {
    
    @Binding var boiled : Egg
    var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @Binding var play: Bool
    @Binding  var player: AVAudioPlayer?
    @Binding var playAnim: Bool
    @Binding var reset: Bool
    
    var body: some View {
        
        Text("\(boiled.cooking) s")
            .onReceive(timer) {_ in
                UpdateEgg()
                if boiled.cooking == 0 && play {
                    playSound()
                    print("play")
                }
            }
            .font(.system(size: 45))
        
        HStack{
            Spacer()
            Button {
                play.toggle()
                playAnim.toggle()
            } label: {
                Image(systemName: play ? "pause.fill" : "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(.blue).frame(width: 65, height: 65))
            }
            Spacer()
            Button {
                play = false
                reset = true
                playAnim = false
                if reset {
                    player?.stop()
                    switch boiled.name {
                    case "Soft":
                        boiled.cooking  = 300
                    case "Medium":
                        boiled.cooking = 480
                    case "Hard":
                        boiled.cooking = 720
                    default:
                        boiled.cooking = 0
                    }
                }
            } label: {
                Image(systemName: boiled.cooking > 0 ? "arrow.clockwise" : "stop.fill" )
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .background(Circle().fill(.blue).frame(width: 65, height: 65))
            }
            Spacer()
            
        }.padding()
    }
}
private extension TimerView{
    
    func UpdateEgg() {
        if boiled.cooking > 0 && play {
            boiled.cooking -= 1
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
