//
//  NavigationCoordinator.swift
//  Packit
//
//  Created by Bowon Han on 6/15/25.
//

import SwiftUI

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
    case start(title: String)
    case checkList(title: String)
}

enum AppRoute: Hashable {
    case plan(PlanFlow)
    case trip(TripFlow)
    case checkList(CheckListFlow)
    
    @ViewBuilder
    func destinationView() -> some View {
        switch self {
        case .plan(let planRoute):
            switch planRoute {
            case .title:
                PlanPackitTitleView()
            case .tripProperty:
                PlanPackitTripPropertyView()
            case .list:
                PlanPackitListView()
            }
            
        case .trip(let tripRoute):
            switch tripRoute {
            case .tripList:
                TripListView()
            case .tripDetail(let title, let tripId):
                TripListDetailView(title: title, tripId: tripId)
            }
            
        case .checkList(let checkListRoute):
            switch checkListRoute {
            case .start(let title):
                StartCheckPackitView(title: title)
            case .checkList(let title):
                CheckPackitListView(title: title)
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

