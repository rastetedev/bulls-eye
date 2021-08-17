//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Raul Astete on 12/08/21.
//

import SwiftUI

struct RoundedImageStrokedView: View {
    
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height:  Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(
                        Color("ButtonStrokeColor"),
                        lineWidth: Constants.General.strokeWidth
                    )
            )
    }
}


struct RoundedImageFilledView: View {
    
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width:  Constants.General.roundedViewLength, height:  Constants.General.roundedViewLength)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}


struct RoundedRectTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.title2)
            .frame(width: Constants.General.roundedRectViewWidth, height: Constants.General.roundedRectViewHeight)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct RoundedTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: Constants.General.roundedViewLength, height: Constants.General.roundedViewLength)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
            )
    }
}


struct RoundedView_Preview : View {
    
    var body: some View {
        VStack(spacing: 10.0){
            RoundedImageStrokedView(systemName: "arrow.counterclockwise")
            RoundedImageFilledView(systemName: "list.dash")
            RoundedRectTextView(text: "999")
            RoundedTextView(text: "1")
        }
    }
}


struct RoundedViews_Previews: PreviewProvider {
    
    static var previews: some View {
        RoundedView_Preview()
        RoundedView_Preview()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
