//
//  GalleryView.swift
//  Africa
//
//  Created by Gauss on 28/04/2022.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ScrollView {
            Text("Gallery")
        }//: SCROll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnnimationView()
        )
    }
}

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
