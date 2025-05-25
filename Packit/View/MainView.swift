//
//  MainView.swift
//  Packit
//
//  Created by Bowon Han on 5/20/25.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel = MainViewModel()
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Packit")
                    .font(.system(size: 30))
                    .fontWeight(.heavy)
                    .foregroundStyle(Color.packitPurple)
                
                Spacer()
                
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(Color.packitPurple)
            }.padding([.leading, .trailing], 30)
            
            // MARK: - MainButtonView HStack
            HStack(spacing: 21) {
                Button(action: {}, label: {
                    MainButtonView(
                        title: "짐싸기 계획하기",
                        description: "어떤 짐을 챙길지 함께 \n정해보아요!",
                        highlight: nil,
                        iconName: "bag.fill",
                        iconOffset: CGSize(width: -12, height: -12)
                    )
                })
               
                Button(action: {}, label: {
                    MainButtonView(
                        title: "남은 짐 챙기기",
                        description: "아직 완성되지 않은",
                        highlight: "민지와 부산 짐싸기",
                        iconName: "bag",
                        iconOffset: CGSize(width: -12, height: -12)
                    )
                })
            }
            .frame(height: 120)
            
            // MARK: - "다가오는 여정" View
            HStack {
                Text("다가오는 여정")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(.leading, 40)
                    .padding(.top)
                
                Spacer()
            }

            ZStack(alignment: .bottom) {
                VStack() {
                    HStack(alignment: .center,spacing: 15) {
                        Image(systemName: "pin.fill")
                            .resizable()
                            .frame(width: 12, height: 20)
                            .foregroundStyle(Color.packitPurple)
                        
                        Text("민지와의 제주 여행")
                            .font(.system(size: 18))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("D-1")
                            .font(.system(size: 20))
                            .fontWeight(.thin)
                    }
                    .padding([.leading, .trailing], 15)
                    .padding(.top, 14)
                    
                    Spacer()
                }
                .frame(maxHeight: 200)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.packitPurple,lineWidth: 1)
                        .fill(Color.packitLightPurple)
                )
                .padding([.leading, .trailing], 30)
                
                Button(action: {
                    
                }, label: {
                    Text("민지와의 제주 여행 짐 챙기기 START!")
                        .foregroundStyle(.white)
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                })
                .padding([.leading, .trailing], 30)
                .padding([.top, .bottom], 12)
                .background(
                    RoundedRectangle(cornerRadius: 13)
                        .fill(Color.packitPurple)
                        .shadow(radius: 3)
                )
                .offset(CGSize(width: 0, height: 20))
            }.padding(.bottom, 15)
            
            // MARK: - "짐 챙기기 기록" View
            HStack {
                Text("짐 챙기기 기록")
                    .font(.system(size: 15))
                    .fontWeight(.bold)
                    .padding(.leading, 40)
                    .padding(.top)
                
                Spacer()
            }
            
            /// - NOTE: 짐챙기기 기록 리스트에서 Scrollview 내부 버튼 클릭 시 버벅이는 현상
            VStack {
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top, spacing: 18) {
                        ForEach(viewModel.tripList) { trip in
                            Button(action: {}, label: {
                                PackingListCell(viewModel: PackingListCellViewModel(trip: trip))
                            })
                        }
                    }
                    .padding([.leading, .trailing, .top], 15)
                }
                .scrollIndicators(.hidden)
            
                Button(action: {}, label: {
                    HStack {
                        Spacer()
                        
                        Text("더보기")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(Color.packitPurple)
                        
                        Image(systemName: "greaterthan")
                            .foregroundStyle(Color.packitPurple)
                    }
                    .padding([.trailing, .bottom], 12)
                })
            }
            .overlay {
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.packitPurple,lineWidth: 1)
                    .shadow(radius: 3)
            }
            .padding([.leading, .trailing], 30)
        }
    }
}



