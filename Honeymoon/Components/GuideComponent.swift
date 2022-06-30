//
//  GuideComponent.swift
//  Honeymoon
//
//  Created by Manny Alvarez on 29/06/2022.
//

import SwiftUI

struct GuideComponent: View {
    // MARK: - Properties
    var title: String
    var subtitle: String
    var description: String
    var icon: String


    // MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(title)
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.pink)
                }//HStack
                Divider()
                    .padding(.bottom, 4)
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }//VStack
        }//HStack
    }
}

// MARK: - Preview
struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title",
                       subtitle: "Swipe right",
                       description: "This is a placeholder sentence. This is a place holder sentence.",
                       icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
