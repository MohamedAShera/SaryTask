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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindAlert(to: viewModel.alertItemRelay)
        setupTableView()
        viewModel.fetchHomeData()
    }
    
}

// MARK: - Private Methods for  setup table view

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
            self.handeltableViewNibs(for: indexPath, and: item)
        })
    }
    
    func handeltableViewNibs(for indexPath: IndexPath, and item: HomeSectionRowItem.Item) -> UITableViewCell {
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
        
        if let banners = try? viewModel.banner.value() {
            headerView.loadData(sliderImage: banners)
            headerView.delegate = self
        }
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: - Banner Action
extension HomeViewController: SliderDelegate {
    func didSelectBannerItem(_ image: HomeRepresentable, didSelectItemAt index: Int) {
        viewModel.showAlert(for: image.bannerLink)
    }
}
