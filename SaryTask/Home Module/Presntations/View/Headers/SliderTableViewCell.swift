//
//  SliderTableViewCell.swift
//  SaryTask
//
//  Created by mohamed shera on 29/04/2022.
//

import UIKit
import FSPagerView
import CHIPageControl

class SliderTableViewCell: UITableViewCell {
    @IBOutlet weak var slider: FSPagerView!
    @IBOutlet weak var pagger: CHIPageControlJaloro!
    
    var sliderImage = [HomeRepresentable]()
    weak var delegate: SliderDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSlider()
    }
    
    func loadData(sliderImage: [HomeRepresentable]) {
        self.sliderImage = sliderImage
        pagger.numberOfPages = sliderImage.count
        slider.reloadData()
    }
    
    private func setupSlider() {
        self.slider.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
        slider.dataSource = self
        slider.delegate = self
        slider.isInfinite = false
        slider.automaticSlidingInterval = 3.0
        slider.itemSize = CGSize(width: UIScreen.main.bounds.size.width - 50, height: 160)
        slider.interitemSpacing = 8
    }
}

//MARK: -FSPagerViewDelegate

extension SliderTableViewCell: FSPagerViewDelegate {
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        delegate?.didSelectBannerItem(sliderImage[index], didSelectItemAt: index)
    }
}

//MARK: -FSPagerViewDataSource

extension SliderTableViewCell: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        sliderImage.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.cornerRadius = 20
        
        guard !sliderImage.isEmpty else { return cell}
        
        cell.imageView?.sd_setImage(with: URL(string: sliderImage[index].bannerImage), completed: nil)
        cell.imageView?.contentMode = .scaleAspectFill
        pagger.set(progress: index, animated: true)
        
        return cell
    }
}
