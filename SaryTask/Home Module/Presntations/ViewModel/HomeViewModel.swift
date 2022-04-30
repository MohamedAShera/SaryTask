//
//  HomeViewModel.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import RxSwift

final class HomeViewModel: HomeViewModelContract {
    private var fetchBannersUseCase: FetchBannerUseCaseContract
    private var fetchHomeListUseCase: FetchHomeListUseCaseContract
    private var homeListFilterUseCase: HomeListFilterUseCaseContract
    
    private(set) var sections: BehaviorSubject<[HomeSectionRowItem]>
    private(set) var banner: BehaviorSubject<[HomeRepresentable]>
    
    init(
        fetchBannersUseCase: FetchBannerUseCaseContract = FetchBannerUseCase(),
        fetchHomeListUseCase: FetchHomeListUseCaseContract = FetchHomeListUseCase(),
        homeListFilterUseCase: HomeListFilterUseCaseContract = HomeListFilterUseCase()
    ) {
        self.sections = .init(value: [])
        self.banner = .init(value: [])
        self.fetchBannersUseCase = fetchBannersUseCase
        self.fetchHomeListUseCase = fetchHomeListUseCase
        self.homeListFilterUseCase = homeListFilterUseCase
        super.init()
    }
}

// MARK: - Output Methods

extension HomeViewModel {
    func getSectionData(for row: Int) -> HomeSectionRowData? {
        guard
            let sectionRowItem = try? sections.value().first,
            let sectionTitleData = sectionRowItem.items[safe: row]
        else {
            return nil
        }
        
        return sectionTitleData
    }
}

// MARK: - Input Methods

extension HomeViewModel {
    func fetchHomeData() {
        let fetchHomeObservable = fetchHomeListUseCase.execute()
        let fetchBannerObservable = fetchBannersUseCase.execute()
        
        Observable.zip(
            fetchBannerObservable,
            fetchHomeObservable
        )
            .subscribe(onNext: { [weak self] bannerResult, homeResult  in
                guard let self = self else { return }
                self.handleOnCompleteFetchingHomeData(using: homeResult)
                self.handleOnCompleteFetchingHomeData(using: bannerResult)
            })
            .disposed(by: disposeBag)
    }
    
    func showAlert(for line: String?) {
        alertItemRelay.accept(.init(message: line))
    }
}

// MARK: - Private Methods

private extension HomeViewModel {
    func handleOnCompleteFetchingHomeData(
        using homeResult: Result<HomeResponse, BaseError>
    ) {
        guard
            case let .success(homeData) = homeResult
        else {
            // present error
            return
        }
        
        let homeList: [HomeRepresentable] = homeListFilterUseCase.execute(from: homeData.result ?? [])
        let sectionItems: [HomeSectionRowData] = homeList.map({.init(smartSubject: $0.rowItems, sectionData: $0)})
        
        sections.onNext([ .init(items: sectionItems) ])
    }
    
    func handleOnCompleteFetchingBannerData(
        using bannerResult: Result<HomeResponse, BaseError>
    ) {
        guard
            case let .success(bannerResponse) = bannerResult
        else {
            // present error
            return
        }
        
        let banners: [HomeRepresentable] = bannerResponse.result ?? []
        banner.onNext(banners)
    }
}
