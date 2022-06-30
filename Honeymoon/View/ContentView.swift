//
//  ContentView.swift
//  Honeymoon
//
//  Created by Manny Alvarez on 29/06/2022.
//

import SwiftUI

struct ContentView: View {
    //    MARK: - Properties
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfoView: Bool = false
    @GestureState private var dragState = DragState.inactive
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    private let dragAreatThreshold: CGFloat = 0.65
    
    //    MARK: - DragState
    enum DragState {
        case inactive
        case pressing
        case draggin(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .draggin(let translation):
                return translation
            }
        }
        
        var isDraggin: Bool {
            switch self {
            case .draggin:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .draggin:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    
    //    MARK: - Card Views
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    
    private func moveCards() {
        cardViews.removeFirst()
        self.lastCardIndex += 1
        
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        
        let newCardView = CardView(honeymoon: honeymoon)
        cardViews.append(newCardView)
    }
    
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    
    //    MARK: - Body
    var body: some View {
        VStack {
            //    MARK: - Header
            HeaderView(showGuide: $showGuide, showInfoView: $showInfoView)
                .opacity(dragState.isDraggin ? 0.0 : 1.0)
                .animation(.default)
            Spacer()
            //    MARK: - Cards
            ZStack {
                ForEach(cardViews) { card in
                    card
                    .zIndex(self.isTopCard(cardView: card) ? 1 : 0)
                    .overlay(
                        //Symbols
                        ZStack {
                            Image(systemName: "x.circle")
                                .modifier(SymbolsModifier())
                                .opacity(self.dragState.translation.width <  -self.dragAreatThreshold && self.isTopCard(cardView: card) ? 1.0 : 0.0)
                            Image(systemName: "heart.circle")
                                .modifier(SymbolsModifier())
                                .opacity(self.dragState.translation.width >  self.dragAreatThreshold && self.isTopCard(cardView: card) ? 1.0 : 0.0)
                            
                        }//ZStack
                    )
                    .offset(x: self.isTopCard(cardView: card) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: card) ? self.dragState.translation.height : 0)
                    .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                    .scaleEffect(self.dragState.isDraggin && self.isTopCard(cardView: card) ? 0.85 : 1.0)
                    .rotationEffect(Angle(degrees: self.isTopCard(cardView: card) ? Double(self.dragState.translation.width / 12) : 0))
                    .gesture(
                        LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: {(value, state, transaction) in
                            switch value {
                            case .first(true):
                                state = .pressing
                            case .second(true, let drag):
                                state = .draggin(translation: drag?.translation ?? .zero)
                            default:
                                break
                            }
                        })
                            .onChanged({(value) in
                                guard case .second(true, let drag?) = value else {
                                    return
                                }
                                
                                if drag.translation.width < -self.dragAreatThreshold {
                                    self.cardRemovalTransition = .leadingBottom
                                }
                                
                                if drag.translation.width > self.dragAreatThreshold {
                                    self.cardRemovalTransition = .trailingBottom
                                }
                            })
                            .onEnded({ (value) in
                                guard case .second(true, let drag?) = value else {
                                    return
                                }
                                
                                if drag.translation.width < -self.dragAreatThreshold || drag.translation.width > self.dragAreatThreshold {
                                    playSound(sound: "sound-rise", type: "mp3")
                                    self.moveCards()
                                }
                            })
                    ).transition(self.cardRemovalTransition)
                }
            }//ZStacks
            .padding(.horizontal)
            
            Spacer()
            //    MARK: - Footers
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDraggin ? 0.0 : 1.0)
                .animation(.default)
        }//VStack
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Success"),
                  message: Text("Whising a lovely and most precious of the times together for the amazing couple."),
                  dismissButton: .default(Text("Happy HoneyMoon!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
