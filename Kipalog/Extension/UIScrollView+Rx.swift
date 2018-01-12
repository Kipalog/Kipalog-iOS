//
//  UIScrollView+Rx.swift
//  Kipalog
// 
//  Created by DTVD on 2018/01/11.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base:UIScrollView {

    var scrollProgress: Observable<CGFloat> {
        let contentSize = observe(CGSize.self, "contentSize")
            .map { $0 ?? CGSize.zero }
            .startWith(base.contentSize)

        return Observable
            .combineLatest(contentSize, contentOffset) { size, offset -> CGFloat in
            return size.width > 0.0 ? offset.x / size.width : 0.0
        }
    }

}
