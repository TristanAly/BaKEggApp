//
//  HomeView.swift
//  BaKEggApp
//
//  Created by Tristan Aly on 07/08/2022.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                VStack(spacing: 100){
                    Text("Choose your favorite  egg")
                        .font(.largeTitle)
                        .padding()
                    HStack{
                        ForEach(eggCooking, id: \.name) { cook in
                            NavigationLink{
                                CountdownView(boiled: cook)
                            } label: {
                                ChooseEggView(boiled: cook)
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

