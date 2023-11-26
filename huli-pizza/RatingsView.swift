//
//  RatingView.swift
//  huli-pizza
//
//  Created by Jonetta Pek on 20/11/23.
//

import SwiftUI

struct RatingsView: View {
    var rating: Int
    var body: some View {
        HStack {
            ForEach(1...6, id: \.self) { circle in
                circle <= rating ? Image(systemName: "fork.knife.circle.fill") : Image(systemName: "circle")
            }
            
        }
        
        
    }
}

#Preview {
    RatingsView(rating: 4)
}
