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
      ScrollView {
        cards
      }
      Spacer()
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
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
      ForEach(0..<cardCount, id: \.self) { index in
        CardView(content: cardArray[index],
                 isFaceUp: true)
      }.aspectRatio(2/3, contentMode: ContentMode.fit)
    }
  }
  
  var buttonAdd: some View {
    Button {
      cardCount += 1
    } label: {
      Image(systemName: Constants.imageAdd)
    }.foregroundColor(Color.red)
      .imageScale(Image.Scale.large)
      .disabled(cardCount == cardArray.count)
  }
  
  var buttonRemove: some View {
    Button {
      cardCount -= 1
    } label: {
      Image(systemName: Constants.imageRemove)
    }.foregroundColor(Color.red)
      .imageScale(Image.Scale.large)
      .disabled(cardCount == Constants.minValue)
  }
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool
  
  var body: some View {
    ZStack {
      let rectangle: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
      Group {
        rectangle.fill(isFaceUp ? Color.red : Color.green)
        rectangle.strokeBorder(lineWidth: 2)
        Text(content).font(Font.largeTitle)
          .opacity(isFaceUp ? 1 : 0)
      }
    }.onTapGesture {
      isFaceUp.toggle()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
