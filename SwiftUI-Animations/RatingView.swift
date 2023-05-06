//
//  RatingView.swift
//  SwiftUI-Animations
//
//  Created by Bhoopendra Umrao on 05/05/2023.
//

import SwiftUI

struct RatingView: View {
    let rating: Int
    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: "star.fill")
                    .font(.caption2)
                    .foregroundColor(index <= rating ? .yellow : .gray.opacity(0.5))
            }
            
            Text("(\(rating))")
                .font(.caption2)
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
                .padding(.leading, 5)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: 4)
    }
}
