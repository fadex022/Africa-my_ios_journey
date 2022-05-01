//
//  CenterModifier.swift
//  Africa
//
//  Created by Gauss on 01/05/2022.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack{
            Spacer()
            content
            Spacer()
        }
    }
}
