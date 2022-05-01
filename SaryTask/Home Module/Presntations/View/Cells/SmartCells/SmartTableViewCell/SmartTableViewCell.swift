//
//  SmartTableViewCell.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit
import RxSwift
import RxDataSources

class SmartTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleStack: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var disposeBag = DisposeBag()
    var smartSubject = PublishSubject<[HomeRowDataRepresentable]>()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func loadCell(cellData: HomeSectionRowData?) {
        let cellData = cellData?.sectionData
        titleStack.isHidden = cellData?.isTitleHidden ?? false
        titleLabel.text = cellData?.itemTitle
        collectionView.isScrollEnabled = cellData?.homeUIType == .slider
    }
}

// MARK: - Private Methods

private extension SmartTableViewCell {
    typealias CollectionViewdataSource = RxCollectionViewSectionedReloadDataSource
    
    func setupCollectionView() {
        collectionView.registerCellNib(SmartCollectionViewCell.self)
        
        collectionView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        smartSubject
            .asObservable()
            .bind(to: collectionView.rx.items(
                cellIdentifier: SmartCollectionViewCell.classNameWithoutNamespaces,
                cellType: SmartCollectionViewCell.self
            )
            ) { row, data, cell in
                cell.loadCell(with: data.rowTitle, and: data.rowImage)
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UICollectionViewDelegate
extension SmartTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let cellWidth = (width / 4)
        return CGSize(width: cellWidth, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .zero
    }
}
