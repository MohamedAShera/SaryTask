//
//  GridTableViewCell.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import UIKit
import RxSwift
import RxDataSources


class GridTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleStack: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
     
    private var disposeBag = DisposeBag()
    var smartSubject = PublishSubject<[HomeRowDataRepresentable]>()
    var numberOfItemPerRow: CGFloat = 1.0
    var numberOfItemInList: CGFloat = 1.0

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func loadCell(cellData: HomeSectionRowData?) {
        let cellData = cellData?.sectionData
        titleStack.isHidden = cellData?.isTitleHidden ?? false
        titleLabel.text = cellData?.itemTitle
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = cellData?.homeUIType == .grid ? .vertical : .horizontal
        }
        numberOfItemInList = CGFloat(cellData?.numberOfItemInList ?? 1)
        customizeCollectionBaseOnHomeUIType(cellData: cellData)
        collectionView.layoutIfNeeded()
    }
    
    private func customizeCollectionBaseOnHomeUIType(cellData: HomeRepresentable?) {
        switch cellData?.homeUIType {
        case .slider, .linear:
            collectionView.isScrollEnabled = true
            numberOfItemPerRow =  CGFloat(cellData?.numberOfRow ?? 1)
            collectionViewHeight.constant = 140
            
        default:
            collectionView.isScrollEnabled = false
            numberOfItemPerRow = CGFloat(cellData?.numberOfRow ?? 1)
            collectionViewHeight.constant = ceil(numberOfItemInList / numberOfItemPerRow) * 140
        }
    }
}

// MARK: - Private Methods

private extension GridTableViewCell {
    typealias CollectionViewdataSource = RxCollectionViewSectionedReloadDataSource

    func setupCollectionView() {
        collectionView.registerCellNib(GridCollectionCell.self)
  
        collectionView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        smartSubject
            .asObservable()
            .bind(to: collectionView.rx.items(
                cellIdentifier: GridCollectionCell.classNameWithoutNamespaces,
                cellType: GridCollectionCell.self
            )
            ) { row, data, cell in
                cell.loadCell(with: data.rowTitle, and: data.rowImage)
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - UICollectionViewDelegate
extension GridTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let cellWidth = (width / numberOfItemPerRow)
        return CGSize(width: cellWidth, height: 140)
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

