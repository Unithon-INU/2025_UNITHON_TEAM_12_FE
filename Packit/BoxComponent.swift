//
//  BoxComponent.swift
//  Packit
//
//  Created by 이예나 on 5/25/25.
//

import SwiftUI

struct BoxComponent: View {
    let title: String
    let description: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
                HStack(spacing: 16) {
                    Image("packagePlus")
                        .frame(width: 30)
                    
                    
                    VStack(alignment: .leading, spacing: 10){

                    Text(title)
                        .font(.custom("Pretendard", size: 16))
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        
                    Text(description)
                        .font(.custom("Pretendard", size: 14))
                        .fontWeight(.light)
                        .foregroundColor(.black)
                        .lineLimit(1) // 최대 1줄로 제한


                }
                    Spacer()
        }
            .padding(.horizontal, 16)
            .padding(.vertical, 15)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(isSelected ? Color.packitLightPurple : Color.white)
                    .stroke(Color.packitPurple)
            )
            .padding(.vertical, 6)
            .padding(.horizontal, 25)
        }

    }


struct MultiBoxView: View {
    @State private var selectedItems: Set<String> = []
    
    let items = [
            ("클렌징폼", "국내선은 기내에 소지한 후 탑승이 가능합니다."),
            ("선크림", "액체류는 100ml 이하로 제한됩니다."),
            ("치약", "개인 위생용품은 별도 포장이 필요합니다.")
        ]
    
    var body: some View {
        VStack(spacing: 12) {
            ForEach(items, id: \.0) { item in
                BoxComponent (title: item.0,
                              description: item.1,
                              isSelected: selectedItems.contains(item.0),
                              onTap: {
                                 if selectedItems.contains(item.0) {
                                     selectedItems.remove(item.0)
                                 } else {
                                     selectedItems.insert(item.0)
                                 }
                }
                )}
        }
    }
}

// 프리뷰
struct BoxComponent_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MultiBoxView()
        }
    }
}
