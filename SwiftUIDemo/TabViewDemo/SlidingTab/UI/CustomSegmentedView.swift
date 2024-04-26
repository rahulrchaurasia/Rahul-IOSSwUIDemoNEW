//
//  CustomSegmentedView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI

struct CustomSegmentedView: View {
    
    @Binding var selectedSegment: Segment
   // var segments: [Segment]
    var segments = Segment.allCases
    @Namespace var name

    var body: some View {
        
            HStack(spacing: 0) {
                  ForEach(segments, id: \.self) { segment in
                      Button {
                          selectedSegment = segment
                      } label: {
                          VStack {
                              Text(segment.rawValue)
                                  .font(.footnote)
                                  .fontWeight(.medium)
                                  .foregroundColor(selectedSegment == segment ? .green : Color(uiColor: .systemGray))
                              ZStack {
                                  Capsule()
                                      .fill(Color.clear)
                                      .frame(height: 4)
                                  if selectedSegment.rawValue == segment.rawValue {
                                      Capsule()
                                          .fill(Color.green)
                                          .frame(height: 4)
                                          .matchedGeometryEffect(id: "Tab", in: name)
                                  }
                              }
                          }
                      }
                  }
              }
         
    
    }
}


struct CustomSegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        
    
        
        CustomSegmentedView(selectedSegment: .constant(.open), segments: Segment.allCases)
                   .previewLayout(.sizeThatFits)
        
    }
}
