//
//  GeometryAnimatedView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 10/01/25.
//

import SwiftUI

struct GeometryAnimatedView: View {
    @State private var isExpanded = false

    var body: some View {
        VStack {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 25)
                    .frame(
                        width: 150,
                        height: isExpanded ? geometry.size.height * 0.4 : geometry.size.height * 0.2
                    )
                    .foregroundColor(.blue) // Optional for visibility
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
                    .padding(.top, 20) // Add padding to move it away from the top edge
                    .frame(maxWidth: .infinity, alignment: .top) // Center horizontally and align to top
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Expand GeometryReader to fill the screen
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top) // Align VStack content to the top
    }
}

#Preview {
    GeometryAnimatedView()
}
