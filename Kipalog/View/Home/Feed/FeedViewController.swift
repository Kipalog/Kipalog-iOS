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

class FeedViewController: UICollectionViewController, TabConvertible {
    let barImageName = "Feed"
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

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    init(_ tab: Tab) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            UINib(nibName: FeedCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: FeedCell.identifier
        )
        collectionView.register(
            UINib(nibName: HotAuthorView.identifier, bundle: nil),
            forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
            withReuseIdentifier: HotAuthorView.identifier
        )

        collectionView.backgroundColor = UIColor.white
        navigationItem.title = "Kipalog"
        setupLayout()
        binding()
    }

    private func setupLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: 1.0, height: 1.0)
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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedCell.identifier, for: indexPath) as! FeedCell
            cell.post = post
            return cell
        }

        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            guard indexPath.section == 0,
                  kind == UICollectionElementKindSectionHeader,
                  let hotAuthorHeader = collectionView.dequeueReusableSupplementaryView(
                      ofKind: UICollectionElementKindSectionHeader,
                      withReuseIdentifier: HotAuthorView.identifier,
                      for: indexPath
                  ) as? HotAuthorView
            else {
                return UICollectionReusableView()
            }

            return hotAuthorHeader
        }
    }
}

extension FeedViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = view.bounds.width
        let height: CGFloat
        switch section {
        case 0:
            height = 110
        default:
            height = 0
        }
        return CGSize(width: width, height: height)
    }
}
