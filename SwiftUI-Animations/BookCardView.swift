//
//  BookCardView.swift
//  SwiftUI-Animations
//
//  Created by Bhoopendra Umrao on 05/05/2023.
//

import SwiftUI

struct BookCardView: View {
    let book: Book
    var body: some View {
        GeometryReader {
            let size = $0.size
            let rect = $0.frame(in: .named("Books"))
            
            HStack(spacing: -8) {
                // Book Detail
                VStack(alignment: .leading, spacing: 6) {
                    Text(book.name)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("By \(book.name)")
                        .font(.caption)
                    RatingView(rating: book.rating)
                    Spacer(minLength: 10)
                    HStack {
                        Text("1001")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        Text("Views")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .font(.caption)
                }
                .padding()
                .frame(width: size.width/2, height: size.height * 0.8)
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.08), radius: 8, x: -5, y: -5)
                }
                .zIndex(1)
                // Book Image
                ZStack {
                    Image(book.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width/2, height: size.height)
                        .clipShape(RoundedRectangle(cornerRadius: 10,
                                                    style: .continuous))
                        .shadow(color: .black.opacity(0.1), radius: 8, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.1), radius: 8, x: -5, y: -5)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: size.height)
//            .rotationEffect(.init(degrees: convertOffsettoRotaion(rect)), anchor: .bottom)
            .rotation3DEffect(.init(degrees: convertOffsettoRotaion(rect)), axis: (x: 1, y: 0, z: 0), anchor: .bottom, anchorZ: 0, perspective: 0.8)
        }
        .frame(height: 220)
    }
    
    private func convertOffsettoRotaion(_ rect: CGRect) -> CGFloat {
        let minY = rect.minY - 20
        let progress = minY < 0 ? (minY/(rect.height + 20)) : 0
        let constraindProgress = min(-progress, 1.0)
        return constraindProgress * 90
    }
}

struct BookCardView_Previews: PreviewProvider {
    static var previews: some View {
        BookCardView(book: Book.sample.first!)
    }
}
