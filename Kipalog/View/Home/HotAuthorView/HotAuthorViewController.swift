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

class HotAuthorViewController: UIViewController, UICollectionViewDelegate {
    private let dataSource = DataSource()
    private let disposeBag = DisposeBag()

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
        let loadedData: Driver<[User]> = Driver.just([
            User(
                id: "6",
                name: "Huy Tran",
                email: "huytran@gmail.com",
                handleName: "huytran",
                avatarUrl: "https://pbs.twimg.com/media/C1OsxXCWgAEy1F_.png"
            ),
            User(
                id: "2",
                name: "Do Xuan Huy",
                email: "huydx@gmail.com",
                handleName: "huydx",
                avatarUrl: "https://orig05.deviantart.net/a1df/f/2011/112/8/f/nyan_cat_gif_by_kodiakpaws-d3emqu1.gif"
            ),
            User(
                id: "3",
                name: "Bui Hong Ha",
                email: "habuihong@gmail.com",
                handleName: "telescreen",
                avatarUrl: "https://avatars.githubusercontent.com/u/181202?v=3"
            ),
            User(
                id: "1",
                name: "Vu Nhat Minh",
                email: "nhatminh179@gmail.com",
                handleName: "orakaro",
                avatarUrl: "https://pbs.twimg.com/profile_images/494654050776780802/hrlxd8Jh.png"
            ),
            User(
                id: "4",
                name: "Viet Nguyen Hoang",
                email: "vietnguyenhoang@gmail.com",
                handleName: "vietnguyen",
                avatarUrl: "https://avatars.githubusercontent.com/u/2935719"
            ),
            User(
                id: "5",
                name: "Hoang Le Van",
                email: "hoanglevan@gmail.com",
                handleName: "hoangchay",
                avatarUrl: "https://pbs.twimg.com/profile_images/378800000054639404/705e424771d095d926406eb6d5dc40b9.jpeg"
            )
        ])
        loadedData
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
        let vc = ProfileViewController.make()
        navigationController?.pushViewController(vc, animated: true)
    }
}
