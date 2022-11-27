//
//  AnimateForever.swift
//  BaKEggApp
//
//  Created by apprenant1 on 27/11/2022.
//

import SwiftUI

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
