//
//  SecondEggImageView.swift
//  BaKEggApp
//
//  Created by apprenant1 on 27/11/2022.
//

import SwiftUI

struct SecondEggImageView: View {
        
        @State var angle = 5
        
        var body: some View {
            Image("egg1")
            .resizable()
            .frame(width: 310, height: 400, alignment: .center)
            .rotationEffect(.degrees(Double(angle)))
            .animateForever(autoreverses: true, { angle = 0})
        }
    }

struct SecondEggImageView_Previews: PreviewProvider {
    static var previews: some View {
        SecondEggImageView()
    }
}
