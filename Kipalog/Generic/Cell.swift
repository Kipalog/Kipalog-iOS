//
//  Cell.swift
//  Kipalog
// 
//  Created by DTVD on 2018-12-31.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

// For CollectionViewCell only
protocol UIComponent: class {
    associatedtype Content: UIViewController
    associatedtype Parent: UIViewController
    var contentView: UIView { get }
    var content: Content? { get set }
    var parent: Parent? { get set }
}

extension UIComponent {
    func embed(viewController: UIViewController) {
        guard let vc =  viewController as? Content else { return }
        self.content = vc
        vc.view.translatesAutoresizingMaskIntoConstraints = false

        parent?.addChild(vc)
        contentView.addSubview(vc.view)

        NSLayoutConstraint.activate(
            [
                vc.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                vc.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                vc.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                vc.view.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            ]
        )

       vc.didMove(toParent: parent)
    }
}

class CollectionViewCell<C: UIViewController, P: UIViewController>: UICollectionViewCell, UIComponent {
    var content: C?
    var parent: P?

    static var reuseIdentifier: String {
        return C.className
    }

    static func register(to collectionView: UICollectionView) {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    static func deque(from collectionView: UICollectionView, for indexPath: IndexPath, parent: P) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.embed(viewController: C.bootstrap())
        return cell
    }
}
