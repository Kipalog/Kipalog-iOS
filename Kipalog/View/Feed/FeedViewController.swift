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

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: dataSource.cellId)
        binding()
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

        let cellId = "FeedCell"
        private(set) var posts: [Post] = []

        func collectionView(_ collectionView: UICollectionView, observedEvent: Event<Element>) {
            if case .next(let element) = observedEvent {
                posts = element.posts
                collectionView.reloadData()
            }
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return posts.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let post = posts[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! FeedCell
            if let url = post.author.avatarUrl {
                cell.avatar.kf.setImage(
                    with: url,
                    options: [.transition(.fade(0.25))]
                )
            }
            return cell
        }
    }
}
