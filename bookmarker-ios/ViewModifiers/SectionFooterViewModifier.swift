//
//  SectionFooterViewModifier.swift
//  bookmarker-ios
//
//  Created by Kenneth Ng on 9/27/20.
//

import SwiftUI

struct SectionFooterViewModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(Font.system(.caption))
            .foregroundColor(Color(.tertiaryLabel))
    }
}
