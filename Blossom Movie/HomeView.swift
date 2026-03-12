//
//  HomeView.swift
//  Blossom Movie
//
//  Created by Khushneet Singh on 12/03/26.
//

import SwiftUI

struct HomeView: View {
    var heroTextTitle = Constants.testTitleURL
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: heroTextTitle)){ image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            
            HStack {
                Button {
                    
                } label: {
                    Text(Constants.playString)
                        .ghostbutton()
                }
                
                Button {
                    
                } label: {
                    Text(Constants.downloadString)
                        .ghostbutton()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
