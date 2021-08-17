//
//  TextViews.swift
//  Bullseye
//
//  Created by Raul Astete on 12/08/21.
//

import SwiftUI

struct InstructionTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .foregroundColor(Color("TextColor"))
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}


struct BigNumberTextView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
            .font(.largeTitle)
    }
}


struct SliderTextView : View {
    
    var text: String
    
    var body: some View{
        Text(text)
            .foregroundColor(Color("TextColor"))
            .bold()
            .frame(width: 35.0)
    }
}


struct MainButtonTextView : View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            .font(.title3)
    }
}


struct LabelTextView : View {
    
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.caption)
            .kerning(1.5)
    }
}


struct BodyTextView : View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .font(.subheadline)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct DescriptionTextView : View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
    }
}

struct DateTextView : View {
    
    var text: Date
    
    var body: some View {
        Text(text, style: .time)
            .fontWeight(.bold)
            .font(.title3)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigBoldText : View {
    let text : String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .foregroundColor(Color("TextColor"))
            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            .fontWeight(.black)
    }
}


struct SecondaryButtonTextView : View {
    
    var text: String
    
    var body: some View {
        Text(text.capitalized)
            .fontWeight(.bold)
            .font(.callout)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}


struct TextView_Preview : View {
    
    var body : some View {
        VStack{
            InstructionTextView(text: "Instructions")
            BigNumberTextView(text: "99")
            SliderTextView(text: "1")
            MainButtonTextView(text: "Hit me!")
            LabelTextView(text: "Score")
            BodyTextView(text: "You scored 200 points \n🎉🎉🎉")
            SecondaryButtonTextView(text: "Start new round")
            DescriptionTextView(text: "12")
            DateTextView(text: Date())
            BigBoldText(text: "Leaderboard")
        }
    }
}


struct TextViews_Previews: PreviewProvider {
    
    static var previews: some View {
        TextView_Preview()
        TextView_Preview()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}


