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
        collectionView.backgroundColor = UIColor.white
        CollectionViewCell<NotificationCellViewController, NotificationsViewController>.register(to: collectionView)
        dataSource.set(parent: self)
        navigationItem.title = "Thông báo"
        setupLayout()
        binding()
    }

    private func setupLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = CGSize(width: UIScreen.main.bounds.size.width, height: 100)
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 0.0
        }
    }

    private func binding() {
        rx.viewWillAppear
            .asSignal(onErrorSignalWith: .empty())
            .emit(onNext: { [appDelegate = UIApplication.shared.delegate as? AppDelegate] _ in
                if let tabBarItems = appDelegate?.rootTabBarController?.tabBar.items {
                    tabBarItems[2].badgeValue = nil
                }
            })
            .disposed(by: disposeBag)

        viewModel.dataSource
            .drive(collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension NotificationsViewController {
    final private class DataSource: NSObject, RxCollectionViewDataSourceType, UICollectionViewDataSource {
        typealias Element = NotificationViewModel.DataSource

        private(set) var notifications: [Notification] = []
        private weak var parent: NotificationsViewController?

        fileprivate func set(parent: NotificationsViewController) {
            self.parent = parent
        }

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
            let cell = CollectionViewCell<NotificationCellViewController, NotificationsViewController>.dequeue(from: collectionView, for: indexPath, parent: parent)
            cell.content?.notification = notification
            return cell
        }
    }
}
