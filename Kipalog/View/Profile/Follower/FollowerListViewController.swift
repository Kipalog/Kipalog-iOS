//
//  FollowerListViewController.swift
//  Kipalog
//
//  Created by DTVD on 2018/01/22.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class FollowerListViewController: UICollectionViewController {
    private let dataSource = DataSource()
    private let disposeBag = DisposeBag()
    private let viewModel = FollowerListViewModel()

    override var collectionView: UICollectionView! {
        get { return super.collectionView }
        set { super.collectionView = newValue }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            UINib(nibName: FollowerCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: FollowerCell.identifier)
        collectionView.backgroundColor = UIColor.white
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

extension FollowerListViewController {
    final private class DataSource: NSObject, RxCollectionViewDataSourceType, UICollectionViewDataSource {
        typealias Element = FollowerListViewModel.DataSource

        private(set) var users: [User] = []

        func collectionView(_ collectionView: UICollectionView, observedEvent: Event<Element>) {
            if case .next(let element) = observedEvent {
                users = element.users
                collectionView.reloadData()
            }
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return users.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let user = users[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.identifier, for: indexPath) as! FollowerCell
            cell.user = user
            return cell
        }
    }
}
