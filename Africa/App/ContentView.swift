//
//  ContentView.swift
//  Africa
//
//  Created by Gauss on 28/04/2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    
    // MARK: - FUNCTIONS
    func gridSwitch(){
        
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        // TOOLBAR IMAGE
        switch gridColumn{
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
        
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView{
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals){ animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }//: LINK
                        }//: LOOP
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                }//: NAVLINK
                            }//: LOOP
                        }//: GRID
                        .padding(10)
                        .animation(.easeIn, value: gridColumn)
                    }//: SCROLL
                }//: CONDITION
            }//: GROUP
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack(alignment: .center, spacing: 16) {
                        // LIST BUTTON
                        Button {
                            isGridViewActive = false
                            hapticImpact.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .foregroundColor(isGridViewActive ? Color.primary : Color.accentColor)
                                .font(.title2)
                        }
                        
                        // GRID BUTTON
                        Button {
                            isGridViewActive = true
                            hapticImpact.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolBarIcon)
                                .foregroundColor(isGridViewActive ? Color.accentColor : Color.primary)
                                .font(.title2)
                        }

                    }//: HSTACK
                }
            }//: TOOLBAR
        }//: LIST
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
