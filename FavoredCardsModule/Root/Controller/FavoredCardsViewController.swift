//
//  RecommendedCardsViewController.swift
//  RecommendedCardsModule
//
//  Created by matheus.filipe.bispo on 06/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//
import Entities

public protocol FavoredCardsDelegate: class {
    func didTapCard(card: Card)
}

public class FavoredCardsViewController: UIViewController {
    var presenter: FavoredCardsPresenterProtocol
    let mainView = RecommendedCardsView()
    let semaphore = DispatchSemaphore(value: 0)

    public weak var delegate: FavoredCardsDelegate?

    init(presenter: FavoredCardsPresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        self.view = self.mainView
        self.mainView.delegate = self
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        self.bringData()
    }

    private func bringData() {
        self.mainView.loadingIndicator.startAnimating()
        
    }

    @objc func retryButtonAction(sender: UIButton!) {
        self.bringData()
        self.mainView.errorState.errorView.isUserInteractionEnabled = false
        self.mainView.errorState.errorView.isHidden = true
    }

    func apply(viewModel: RecommendedCardsViewModel) {
        self.mainView.viewModel = viewModel
    }
}

extension FavoredCardsViewController: RecommendedCardsViewDelegate {
    func didScroll(_ scrollView: UIScrollView) {}

    func didTap(card: Card) {
        self.delegate?.didTapCard(card: card)
    }
}
