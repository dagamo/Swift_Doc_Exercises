//
//  ContentView.swift
//  DiceRoller
//
//  Created by David Garcia on 11/02/25.
//

import SwiftUI

struct DiceRollerView: View {
    @State private var numberOfPips:Int = 1
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "die.face.\(numberOfPips).fill")
                .resizable()
                .frame(maxWidth: 100, maxHeight: 100)
                .aspectRatio(1, contentMode:.fit)
                .foregroundStyle(.black, .white)
            Button("Roll"){
                withAnimation{
                    numberOfPips = Int.random(in: 1...6)
                }
            }
            .buttonStyle(.bordered)
        }
        
    }
}

#Preview {
    DiceRollerView()
}
