//
//  ContentView.swift
//  asyncImage
//
//  Created by 최기훈 on 2022/07/05.
//

import SwiftUI


extension Image {

    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    
    func iconModifier() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(maxWidth: 120)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    
    private var imageUrl : String = "https://img.freepik.com/free-vector/character-bee-set_77984-116.jpg"
    
    
    var body: some View{
        // 1 url 넣기
        // 2 크기 정하기
        
        //AsyncImage(url: URL(string: imageUrl), scale: 3.0)
       
        // 3 플레이스 홀더
        
        /*
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            Image(systemName: "photo.circle.fill")
                .iconModifier()
        }
         */
        
        // 4 Phase
        /*
        AsyncImage(url: URL(string: imageUrl)) { phase in
            if let image = phase.image {
            image
                .resizable()
                .scaledToFit()
            }else if phase.error != nil {
                Image(systemName: "ant.circle.fill").iconModifier()
            }else {
                Image(systemName: "ant.circle.fill").iconModifier()
            }
        }
        .padding(40)
         */
        // 5 animation
        
        AsyncImage(url: URL(string: imageUrl), transaction:  Transaction(animation: .spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image.imageModifier()
                    .transition(.move(edge: .bottom))
            case .failure(_):
                Image(systemName: "ant.circle.cill").iconModifier()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifier()
            @unknown default:
                ProgressView()
            }
            
        }
        .padding(40)
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            }
    }
}
