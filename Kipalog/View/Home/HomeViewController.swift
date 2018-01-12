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

    enum Tab: Int {
        case top
        case new
        case til
    }
    private var scrollViews: [Tab: UIScrollView] = [:]
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Kipalog"
        setupEmbeddedContainer()
        binding()
    }

    private func setupEmbeddedContainer() {
        let topPostsViewController = FeedViewController(collectionViewLayout: UICollectionViewFlowLayout())
        embed(topPostsViewController, to: topPostsContainer)
        scrollViews[.top] = topPostsViewController.collectionView

        let newPostsViewController = FeedViewController(collectionViewLayout: UICollectionViewFlowLayout())
        embed(newPostsViewController, to: newPostsContainer)
        scrollViews[.top] = newPostsViewController.collectionView

        let tilPostsViewController = FeedViewController(collectionViewLayout: UICollectionViewFlowLayout())
        embed(tilPostsViewController, to: tilPostsContainer)
        scrollViews[.top] = tilPostsViewController.collectionView
    }

    private func binding() {

        let scrollProgress = generalScrollView.rx.scrollProgress
            .startWith(0.0)
            .asSignal(onErrorSignalWith: .empty())

        let selectedTab = scrollProgress
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

        selectedTab
            .emit(onNext: { [unowned self] tab in
                for (index, button) in self.buttons.enumerated() {
                    let isSelected = index == tab.rawValue
                    button.isSelected = isSelected
                    button.titleLabel?.font =
                        isSelected ? UIFont.boldSystemFont(ofSize: 12) : UIFont.systemFont(ofSize: 12)
                }
            })
            .disposed(by: disposeBag)

        scrollProgress
            .emit(onNext: { [unowned self] progress in
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
            .map { [unowned self] in CGFloat($0.rawValue) * self.generalScrollView.frame.width }
            .filter { [unowned self] in self.generalScrollView.contentOffset.x != $0 }
            .emit(onNext: { [unowned self] in self.generalScrollView.setContentOffset(CGPoint(x: $0, y: 0.0), animated: true)})
            .disposed(by: disposeBag)
    }
}

