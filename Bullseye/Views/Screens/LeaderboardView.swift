//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Raul Astete on 14/08/21.
//

import SwiftUI

struct LeaderboardView: View {
    
    @Binding var leaderboardIsShowing : Bool
    
    @Binding var game: Game
    
    var body: some View {
        
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing : 10) {
                HeaderView(leaderboardIsShowing : $leaderboardIsShowing)
                    .padding(.top)
                LabelView()
                ScrollView {
                    VStack(spacing : 10) {
                        let entries = game.getLeaderboardEntries()
                        ForEach(entries.indices) { entryIndex in
                            let entry = entries[entryIndex]
                            RowView(index: entryIndex + 1, points: entry.points, date: entry.date)
                        }
                    }
                }
            }
        }
    }
}

struct RowView: View {
    
    let index : Int
    let points : Int
    let date : Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            DescriptionTextView(text: String(points))
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateTextView(text: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Binding var leaderboardIsShowing : Bool
    
    var body: some View {
        ZStack{
            HStack {
                if verticalSizeClass == .regular && horizontalSizeClass == .compact{
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                } else {
                    BigBoldText(text: "Leaderboard")
                }
            }
            HStack {
                Spacer()
                Button(action: {
                    leaderboardIsShowing = false
                }) {
                    RoundedImageFilledView(systemName: "xmark")
                        .padding(.trailing)
                }
            }
            .padding(.horizontal)
            .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        }
    }
}

struct LabelView: View {
    
    var body: some View {
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength)
            Spacer()
            LabelTextView(text: "Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            LabelTextView(text: "Date")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.horizontal)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static private var leaderboardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game).previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
