//
//  SliderView.swift
//  Bullseye
//
//  Created by Raul Astete on 12/08/21.
//

import SwiftUI

struct SliderView: View {
    @Binding var sliderValue : Double
    
    var body: some View {
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(text: "Put the bullseye as close as you can to", sliderValue: 50.0)
    }
}
