//
//  ViewController.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit
import RxCocoa
import RxDataSources

class HomeViewController: BaseViewController {
    
    private var viewModel = HomeViewModel()
    weak var coordinator: TabbarCoordinator?
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .cyan
    }

}

// MARK: - Private Methods

//private extension HomeViewController {
//    typealias TableViewdataSource = RxTableViewSectionedReloadDataSource
//
//    func setupTableView() {
//        tableView.registerCellNib(UITableViewCell.self)
//        if #available(iOS 15.0, *) {
//            tableView.sectionHeaderTopPadding = 0.0
//        }
//
//        tableView
//            .rx
//            .setDelegate(self)
//            .disposed(by: disposeBag)
//
//        let dataSource = createTableViewDataSource()
//        viewModel
//            .sections
//            .bind(to: tableView.rx.items(dataSource: dataSource))
//            .disposed(by: disposeBag)
//    }
//
//    func createTableViewDataSource() -> TableViewdataSource<HomeSectionRowItem> {
//        return TableViewdataSource<HomeSectionRowItem>(configureCell: { dataSource, tableView, indexPath, item -> UITableViewCell in
//
//            let cell: HomeTableViewCell = tableView.dequeue(at: indexPath)
//            cell.setTitle(to: item.movieGroupType.title)
//            item.moviesSubject
//                .bind(to: cell.moviesSubject)
//                .disposed(by: self.disposeBag)
//
//            return cell
//        })
//    }
//}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

extension HomeViewController: UITableViewDelegate {
    
}
