//
//  Cell.swift
//  Kipalog
// 
//  Created by DTVD on 2018-12-31.
//  Copyright © 2018 Kipalog. All rights reserved.
//

import UIKit

protocol UIComponent: class {
    associatedtype Content: UIViewController
    associatedtype Parent: UIViewController
    var contentView: UIView { get }
    var content: Content? { get set }
    var parent: Parent? { get set }
}

extension UIComponent where Self: UIView {
    func embed(content: Content, parent: Parent) {
        self.content = content
        self.parent = parent
        content.view.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(content.view)
        if superview == nil {
            content.willMove(toParent: parent)
        } else {
            parent.addChild(content)
        }

        NSLayoutConstraint.activate(
            [
                content.view.topAnchor.constraint(equalTo: contentView.topAnchor),
                content.view.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                content.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                content.view.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            ]
        )

        if superview == nil {
            content.removeFromParent()
        } else {
            content.didMove(toParent: parent)
        }
    }
}

class CollectionViewCell<C: UIViewController, P: UIViewController>: UICollectionViewCell, UIComponent {
    var content: C?
    weak var parent: P?

    static var reuseIdentifier: String {
        return C.className
    }

    static func register(to collectionView: UICollectionView) {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }

    static func dequeue(from collectionView: UICollectionView, for indexPath: IndexPath, parent: P?) -> CollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        if cell.content == nil {
            cell.embed(content: C.make(), parent: parent!)
        }
        return cell
    }
}

enum CollectionViewSupplementaryKind {
    case header
    case footer

    var rawValue: String {
        switch self {
        case .header: return UICollectionView.elementKindSectionHeader
        case .footer: return UICollectionView.elementKindSectionFooter
        }
    }
}

class CollectionReusableView<C: UIViewController, P: UIViewController>: UICollectionReusableView, UIComponent {
    var content: C?
    weak var parent: P?
    var contentView: UIView {
        return self
    }

    static var reuseIdentifier: String {
        return C.className
    }

    static func register(to collectionView: UICollectionView, for kind: CollectionViewSupplementaryKind) {
        collectionView.register(CollectionReusableView.self, forSupplementaryViewOfKind: kind.rawValue, withReuseIdentifier: reuseIdentifier)
    }

    static func dequeue(from collectionView: UICollectionView, of kind: CollectionViewSupplementaryKind, for indexPath: IndexPath, parent: P?) -> CollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind.rawValue, withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionReusableView
        if cell.content == nil {
            cell.embed(content: C.make(), parent: parent!)
        }
        return cell
    }
}
