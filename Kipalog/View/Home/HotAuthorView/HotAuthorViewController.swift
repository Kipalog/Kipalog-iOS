//
//  HotAuthorViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/04.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HotAuthorViewController: UIViewController, UICollectionViewDelegate, Reusable {
    private let dataSource = DataSource()
    private let disposeBag = DisposeBag()
    private let api = FeedAPI()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var sectionIcon: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        CollectionViewCell<AuthorCellViewController, HotAuthorViewController>.register(to: collectionView)
        dataSource.set(parent: self)
        setupLayout()
        binding()
    }

    private func setupLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: 70, height: 80)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
        }
    }

    private func binding() {
       api.getTopAuthor()
            .asDriver(onErrorDriveWith: .empty())
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension HotAuthorViewController {
    final private class DataSource: NSObject, RxCollectionViewDataSourceType, UICollectionViewDataSource {
        typealias Element = [User]

        private(set) var authors: [User] = []
        private weak var parent: HotAuthorViewController?

        fileprivate func set(parent: HotAuthorViewController) {
            self.parent = parent
        }

        func collectionView(_ collectionView: UICollectionView, observedEvent: Event<Element>) {
            if case .next(let element) = observedEvent {
                authors = element
                collectionView.reloadData()
                collectionView.collectionViewLayout.invalidateLayout()
            }
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return authors.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = CollectionViewCell<AuthorCellViewController, HotAuthorViewController>.dequeue(from: collectionView, for: indexPath, parent: parent)
            cell.content?.author = authors[indexPath.row]
            return cell
        }

    }
}

extension HotAuthorViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 80)
    }
}

extension HotAuthorViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = dataSource.authors[indexPath.row]
        let vc = ProfileViewController(dependency: user)
        navigationController?.pushViewController(vc, animated: true)
    }
}
