//
//  ViewController.swift
//  Test-Assignment-iOS
//
//  Created by Petro on 23.06.2023.
//

import UIKit

final class HomeTableViewController: UITableViewController {
    private var viewModel: HomeTableViewModelProtocol
    private var router: Router
    private var cards: [Card] = []
    var list: [Cards] = []
    
    init(viewModel: HomeTableViewModelProtocol, router: Router) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Home"
        configureNavigationBar()
        viewModel.onListUpdate = { [weak self] cards in
            guard let self else { return }
            self.cards = cards
            self.tableView.reloadData()
        }
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let card = cards[indexPath.row]
        router.showCardScreen(card: card)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as! HomeTableViewCell
        cell.setupModel(cards[indexPath.row])
        return cell
    }
    
    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "plusImage"), style: .done, target: self, action: #selector(onPlusTap))
    }
    
    @objc func onPlusTap() {
        viewModel.onPlusTap()
    }
}
