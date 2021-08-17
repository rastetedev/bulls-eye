//
//  CustomAlertView.swift
//  Bullseye
//
//  Created by Raul Astete on 13/08/21.
//

import SwiftUI

struct CustomAlertView: View {
    
    @Binding var alertIsVisible : Bool
    
    @Binding var game : Game
    
    var sliderValue : Double
    
    var body: some View {
        AlertContentView(
            game: $game,
            alertIsVisible: $alertIsVisible,
            sliderValue: sliderValue
        )
        .padding()
        .frame(maxWidth: 300)
        .background(Color("BackgroundColor"))
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}


struct AlertContentView : View {
    
    @Binding var game : Game
    
    @Binding var alertIsVisible : Bool
    
    var sliderValue : Double
    
    var body: some View {
        
        let sliderValue = Int(sliderValue.rounded())
        let points = game.points(sliderValue: sliderValue)
        
        VStack(spacing: Constants.General.defaultSpacing, content: {
            InstructionTextView(text: "The slider's value is")
            BigNumberTextView(text: String(sliderValue))
            BodyTextView(text: "You scored \(points) Points \n🎉🎉🎉")
            Button(action: {
                withAnimation{
                    alertIsVisible = false
                }
                game.startNewRound(points: points)
            }) {
                SecondaryButtonTextView(text: "Start new round")
            }
        })
    }
}


struct CustomAlertView_Previews: PreviewProvider {
    
    static var previews: some View {
        CustomAlertView(alertIsVisible: .constant(true), game: .constant(Game()), sliderValue: 32.0)
        CustomAlertView(alertIsVisible: .constant(true), game: .constant(Game()), sliderValue: 32.0)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        CustomAlertView(alertIsVisible: .constant(true), game: .constant(Game()), sliderValue: 32.0)
            .previewLayout(.fixed(width: 568, height: 320))
        CustomAlertView(alertIsVisible: .constant(true), game: .constant(Game()),sliderValue: 32.0)
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
