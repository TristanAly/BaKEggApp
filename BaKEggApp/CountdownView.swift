//
//  CountdownView.swift
//  BaKEggApp
//
//  Created by Tristan Aly on 07/08/2022.
//

import SwiftUI
import Combine

struct CountdownView: View {
    
    @State var boiled : Egg
    
    @State var play = false
    @State var reset = false
    var timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var cancel = Cancellable?(nil)
    
    
    var body: some View {
        ZStack{
            Color.blue.opacity(0.4)
                .ignoresSafeArea()
            VStack{
                Text(boiled.name)
                    .font(.largeTitle)
                
                Image(boiled.image)
                    .resizable()
                    .frame(width: 300, height: 380, alignment: .center)
                    .shadow(color: .orange.opacity(0.7), radius: 6, x: 0, y: 1)
                
                
                Text("\(boiled.cooking) s")
                    .onReceive(timer) {_ in
                        UpdateEgg()
                    }
                    .font(.system(size: 45))
                
                HStack{
                    Spacer()
                    Button {
                        play.toggle()
                    } label: {
                        Image(systemName: play ? "pause.fill" : "play.fill")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().fill(.blue))
                    }
                    Spacer()
                    
                }.padding()
            }
            .padding()
        }
    }
    func UpdateEgg() {
        if boiled.cooking > 0 && play {
            boiled.cooking -= 1
        }else {
            play = false
        }
    }
    
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(boiled: eggCooking[0])
    }
}
