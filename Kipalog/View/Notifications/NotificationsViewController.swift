//
//  NotificationsViewController.swift
//  Kipalog
//
//  Created by DTVD on 2017/12/22.
//  Copyright © 2017 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NotificationsViewController: UICollectionViewController, TabConvertible {
    let barImageName = "Notifications"
    private let dataSource = DataSource()
    private let disposeBag = DisposeBag()
    private let viewModel = NotificationViewModel()

    override var collectionView: UICollectionView! {
        get { return super.collectionView }
        set { super.collectionView = newValue }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(
            UINib(nibName: NotificationCell.identifier, bundle: nil),
            forCellWithReuseIdentifier: NotificationCell.identifier
        )
        if let tabBarItems = AppDelegate.rootTabBarController?.tabBar.items {
            tabBarItems[2].badgeValue = "3"
        }
        collectionView.backgroundColor = UIColor.white
        navigationItem.title = "Thông báo"
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

extension NotificationsViewController {
    final private class DataSource: NSObject, RxCollectionViewDataSourceType, UICollectionViewDataSource {
        typealias Element = NotificationViewModel.DataSource

        private(set) var notifications: [Notification] = []

        func collectionView(_ collectionView: UICollectionView, observedEvent: Event<Element>) {
            if case .next(let element) = observedEvent {
                notifications = element.notifications
                collectionView.reloadData()
            }
        }

        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return notifications.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let notification = notifications[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NotificationCell.identifier, for: indexPath) as! NotificationCell
            cell.notification = notification
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
