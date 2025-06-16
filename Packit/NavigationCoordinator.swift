//
//  NavigationCoordinator.swift
//  Packit
//
//  Created by Bowon Han on 6/15/25.
//

import SwiftUI

// MARK: - 인증 화면 전환 Flow
enum AuthFlow: Hashable {
    case login
    case join
}

// MARK: - 계획 화면 전환 Flow
enum PlanFlow: Hashable {
    case title
    case tripProperty
    case list
}

// MARK: - 여행 리스트 화면 전환 Flow
enum TripFlow: Hashable {
    case tripList
    case tripDetail(title: String, tripId: Int)
}

// MARK: - 짐 체크리스트 화면 전환 Flow
enum CheckListFlow: Hashable {
    case start(title: String, tripId: Int)
    case checkList(title: String, tripId: Int)
}

enum AppRoute: Hashable {
    case auth(AuthFlow)
    case plan(PlanFlow)
    case trip(TripFlow)
    case checkList(CheckListFlow)
    
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .auth(let authRoute):
            switch authRoute {
            case .login:
                LoginView()
                    .navigationBarBackButtonHidden(true)
            case .join:
                JoinView()
                    .navigationBarBackButtonHidden(true)
            }
            
        case .plan(let planRoute):
            switch planRoute {
            case .title:
                PlanPackitTitleView()
                    .navigationBarBackButtonHidden(true)
            case .tripProperty:
                PlanPackitTripPropertyView()
                    .navigationBarBackButtonHidden(true)
            case .list:
                PlanPackitListView()
                    .navigationBarBackButtonHidden(true)
            }
            
        case .trip(let tripRoute):
            switch tripRoute {
            case .tripList:
                TripListView()
                    .navigationBarBackButtonHidden(true)
            case .tripDetail(let title, let tripId):
                TripListDetailView(title: title, tripId: tripId)
                    .navigationBarBackButtonHidden(true)
            }
            
        case .checkList(let checkListRoute):
            switch checkListRoute {
            case .start(let title, let tripId):
                StartCheckPackitView(title: title, tripId: tripId)
                    .navigationBarBackButtonHidden(true)
            case .checkList(let title, let tripId):
                CheckPackitListView(title: title, tripId: tripId)
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    @Published var formViewModel = PlanPackitFormViewModel()

    func push(_ route: AppRoute) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func popToRoot() {
        path = NavigationPath()
    }
}

