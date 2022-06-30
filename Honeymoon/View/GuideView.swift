//
//  GuideView.swift
//  Honeymoon
//
//  Created by Manny Alvarez on 29/06/2022.
//

import SwiftUI

struct GuideView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode

    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick the perfect destination for your romantic Honeymoon!")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    GuideComponent(title: "Like",
                                   subtitle: "Swipe right",
                                   description: "Do you like this destination? Touch the screen and swipe right. It will be saved to the favourites.",
                                   icon: "heart.circle")
                    
                    GuideComponent(title: "Dismiss",
                                   subtitle: "Swipe left",
                                   description: "Would you rather skip this place? Touch the screen and swipe left. You will no longer see it.",
                                   icon: "xmark.circle")
                    
                    GuideComponent(title: "Book",
                                   subtitle: "Tap the button",
                                   description: "Our selection of honeymoon resort is perfect setting for you to embark your new life together.",
                                   icon: "checkmark.square")
                    
                }//VStack
                
                Spacer(minLength: 10)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Continue".uppercased())
                        .modifier(CTAButtonAvailable())
                })//:Button
                
            }//VStack
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }//ScrollView
    }
}

// MARK: - Preview
struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
