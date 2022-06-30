//
//  HeaderComponent.swift
//  Honeymoon
//
//  Created by Manny Alvarez on 29/06/2022.
//

import SwiftUI

struct HeaderComponent: View {
    // MARK: - Properties


    // MARK: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(Color.secondary)
                .opacity(0.2)
            
            Image("logo-honeymoon")
                .resizable()
                .scaledToFit()
                .frame(height: 28)
            
        }//VStack
    }
}

// MARK: - Preview
struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderComponent()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
