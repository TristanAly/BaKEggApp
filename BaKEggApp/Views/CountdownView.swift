//
//  CountdownView.swift
//  BaKEggApp
//
//  Created by Tristan Aly on 07/08/2022.
//

import SwiftUI
import Combine
import AVFoundation

struct CountdownView: View {
    
    @State var boiled : Egg
    @State var second = 60
    @State var playAnim = false
    @State var play = false
    @State var reset = false
    var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State  var player: AVAudioPlayer! = nil
    @State var angle = 5
    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.4)
                .ignoresSafeArea()
            VStack{
                Text(boiled.name)
                    .font(.largeTitle)
                VStack{
                    ZStack{
                        if boiled.cooking == 0 {
                            Image(boiled.image)
                                .resizable()
                                .frame(width: 300, height: 380, alignment: .center)
                                .shadow(color: .orange.opacity(0.7), radius: 6, x: 0, y: 1)
                        } else if boiled.cooking < 100 {
                            
                           SecondEggImageView(angle: 5)
                            
                        }  else if boiled.cooking < 175 {
                            withAnimation{
                                Image("egg3")
                                .resizable()
                                .frame(width: 310, height: 400, alignment: .center)
                                .rotationEffect(.degrees(Double(angle)))
                                .animateForever(autoreverses: true, { angle = 0})
                            }
                        }
                        else if boiled.cooking < 250 {
                            
                            EggImageView(angle: 5)
                            
                        } else {
                            Image("egg")
                            .resizable()
                            .frame(width: 310, height: 385, alignment: .center)
                            .rotationEffect(.degrees( playAnim ? 5 : 0))
                            .animation( playAnim ? Animation.default.repeatForever(autoreverses: true).speed(2) : Animation.default)
                        }
                    }
            }
                TimerView(boiled: $boiled, play: $play, player: $player, playAnim: $playAnim, reset: $reset)
            }
            .padding()
        }
    }
}
struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(boiled: eggCooking[0])
    }
}
