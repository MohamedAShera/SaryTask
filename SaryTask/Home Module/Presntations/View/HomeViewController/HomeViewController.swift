//
//  ViewController.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit
import RxCocoa
import RxDataSources

class HomeViewController: BaseViewController, AlertDisplayerProtocol {
    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = HomeViewModel()
    weak var coordinator: TabbarCoordinator?
    
    private var heightForHeaderInSection: CGFloat {
        160
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindAlert(to: viewModel.alertItemRelay)
        setupTableView()
        viewModel.fetchHomeData()
    }
}

// MARK: - Private Methods

private extension HomeViewController {
    typealias TableViewdataSource = RxTableViewSectionedReloadDataSource
    
    func loadNibs() {
        tableView.registerCellNib(GridTableViewCell.self)
        tableView.registerCellNib(SmartTableViewCell.self)
        tableView.registerCellNib(BannerTableViewCell.self)
    }
    
    func setupTableView() {
        loadNibs()
        tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        let dataSource = createTableViewDataSource()
        viewModel
            .sections
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
    }
    
    func createTableViewDataSource() -> TableViewdataSource<HomeSectionRowItem> {
        return TableViewdataSource<HomeSectionRowItem>(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
            return self.getCell(for: indexPath, and: item)
        })
    }
    
    func getCell(for indexPath: IndexPath, and item: HomeSectionRowItem.Item) -> UITableViewCell {
        let cellData = self.viewModel.getSectionData(for: indexPath.row)
        
        switch cellData?.sectionData.homeDataType {
        case .banner:
            let cell: BannerTableViewCell = tableView.dequeue(at: indexPath)
            cell.loadCell(cellData: self.viewModel.getSectionData(for: indexPath.row))
            item.smartSubject
                .bind(to: cell.smartSubject)
                .disposed(by: self.disposeBag)
            
            return cell
            
        case .group:
            let cell: GridTableViewCell  = tableView.dequeue(at: indexPath)
            cell.loadCell(cellData: cellData)
            item.smartSubject
                .bind(to: cell.smartSubject)
                .disposed(by: self.disposeBag)
            
            return cell
            
        case .smart :
            let cell: SmartTableViewCell = tableView.dequeue(at: indexPath)
            cell.loadCell(cellData: cellData)
            item.smartSubject
                .bind(to: cell.smartSubject)
                .disposed(by: self.disposeBag)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SliderTableViewCell.fromNib()
        
        guard let banners = try? viewModel.banner.value() else { return headerView }
        headerView.loadData(sliderImage: banners)
        headerView.delegate = self
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightForHeaderInSection
    }
}

// MARK: - Banner Action

extension HomeViewController: SliderDelegate {
    func didSelectBannerItem(_ image: HomeRepresentable, didSelectItemAt index: Int) {
        viewModel.showAlert(for: image.bannerLink)
    }
}
