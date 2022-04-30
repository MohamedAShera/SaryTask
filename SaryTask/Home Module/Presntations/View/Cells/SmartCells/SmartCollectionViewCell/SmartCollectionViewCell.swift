//
//  SmartCollectionViewCell.swift
//  SaryTask
//
//  Created by mohamed shera on 28/04/2022.
//

import UIKit

class SmartCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: AsyncImageView!
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var cellTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    func setupViews() {
        image.cornerRadius = image.bounds.height / 2
        imageContainerView.addShadow()
        imageContainerView.cornerRadius = imageContainerView.bounds.height / 2
    }
    
    func loadCell(
        with title: String?,
        and imageURL: String?
    ) {
        cellTitleLabel.text = title
        image.setImage(using: imageURL)
    }

}
