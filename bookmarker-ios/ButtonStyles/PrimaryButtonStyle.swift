//
//  PrimaryButtonStyle.swift
//  bookmarker-ios
//
//  Created by Kenneth Ng on 9/25/20.
//

import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: Constants.cornerRadius, style: .continuous).fill(Color.primary))
            .foregroundColor(Color(.systemBackground))
    }
}