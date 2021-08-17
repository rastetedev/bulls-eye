//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Raul Astete on 12/08/21.
//

import SwiftUI

struct BackgroundView: View {
    
    @Binding var game: Game
    
    var body: some View {
        
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(RingsView())
    }
}


struct TopView : View {
    
    @Binding var game: Game
    
    @State private var leaderboardIsShowing = false
    
    var body: some View {
        HStack {
            Button(action :  {
                game.resetGame()
            }) {
                RoundedImageStrokedView(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button( action: {
                leaderboardIsShowing = true
            }) {
                RoundedImageFilledView(systemName: "list.dash")
            }.sheet(isPresented: $leaderboardIsShowing, content: {
                LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
            })
            
        }
    }
}


struct BottomView : View {
    
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "Score", text: String(game.score))
            Spacer()
            NumberView(title: "Round", text: String(game.round))
        }
    }
}


struct NumberView : View {
    
    var title: String
    
    var text: String
    
    var body: some View {
        VStack(spacing: 5.0){
            LabelTextView(text: title)
            RoundedRectTextView(text: text)
        }
    }
}


struct RingsView : View {
    
    @Environment(\.colorScheme) var colorScheme : ColorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1 ..< 5) { item in
                let size = CGFloat(item * 100)
                let opacity = colorScheme ==  .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                        RadialGradient(
                            gradient: Gradient(
                                colors: [
                                    Color("RingColor").opacity(opacity), Color("RingColor").opacity(0)
                                ]),
                            center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/,
                            startRadius: 100,
                            endRadius: 300
                        )
                    )
                    .frame(width: size, height: size)
            }
        }
    }
}


struct BackgroundView_Preview : View {
    
    var body: some View {
        BackgroundView(game: .constant(Game()))
    }
}


struct BackgroundView_Previews: PreviewProvider {
    
    static var previews: some View {
        BackgroundView_Preview()
        BackgroundView_Preview()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
