//
//  MapView.swift
//  Africa
//
//  Created by Gauss on 28/04/2022.
//

import SwiftUI
import MapKit

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [Location] = Bundle.main.decode("locations.json")
    
    // MARK: - BODY
    var body: some View {
        // MARK: - basic map
//        Map(coordinateRegion: $region)
        
        // MARK: - advanced map
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            // MapMarker(coordinate: item.location, tint: .accentColor) (static)
            
            // CUSTOM MAKER ANNOTATION
            
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 32, height: 32)
//            }
            
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack{
                        Text("Latitude")
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }//: HSTACK
                    
                    Divider()
                    
                    HStack{
                        Text("Longitude")
                            .font(.footnote)
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .fontWeight(.bold)
                    }//: HSTACK
                }
            }//: HSTACK
                .padding(.vertical, 12)
                .padding(.horizontal, 14)
                .background(
                    Color.black
                        .opacity(0.6)
                        .cornerRadius(9)
                )
                .padding()
            , alignment: .top
        )
            
    }
}

// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
