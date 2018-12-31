//
//  Cell.swift
//  Kipalog
// 
//  Created by DTVD on 2018-12-31.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

// For CollectionViewCell only
protocol HasViewController: AnyObject {
    associatedtype ContentViewController: UIViewController
    associatedtype ParentViewController: UIViewController
    var contentView: UIView { get }
    var contentViewController: ContentViewController? { get set }
    var parentViewController: ParentViewController? { get set }
}

extension HasViewController where Self: UIView {
    func add(viewController: UIViewController) {
        guard let vc =  viewController as? ContentViewController else { return }
        self.contentViewController = vc
        vc.view.translatesAutoresizingMaskIntoConstraints = false

        parentViewController?.addChild(vc)
        contentView.addSubview(vc.view)

        NSLayoutConstraint.activate(
            [
                vc.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                vc.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                vc.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                vc.view.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            ]
        )

       vc.didMove(toParent: parentViewController)
    }
}

class CollectionViewCell<C: UIViewController, P: UIViewController>: UICollectionViewCell, HasViewController {
    var contentViewController: C?
    var parentViewController: P?

    static var reuseIdentifier: String {
        return C.className
    }

    static func register(to collectionView: UICollectionView) {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    static func deque(from collectionView: UICollectionView, for indexPath: IndexPath, parentViewController: P) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.add(viewController: C.bootstrap())
        return cell
    }
}
