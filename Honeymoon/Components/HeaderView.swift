//
//  HeaderView.swift
//  Honeymoon
//
//  Created by Manny Alvarez on 29/06/2022.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - Properties
    @Binding var showGuide: Bool
    @Binding var showInfoView: Bool
    
    let haptics = UINotificationFeedbackGenerator()
    // MARK: - Body
    var body: some View {
        HStack {
            Button(action: {
                playSound(sound: "sound-click", type: "mp3")
                haptics.notificationOccurred(.success)
                self.showInfoView.toggle()
            }, label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            })//:Button
            .accentColor(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
            Spacer()
            Button(action: {
                haptics.notificationOccurred(.success)
                playSound(sound: "sound-click", type: "mp3")
                showGuide.toggle()
            }, label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            })//:Button
            .accentColor(.primary)
            .sheet(isPresented: $showGuide) {
                GuideView()
            }
        }//HStack
        .padding()
    }
}

// MARK: - Preview
struct HeaderView_Previews: PreviewProvider {
    
    @State static var showGuide: Bool = false
    @State static var showInfoView: Bool = false
    static var previews: some View {
        HeaderView(showGuide: $showGuide, showInfoView: $showInfoView)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
