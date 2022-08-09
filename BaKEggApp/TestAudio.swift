//
//  TestAudio.swift
//  BaKEggApp
//
//  Created by Tristan Aly on 09/08/2022.
//

import SwiftUI
import AVKit

struct TestAudio: View {
    @State var audioPlayer: AVAudioPlayer! = nil
    var body: some View {
        ZStack {
                    VStack {
                            Text("Play").font(.system(size: 45)).font(.largeTitle)
                        HStack {
                            Spacer()
                            Button(action: {
                                self.audioPlayer.play()
                            }) {
                                Image(systemName: "play.circle.fill").resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                            }
                            Spacer()
                            Button(action: {
                                self.audioPlayer.pause()
                            }) {
                                Image(systemName: "pause.circle.fill").resizable()
                                    .frame(width: 50, height: 50)
                                    .aspectRatio(contentMode: .fit)
                            }
                            Spacer()
                        }
                    }
                }
                .onAppear {
//                    let sound = Bundle.main.path(forResource: "song", ofType: "mp3")
//                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                }
    }
}

struct TestAudio_Previews: PreviewProvider {
    static var previews: some View {
        TestAudio()
    }
}
