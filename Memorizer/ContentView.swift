//
//  ContentView.swift
//  Memorizer
//
//  Created by Matias Evalte on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
          CardView(isFaceUp: true)
          CardView(isFaceUp: false)
          CardView(isFaceUp: false)
          CardView(isFaceUp: true)
        }
        .padding()
    }
}

struct CardView: View {
  @State var isFaceUp: Bool
  
  var body: some View {
    ZStack {
      let rectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
      if isFaceUp {
        rectangle.foregroundColor(Color.yellow)
        rectangle.strokeBorder(lineWidth: 2)
        Text("🙅🏼‍♂️🙅🏼‍♂️")
          .foregroundColor(Color.orange)
      } else {
        rectangle.foregroundColor(Color.red)
        rectangle.strokeBorder(lineWidth: 2)
      }
    }.foregroundColor(.black)
      .onTapGesture {
        isFaceUp.toggle()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
