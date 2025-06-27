//
//  UncheckedPopup.swift
//  Packit
//
//  Created by Bowon Han on 6/27/25.
//

import SwiftUI

struct UnCheckedPopup: View {
    @Binding var isPresented: Bool
    
    let onTapDelete: () -> Void
    let onTapNext: () -> Void
    let unCheckedItems: [TripItemResDto]
        
    var body: some View {
        if isPresented {
            ZStack {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .transition(.opacity)
                
                VStack {
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            isPresented = false
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 10, height: 10)
                                .foregroundStyle(.black)
                        })
                    }
                    .padding(.vertical, 20)
                    .padding(.horizontal, 30)
                    
                    HStack(alignment: .bottom, spacing: 50) {
                        Text("잠깐!\n안 챙긴 짐이 있어요!")
                            .font(.custom("Pretendard-Bold", size: 24))
                        
                        Image("popUpBagImage")
                            .resizable()
                            .frame(width: 60, height: 75)
                            .foregroundStyle(Color.packitLightPurple)
                    }
                    .padding(.top, 40)
                    
                    HStack {
                        ScrollView(showsIndicators: false) {
                            UncheckedListView(items: unCheckedItems)
                                .padding(.vertical, 30)
                                .padding(.horizontal, 10)
                        }
                        Spacer()
                    }.padding(.horizontal, 40)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            isPresented = false
                            onTapDelete()
                        }
                    }, label: {
                        PackitButton(title: "안 챙겨도 되는 짐이에요!")
                    })
                    .padding(.horizontal, 20)
                    
                    Button(action: {
                        withAnimation {
                            isPresented = false
                            onTapNext()
                        }
                    }, label: {
                        Text("다음에 챙기고 싶어요!")
                            .font(.custom("Pretendard-Bold", size: 20))
                            .foregroundStyle(Color.packitPurple)
                            .padding(.vertical, 16)
                            .frame(maxWidth: .infinity)
                            .background {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.packitLightPurple)
                            }
                    })
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                }
                .frame(height: UIScreen.main.bounds.height * 2/3)
                .frame(maxWidth: .infinity)
                .background(Color.white.opacity(1))
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .shadow(radius: 5)
                .zIndex(10)
                .frame(maxHeight: .infinity, alignment: .bottom)
                .edgesIgnoringSafeArea(.bottom)
            }
            .animation(.easeOut(duration: 0.3), value: isPresented)
        }
    }
}

struct UncheckedListView: View {
    let items: [TripItemResDto]
        
    var body: some View {
        VStack {
            FlowLayout(spacing: 12, lineSpacing: 12) {
                ForEach(items) { item in
                    Text(item.name)
                        .font(.custom("Pretendard-Bold", size: 15))
                        .foregroundStyle(Color.packitPurple)
                        .padding(.vertical, 9)
                        .padding(.horizontal, 6)
                        .background {
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.packitPurple)
                        }
                }
            }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
