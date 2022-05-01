//
//  GalleryView.swift
//  Africa
//
//  Created by Gauss on 28/04/2022.
//

import SwiftUI

struct GalleryView: View {
    // MARK: PROPERTIES
    @State private var selectedAnimal: String = "lion"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // SIMPLE GRID DEFINITION
//    let gridLayout: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    // EFFICIENT GRID DEFINITION
    //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    // DYNAMIC GRID LAYOUT
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    // MARK: - FUNCTIONS
    func gridSwitch(){
        withAnimation(.easeIn){
            gridLayout = Array(repeating: GridItem(.flexible()), count: Int(gridColumn))
        }
        
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView (.vertical, showsIndicators: false) {
            // MARK: - IMAGE
            Image(selectedAnimal)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 8)
                )
            // MARK: - SLIDER
            Slider(value: $gridColumn, in: 2...4, step: 1)
                .padding(.horizontal)
                .onChange(of: gridColumn, perform: {value in
                    gridSwitch()
                })
            
            // MARK: - GRID
            VStack (alignment: .center, spacing: 30){
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                    ForEach(animals) { item in
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white, lineWidth: 1)
                            )
                            .onTapGesture {
                                selectedAnimal = item.image
                                hapticImpact.impactOccurred()
                            }
                    }
                }//: GRID
                .onAppear(perform: {
                        gridSwitch()
                })
            }//: VSTACK
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }//: SCROll
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            MotionAnnimationView()
        )
    }
}

// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
