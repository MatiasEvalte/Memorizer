//
//  ContentView.swift
//  Memorizer
//
//  Created by Matias Evalte on 02/01/24.
//

import SwiftUI

struct ContentView: View {
  
  enum Constants {
    static let minValue: Int = 1
    static let imageAdd: String = "rectangle.stack.badge.plus.fill"
    static let imageRemove: String = "rectangle.stack.badge.minus.fill"
  }
  var cardArray: [String] = ["🤾‍♀️", "🏄‍♀️", "🏋️", "⛹️‍♀️", "🤾‍♀️", "🏄‍♀️", "🏋️", "⛹️‍♀️"]
  @State var cardCount: Int = 4
  
  var body: some View {
    VStack {
      cards
      HStack {
        buttonAdd
        Spacer()
        buttonRemove
      }.font(Font.title)
    }.padding()
  }
}

// MARK: - Internal methods

extension ContentView {
  var cards: some View {
    HStack {
      ForEach(0..<cardCount, id: \.self) { index in
        CardView(content: cardArray[index],
                 isFaceUp: false)
      }
    }
  }
  
  var buttonAdd: some View {
    Button {
      if cardCount < cardArray.count {
        cardCount += 1
      }
    } label: {
      Image(systemName: Constants.imageAdd)
    }.foregroundColor(Color.red)
      .imageScale(Image.Scale.large)
  }
  
  var buttonRemove: some View {
    Button {
      if cardCount > Constants.minValue {
        cardCount -= 1
      }
    } label: {
      Image(systemName: Constants.imageRemove)
    }.foregroundColor(Color.red)
      .imageScale(Image.Scale.large)
  }
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool
  
  var body: some View {
    ZStack {
      let rectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
      if isFaceUp {
        rectangle.foregroundColor(Color.yellow)
        rectangle.strokeBorder(lineWidth: 2)
        Text(content)
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
