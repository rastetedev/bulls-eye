//
//  ContentView.swift
//  Bullseye
//
//  Created by Raul Astete on 9/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var game = Game()
    
    @State private var sliderValue = 50.0
    
    @State private var alertIsVisible: Bool = false
    
    var body: some View {
        
        let spacing = alertIsVisible ? CGFloat(0) : CGFloat(100)
        
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionsView(game: game)
                    .padding(.bottom, spacing)
                if alertIsVisible {
                    CustomAlertView(
                        alertIsVisible: $alertIsVisible,
                        game: $game,
                        sliderValue : sliderValue
                    )
                    .transition(.scale)
                } else {
                    HitMeButton(
                        text: "Hit me",
                        alertIsVisible :$alertIsVisible
                    )
                    .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}


struct InstructionsView: View {
    
    var game: Game
    
    var body : some View {
        VStack{
            InstructionTextView(text: "🎯🎯🎯 \nPut the bullseye as close as you can to")
                .padding(.horizontal, 30.0)
            BigNumberTextView(text: String(game.target))
        }
    }
}


struct SliderView: View {
    
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderTextView(text: "1")
            Slider(value: $sliderValue,
                   in : 1.0...100.0)
            SliderTextView(text: "100")
        }
        .padding()
    }
}


struct HitMeButton: View {
    
    var text: String
    
    @Binding var alertIsVisible: Bool

    var body: some View {
        Button(action: {
            withAnimation{
                alertIsVisible = true
            }
        }) {
            MainButtonTextView(text: "Hit me!")
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(
                    gradient: Gradient(
                        colors: [Color.white.opacity(0.3),
                                 Color.clear]
                    ),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
            })
        .foregroundColor(Color.white)
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
        )
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView().previewLayout(.fixed(width: 568, height: 320))
        ContentView().previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
