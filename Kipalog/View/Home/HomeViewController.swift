//
//  HomeViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/11.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController, TabConvertible {

    let barImageName = "Feed"

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var topPostsButton: UIButton!
    @IBOutlet weak var newPostsButton: UIButton!
    @IBOutlet weak var tilPostsButton: UIButton!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var borderViewOriginX: NSLayoutConstraint!
    @IBOutlet weak var generalScrollView: UIScrollView!
    @IBOutlet weak var topPostsContainer: UIView!
    @IBOutlet weak var newPostsContainer: UIView!
    @IBOutlet weak var tilPostsContainer: UIView!

    typealias Tab = FeedViewController.FeedTab

    private var scrollViews: [Tab: UIScrollView] = [:]
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Kipalog"
        setupEmbeddedContainer()
        binding()
    }

    private func setupEmbeddedContainer() {
        let topPostsViewController = FeedViewController(.top)
        embed(topPostsViewController, to: topPostsContainer)
        scrollViews[.top] = topPostsViewController.collectionView

        let newPostsViewController = FeedViewController(.new)
        embed(newPostsViewController, to: newPostsContainer)
        scrollViews[.new] = newPostsViewController.collectionView

        let tilPostsViewController = FeedViewController(.til)
        embed(tilPostsViewController, to: tilPostsContainer)
        scrollViews[.til] = tilPostsViewController.collectionView
    }

    private func binding() {

        let scrollProgress = generalScrollView.rx.scrollProgress
            .startWith(0.0)
            .asSignal(onErrorSignalWith: .empty())

        let scrolledTab = scrollProgress
            .flatMap{ progress -> Signal<Tab> in
                let tilRange = CGFloat(0.66)...
                let newRange = CGFloat(0.33)...CGFloat(0.66)
                let topRange = ...CGFloat(0.33)
                switch progress {
                    case tilRange:
                        return .just(.til)
                    case newRange:
                        return .just(.new)
                    case topRange:
                        return .just(.top)
                    default:
                        return .empty()
                }
            }
            .distinctUntilChanged()

        scrolledTab
            .emit(onNext: { [weak self] tab in
                guard let self = self else { return }
                for (index, button) in self.buttons.enumerated() {
                    let isSelected = index == tab.rawValue
                    button.isSelected = isSelected
                    button.titleLabel?.font =
                        isSelected ? UIFont.boldSystemFont(ofSize: 12) : UIFont.systemFont(ofSize: 12)
                }
            })
            .disposed(by: disposeBag)

        scrollProgress
            .emit(onNext: { [weak self] progress in
                guard let self = self else { return }
                self.borderViewOriginX.constant = self.generalScrollView.frame.width * progress
            })
            .disposed(by: disposeBag)


        let tappedTab = ControlEvent.merge(
            topPostsButton.rx.tap.map{ _ in Tab.top },
            newPostsButton.rx.tap.map{ _ in Tab.new },
            tilPostsButton.rx.tap.map{ _ in Tab.til }
        )
            .asSignal(onErrorSignalWith: .empty())

        tappedTab
            .flatMap { [weak self] tab -> Signal<CGFloat> in
                guard let self = self else { return .empty() }
                return Signal.just(CGFloat(tab.rawValue) * self.generalScrollView.frame.width)
            }
            .filter { [weak self] offSet in
                guard let self = self else { return false }
                return self.generalScrollView.contentOffset.x != offSet
            }
            .emit(onNext: { [weak self] in
                self?.generalScrollView.setContentOffset(CGPoint(x: $0, y: 0.0), animated: true)
            })
            .disposed(by: disposeBag)

        Signal.merge(scrolledTab, tappedTab)
            .distinctUntilChanged()
            .emit(onNext: { [weak self] tab in
                guard let self = self else { return }
                for view in self.scrollViews {
                    view.value.scrollsToTop = false
                }
                if let view = self.scrollViews[tab] {
                    view.scrollsToTop = true
                }
            })
            .disposed(by: disposeBag)
    }
}

