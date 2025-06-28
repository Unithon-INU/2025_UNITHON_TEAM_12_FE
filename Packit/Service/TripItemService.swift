//
//  TripItemService.swift
//  Packit
//
//  Created by Bowon Han on 6/16/25.
//

import Foundation

protocol TripItemServiceProtocol {
    // MARK: - 여행 짐 추가 API
    func addTripItem(tripCategoryId: Int, body: AddTripItemReqDto) async -> NetworkResult<TripItemResDto>
    
    // MARK: - 카테고리별 여행 아이템 조회 API
    func fetchTripItemWithCategory(tripCategoryId: Int) async -> NetworkResult<APIResDto<[TripItemResDto]>>
    
    // MARK: - 아이템 상태 토글 API
    func toggleItemStatus(tripItemId: Int) async -> NetworkResult<APIResDto<TripItemToggleResDto>>
    
    // MARK: - 여행 짐 리스트 추가 API
    func addTripItems(tripId: Int, tripCategoryId: Int, body: AddTripItemsReqDto) async -> NetworkResult<APIResDto<String?>>
    
    // MARK: - 템플릿 아이템 조회 API
    func fetchTemplateItems(categoryId: Int) async -> NetworkResult<APIResDto<[TemplateItemResDto]>>
    
    // MARK: - 아이템 여러개 삭제하는 API
    func deleteItems(body: DeleteItemsReqDto) async -> NetworkResult<APIResDto<CommonResDto>>
    
    // MARK: - AI로 생성한 템플릿 아이템 조회 API
    func fetchTemplateItemsWithAI(tripCategoryId: Int) async -> NetworkResult<APIResDto<[AIRecommendedItemResponse]>>
}

final class TripItemService: TripItemServiceProtocol {
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol=NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: - 여행 짐 추가 API
    func addTripItem(tripCategoryId: Int, body: AddTripItemReqDto) async -> NetworkResult<TripItemResDto> {
        return await networkService.request(TripItemEndpoint.addTripItem(tripCategoryId: tripCategoryId, body: body))
    }
    
    // MARK: - 카테고리별 여행 아이템 조회 API
    func fetchTripItemWithCategory(tripCategoryId: Int) async -> NetworkResult<APIResDto<[TripItemResDto]>> {
        return await networkService.request(TripItemEndpoint.fetchTripItemWithCategory(TripCategoryId: tripCategoryId))
    }
    
    // MARK: - 아이템 상태 토글 API
    func toggleItemStatus(tripItemId: Int) async -> NetworkResult<APIResDto<TripItemToggleResDto>> {
        return await networkService.request(TripItemEndpoint.toggleItemStatus(tripItemId: tripItemId))
    }
    
    // MARK: - 여행 짐 리스트 추가 API
    func addTripItems(tripId: Int, tripCategoryId: Int, body: AddTripItemsReqDto) async -> NetworkResult<APIResDto<String?>> {
        return await networkService.request(TripItemEndpoint.addTripItems(tripId: tripId, tripCategoryId: tripCategoryId, body: body))
    }
    
    // MARK: - 템플릿 아이템 조회 API
    func fetchTemplateItems(categoryId: Int) async -> NetworkResult<APIResDto<[TemplateItemResDto]>> {
        return await networkService.request(TripItemEndpoint.fetchTemplateItems(categoryId: categoryId))
    }
    
    // MARK: - 아이템 여러개 삭제하는 API
    func deleteItems(body: DeleteItemsReqDto) async -> NetworkResult<APIResDto<CommonResDto>> {
        return await networkService.request(TripItemEndpoint.deleteItems(body: body))
    }
    
    // MARK: - AI로 생성한 템플릿 아이템 조회 API
    func fetchTemplateItemsWithAI(tripCategoryId: Int) async -> NetworkResult<APIResDto<[AIRecommendedItemResponse]>> {
        return await networkService.request(TripItemEndpoint.fetchTemplateItemsWithAI(tripCategoryId: tripCategoryId))
    }
}
