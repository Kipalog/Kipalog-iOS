//
//  HotAuthorView.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/04.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HotAuthorView: UICollectionReusableView, UICollectionViewDelegate {
    static let identifier = "HotAuthorView"
    private let dataSource = DataSource()
    private let disposeBag = DisposeBag()

    @IBOutlet weak var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(
            UINib(nibName: AuthorCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: AuthorCell.identifier
        )
        setupLayout()
        binding()
    }

    private func setupLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: 1.0, height: 1.0)
            layout.scrollDirection = .horizontal
            layout.minimumLineSpacing = 0.0
        }
    }

    private func binding() {
        let loadedData: Driver<[User]> = Driver.just([
            User(
                id: "6",
                name: "Huy Tran",
                email: "huytran@gmail.com",
                handleName: "huytran",
                avatarUrl: URL(string: "https://pbs.twimg.com/media/C1OsxXCWgAEy1F_.png")
            ),
            User(
                id: "5",
                name: "Hoang Le Van",
                email: "hoanglevan@gmail.com",
                handleName: "hoangchay",
                avatarUrl: URL(string: "https://pbs.twimg.com/profile_images/378800000054639404/705e424771d095d926406eb6d5dc40b9.jpeg")
            ),
            User(
                id: "1",
                name: "Vu Nhat Minh",
                email: "nhatminh179@gmail.com",
                handleName: "orakaro",
                avatarUrl: URL(string: "https://pbs.twimg.com/profile_images/494654050776780802/hrlxd8Jh.png")
            ),
        ])
        loadedData
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension HotAuthorView {
    final private class DataSource: NSObject, RxCollectionViewDataSourceType, UICollectionViewDataSource {
        typealias Element = [User]

        private(set) var authors: [User] = []

        func collectionView(_ collectionView: UICollectionView, observedEvent: Event<Element>) {
            if case .next(let element) = observedEvent {
                authors = element
                collectionView.reloadData()
            }
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return authors.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AuthorCell.identifier, for: indexPath) as! AuthorCell
            cell.author = authors[indexPath.row]
            return cell
        }

    }
}

extension HotAuthorView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 80)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
