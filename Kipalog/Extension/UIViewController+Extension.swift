//
//  UIViewController+Extension.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

extension UIViewController {
    func embed(_ childViewController: UIViewController, to parentView: UIView) {
        childViewController.view.frame = parentView.bounds
        parentView.addSubview(childViewController.view)
        addChild(childViewController)
        childViewController.didMove(toParent: self)
    }

    func kickOffViewDidLoad() {
        _ = view
    }
}

extension Reactive where Base: UIViewController {
    private func controlEvent(for selector: Selector) -> ControlEvent<Void> {
        return ControlEvent(events: sentMessage(selector).map { _ in })
    }

    var viewWillAppear: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewWillAppear))
    }

    var viewDidAppear: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewDidAppear))
    }

    var viewWillDisappear: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewWillDisappear))
    }

    var viewDidDisappear: ControlEvent<Void> {
        return controlEvent(for: #selector(UIViewController.viewDidDisappear))
    }
}
