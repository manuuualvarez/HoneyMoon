//
//  AppinfoView.swift
//  Honeymoon
//
//  Created by Manny Alvarez on 30/06/2022.
//

import SwiftUI

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(title: "Application", description: "Honeymoon")
            RowAppInfoView(title: "Compatibily", description: "iPhone, iPad")
            RowAppInfoView(title: "Developer", description: "Manu Alvarez")
            RowAppInfoView(title: "Designer", description: "Manu Alvarez")
            RowAppInfoView(title: "Website", description: "manuelalvarez.io")
            RowAppInfoView(title: "Version", description: "1.0.0")
        }//VStack
    }
}

