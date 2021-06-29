//
//  ViewController.swift
//  NYT
//
//  Created by emir kartal on 25.06.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    private var storyList: [StoryResultModel] = []
    var viewModel: HomeViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getStories()
    }
    
    private func configure() {
        self.title = "New York Times"
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeTableViewCell
        let story = storyList[indexPath.row]
        let cellViewModel = HomeCellViewModel(storyModel: story)
        cell.populateCell(with: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStory = storyList[indexPath.row]
        viewModel.selectStory(story: selectedStory)
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func handleHomeViewModelOutput(_ output: HomeViewModelOutput) {
        switch output {
        case .isLoading(let isLoading):
            isLoading ? Spinner.start() :Spinner.stop()
            break
        case .showStories(let storyList):
            self.storyList = storyList
            homeTableView.reloadData()
            break
        case .showError(let errorMessage):
            showErrorAlert(errorMessage: errorMessage)
            break
        }
    }
    
    func navigate(to route: HomeRouter) {
        switch route {
        case .toStoryDetail(let viewModel):
            let storyDetailVC = StoryDetailBuilder.make(viewModel: viewModel)
            self.navigationController?.pushViewController(storyDetailVC, animated: true)
        }
    }
}
