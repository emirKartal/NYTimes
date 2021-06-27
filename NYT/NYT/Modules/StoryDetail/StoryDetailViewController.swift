//
//  StoryDetailViewController.swift
//  NYT
//
//  Created by emir kartal on 27.06.2021.
//

import UIKit

final class StoryDetailViewController: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var viewModel: StoryDetailViewModelProtocol! {
        didSet{
            viewModel.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        viewModel.setStory()
    }
    
    private func configure() {
        self.title = "Story Detail"
    }
    
    @IBAction func seeMoreAct(_ sender: Any) {
    }
    
}

extension StoryDetailViewController: StoryDetailViewModelDelegate {
    func handleStoryDetailViewModelOutput(_ output: StoryDetailViewModelOutput) {
        switch output {
        case .setStoryElements(let storyDetail):
            
            break
        }
    }
    
    func navigate(to router: StoryDetailRouter) {
        
    }
}
