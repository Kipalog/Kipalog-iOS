//
//  PostViewController.swift
//  Kipalog
//
//  Created by DTVD on 2019/01/05.
//  Copyright © 2019 Kipalog. All rights reserved.
//

import UIKit
import WebKit
import RxSwift
import RxCocoa
import Kingfisher

class PostViewController: UIViewController, DependencyInjectable, WKUIDelegate {
    typealias Dependency = Post

    private let disposeBag = DisposeBag()
    private let viewModel: PostViewModel
    private var webView: WKWebView!
    @IBOutlet private weak var contentView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
    }

    private func setupWebView() {
        let configuration = WKWebViewConfiguration()
        configuration.selectionGranularity = .character
        webView = WKWebView(frame: contentView.frame, configuration: configuration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.uiDelegate = self
        contentView.addSubview(webView)
        NSLayoutConstraint.activate(
            [
                webView.topAnchor.constraint(equalTo: contentView.topAnchor),
                webView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                webView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                webView.rightAnchor.constraint(equalTo: contentView.rightAnchor)
            ]
        )

        if let url = viewModel.url {
            webView.load(URLRequest(url: url))
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
