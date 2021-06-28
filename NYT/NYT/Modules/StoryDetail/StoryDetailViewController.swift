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
    private var detailUrlString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.setStory()
    }
    
    private func configure(storyDetail: StoryResultModel) {
        self.title = "Story Detail"
        let multimedia = storyDetail.multimedia?.first
        detailImageView.setImageViewWithUrl(urlString: multimedia?.url ?? "")
        titleLabel.text = storyDetail.title
        descriptionLabel.text = storyDetail.abstract
        authorLabel.text = storyDetail.byline
        detailUrlString = storyDetail.url
        calculateConstraints(with: multimedia)
    }
    
    private func calculateConstraints(with multimedia: MultimediaModel?) {
        let height = CGFloat(multimedia?.height ?? 1)
        let width = CGFloat(multimedia?.width ?? 1)
        detailImageView.heightAnchor.constraint(equalTo: detailImageView.widthAnchor, multiplier: height/width).isActive = true
        
    }
    
    @IBAction func seeMoreAct(_ sender: Any) {
        if let _ = detailUrlString {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                self.viewModel.openWebView(urlString: self.detailUrlString!)
            }
        }else {
            //Error message
        }
    }
    
}

extension StoryDetailViewController: StoryDetailViewModelDelegate {
    func handleStoryDetailViewModelOutput(_ output: StoryDetailViewModelOutput) {
        switch output {
        case .setStoryElements(let storyDetail):
            configure(storyDetail: storyDetail)
            break
        }
    }
    
    func navigate(to router: StoryDetailRouter) {
        switch router {
        case .toWebView(let viewModel):
            let webVC = WebviewBuilder.make(viewModel: viewModel)
            webVC.modalPresentationStyle = .overFullScreen
            self.present(webVC, animated: true, completion: nil)
        }
    }
}
