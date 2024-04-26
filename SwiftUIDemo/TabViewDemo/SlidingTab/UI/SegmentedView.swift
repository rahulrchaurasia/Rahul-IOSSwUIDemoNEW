//
//  SegmentedView.swift
//  SwiftUIDemo
//
//  Created by Rahul Chaurasia on 02/01/24.
//

import SwiftUI

struct SegmentedView: View {
//    let segments: [String] = ["OPEN", "COMPLETED", "CANCELLED", "ALL"]
//    @State private var selected: String = "OPEN"
    
    @Binding var selectedSegment: String
        var segments: [String]
    @Namespace var name

    var body: some View {
        
            HStack(spacing: 0) {
                  ForEach(segments, id: \.self) { segment in
                      Button {
                          selectedSegment = segment
                      } label: {
                          VStack {
                              Text(segment)
                                  .font(.footnote)
                                  .fontWeight(.medium)
                                  .foregroundColor(selectedSegment == segment ? .green : Color(uiColor: .systemGray))
                              ZStack {
                                  Capsule()
                                      .fill(Color.clear)
                                      .frame(height: 4)
                                  if selectedSegment == segment {
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



struct SegmentedView_Previews: PreviewProvider {
    static var previews: some View {
        let segments: [String] = ["OPEN", "COMPLETED", "CANCELLED", "ALL"]
        SegmentedView(selectedSegment: .constant("OPEN"), segments: segments)
    }
}
