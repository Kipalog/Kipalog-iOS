//
//  PostViewController.swift
//  Kipalog
//
//  Created by DTVD on 2019/01/05.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

class PostViewController: UIViewController, DependencyInjectable {
    typealias Dependency = Post

    private let disposeBag = DisposeBag()
    private let viewModel: PostViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    required init(dependency: Post) {
        self.viewModel = PostViewModel(dependency: dependency)
        super.init(nibName: PostViewController.className, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not implemented")
    }

    func inject(dependency: Post) {
        viewModel.inject(dependency: dependency)
    }
}
