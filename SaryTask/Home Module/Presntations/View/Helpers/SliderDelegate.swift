//
//  SliderDelegate.swift
//  SaryTask
//
//  Created by mohamed shera on 30/04/2022.
//

import Foundation

protocol SliderDelegate: NSObject {
    func didSelectBannerItem(_ image: HomeRepresentable, didSelectItemAt index: Int)
}
