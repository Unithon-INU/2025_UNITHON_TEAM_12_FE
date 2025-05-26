//
//  ListDetailView.swift
//  Packit
//
//  Created by 이예나 on 5/25/25.
//

import SwiftUI

struct ListDetailView: View {
    var body: some View {
        VStack(spacing:22) {
            
            CategorySelectionView()
            
            MultiBoxView()
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ListDetailView()
}
