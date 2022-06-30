//
//  RowAppInfoView.swift
//  Honeymoon
//
//  Created by Manny Alvarez on 30/06/2022.
//

import SwiftUI

struct RowAppInfoView: View {
    // MARK: - Properties
    var title: String
    var description: String

    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .foregroundColor(.gray)
                Spacer()
                Text(description)
            }//HStack
            Divider()
        }
    }
}


