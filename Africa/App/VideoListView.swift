//
//  VideoListView.swift
//  Africa
//
//  Created by Gauss on 28/04/2022.
//

import SwiftUI

struct VideoListView: View {
    // MARK: - PROPERTIES
    @State private var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List{
                ForEach(videos){item in
                    NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
                        VideoListItemView(video: item)
                            .padding(.vertical, 8)
                    }
                }//: LOOP
            }//: LIST
            .listStyle(InsetGroupedListStyle())
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        videos.shuffle()
                        hapticImpact.impactOccurred() 
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }

                }
            }
//            .navigationBarItems(
//                trailing:
//                    Button(action: {
//                        //
//                    }, label: {
//                        Image(systemName: "arrow.2.squarepath")
//                    })//: BUTTON
//            )
        }//: NAVIGATION
    }
}

// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
