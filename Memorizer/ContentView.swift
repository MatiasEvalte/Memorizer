//
//  ContentView.swift
//  Memorizer
//
//  Created by Matias Evalte on 02/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          CardView()
          CardView()
          CardView()
          CardView()
        }
        .padding()
    }
}

struct CardView: View {
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12)
        .foregroundColor(Color.yellow)
      RoundedRectangle(cornerRadius: 12)
        .strokeBorder(lineWidth: 2)
      Text("🙅🏼‍♂️")
        .foregroundColor(Color.orange)
    }.foregroundColor(.red)
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
