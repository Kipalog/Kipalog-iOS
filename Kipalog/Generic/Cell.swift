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
    func embed(content: Content, parent: Parent) {
        self.content = content
        self.parent = parent
        content.view.translatesAutoresizingMaskIntoConstraints = false

        parent.addChild(content)
        contentView.addSubview(content.view)

        NSLayoutConstraint.activate(
            [
                content.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                content.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                content.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                content.view.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            ]
        )

       content.didMove(toParent: parent)
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

    static func deque(from collectionView: UICollectionView, for indexPath: IndexPath, parent: P?) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.embed(content: C.make(), parent: parent!)
        return cell
    }
}
