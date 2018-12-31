//
//  FeedViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class FeedViewController: UICollectionViewController {
    private let dataSource = DataSource()
    private let disposeBag = DisposeBag()
    private let viewModel = FeedViewModel()

    override var collectionView: UICollectionView! {
        get { return super.collectionView }
        set { super.collectionView = newValue }
    }

    enum Tab: Int {
        case top
        case new
        case til
    }
    private var tab: Tab = .top

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(_ startTab: Tab) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        tab = startTab
        dataSource.set(parent: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionViewCell<FeedCellViewController, FeedViewController>.register(to: collectionView)
        CollectionReusableView<HotAuthorViewController, FeedViewController>.register(to: collectionView, for: .header)

        collectionView.backgroundColor = UIColor.white
        navigationItem.title = "Kipalog"
        setupLayout()
        binding()
    }

    private func setupLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 150)
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0.0
        }
    }

    private func binding() {
        viewModel.dataSource
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

}

extension FeedViewController {
    final private class DataSource: NSObject, RxCollectionViewDataSourceType, UICollectionViewDataSource {
        typealias Element = FeedViewModel.DataSource

        private(set) var posts: [Post] = []
        private weak var parent: FeedViewController?

        fileprivate func set(parent: FeedViewController) {
            self.parent = parent
        }

        func collectionView(_ collectionView: UICollectionView, observedEvent: Event<Element>) {
            if case .next(let element) = observedEvent {
                posts = element.posts
                collectionView.reloadData()
            }
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return posts.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let post = posts[indexPath.row]
            let cell = CollectionViewCell<FeedCellViewController, FeedViewController>.dequeue(from: collectionView, for: indexPath, parent: parent)
            cell.content?.post = post
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            guard indexPath.section == 0 else {
                return UICollectionReusableView()
            }
            return CollectionReusableView<HotAuthorViewController, FeedViewController>.dequeue(from: collectionView, of: .header, for: indexPath, parent: parent)
        }
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.bounds.width
        let height: CGFloat = 120
        if section == 0 && tab == .top {
            return CGSize(width: width, height: height)
        }
        return CGSize.zero
    }
}
