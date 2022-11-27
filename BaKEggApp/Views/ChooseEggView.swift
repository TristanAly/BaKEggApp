//
//  ChooseEggView.swift
//  BaKEggApp
//
//  Created by apprenant1 on 27/11/2022.
//

import SwiftUI

struct ChooseEggView: View {
        var boiled : Egg
        
        var body: some View {
            
            VStack{
                Image(boiled.image)
                    .resizable()
                    .frame(maxWidth: 120,maxHeight: 170)
                Text(boiled.name)
                    .foregroundColor(.black)
            }
        }
    }

struct ChooseEggView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseEggView(boiled: eggCooking[0])
    }
}
