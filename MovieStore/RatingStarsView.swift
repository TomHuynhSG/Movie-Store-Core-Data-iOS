//
//  RatingStarView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI

struct RatingStarsView: View {
    @Binding var rating: Int
    var starImage = Image (systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var maxRating = 5
    
    var body: some View {
        HStack{
            ForEach(1..<maxRating + 1, id: \.self){ number in
                starImage
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
}

#Preview {
    RatingStarsView(rating: .constant(4))
}

