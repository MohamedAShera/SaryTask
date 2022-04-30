//
//  GridCollectionCell.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import UIKit

class GridCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var image: AsyncImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func loadCell(
        with title: String?,
        and imageURL: String?
    ) {
        image.setImage(using: imageURL)
    }

}
