//
//  RatingStarView.swift
//  MovieStore
//
//  Created by Tom Huynh on 9/4/22.
//

import SwiftUI

struct RatingStarsView: View {
    @Binding var rating: Int
    
    var label = ""
    var offImage: Image?
    var onImage = Image (systemName: "star.fill")
    
    var offColor = Color.gray
    var onColor = Color.yellow
    
    var maxRating = 5
    
    var body: some View {
        HStack{
            if label.isEmpty == false {
                Text(label)
            }
            
            ForEach(1..<maxRating + 1, id: \.self){ number in
                showStar(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func showStar(for number: Int) -> Image{
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

struct RatingStarView_Previews: PreviewProvider {
    static var previews: some View {
        RatingStarsView(rating: .constant(4))
    }
}
