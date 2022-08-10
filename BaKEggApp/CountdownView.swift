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
    @State var cancel = Cancellable?(nil)
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
                        if  boiled.cooking == 0 {
                            Image(boiled.image)
                                .resizable()
                                .frame(width: 300, height: 380, alignment: .center)
                                .shadow(color: .orange.opacity(0.7), radius: 6, x: 0, y: 1)
                        } else if boiled.cooking < 100 {
                            EggImage1(angle: 5)
//                            withAnimation{
//                            Image("egg1")
//                            .resizable()
//                            .frame(width: 310, height: 400, alignment: .center)
//                            .rotationEffect(.degrees(Double(angle)))
//                            .animateForever(autoreverses: true, { angle = 0})
//                            }
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
                            
                            EggImage(angle: 5)
                            
                        } else {
                            Image("egg")
                            .resizable()
                            .frame(width: 310, height: 385, alignment: .center)
                            .rotationEffect(.degrees( playAnim ? 5 : 0))
                            .animation( playAnim ? Animation.default.repeatForever(autoreverses: true).speed(2) : Animation.default)
                        }
                    }
            }
                
                
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
                                boiled.cooking = 300
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
            .padding()
        }
    }
}
struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(boiled: eggCooking[0])
    }
}

private extension CountdownView{
  
    func UpdateEgg() {
        if boiled.cooking > 0 && play {
            boiled.cooking -= 1
        }
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    
}
extension View {
    func animateForever(animation: Animation = .default.speed(2), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)

        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}

struct EggImage: View {
    
    @State var angle = 5
    
    var body: some View {
        Image("egg2")
        .resizable()
        .frame(width: 310, height: 400, alignment: .center)
        .rotationEffect(.degrees(Double(angle)))
        .animateForever(autoreverses: true, { angle = 0})
    }
}

struct EggImage1: View {
    
    @State var angle = 5
    
    var body: some View {
        Image("egg1")
        .resizable()
        .frame(width: 310, height: 400, alignment: .center)
        .rotationEffect(.degrees(Double(angle)))
        .animateForever(autoreverses: true, { angle = 0})
    }
}
