//
//  ContentView.swift
//  SwiftUI-Animations
//
//  Created by Bhoopendra Umrao on 05/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State var selectedCategory: Category?
    @Namespace var animation
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Browse")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text("Recommended")
                    .font(.subheadline)
                    .offset(x: /*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/, y: 2)
                Spacer(minLength: 10)
                Menu {
                    Button("Crousol (on)") {
                        
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .rotationEffect(Angle(degrees: -90))
                        .foregroundColor(.gray)
                        .padding()
                }

            }
            .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(Category.sample) { category in
                        CategoryView(category)
                    }
                }
            }
            GeometryReader {
                let size = $0.size
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 35) {
                        ForEach(Book.sample) { book in
                            BookCardView(book: book)
                        }
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 20)
                    .padding(.bottom, bottomPadding(size))
                }
                .coordinateSpace(name: "Books")
            }
            .padding(.top, 15)
        }
    }
    
    private func bottomPadding(_ size: CGSize) -> CGFloat {
        let cardheight: CGFloat = 220
        let scrollViewHeigth: CGFloat = size.height
        return scrollViewHeigth - cardheight - 40
    }
    
    @ViewBuilder
    private func CategoryView(_ category: Category) -> some View {
        Text(category.name)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background {
                if selectedCategory == category {
                    Capsule()
                        .fill(Color(.systemBlue))
                        .matchedGeometryEffect(id: "ActiveCategory", in: animation)
                } else {
                    Capsule()
                        .fill(.gray.opacity(0.2))
                }
            }
            .foregroundColor(.white)
            .cornerRadius(10)
            .onTapGesture {
                withAnimation(.interactiveSpring(response: 0.5,
                                                 dampingFraction: 0.7,
                                                 blendDuration: 0.7)) {
                    selectedCategory = category
                }
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
