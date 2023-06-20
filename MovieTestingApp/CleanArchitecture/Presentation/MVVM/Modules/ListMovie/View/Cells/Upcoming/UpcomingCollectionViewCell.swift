//
//  UpcomingCollectionViewCell.swift
//  MovieTestingApp
//
//  Created by Escurra Colquis on 16/06/23.
//

import UIKit
import Kingfisher

class UpcomingCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var iconMovieImageView: UIImageView!
    
    // MARK: - Properties
    static let nibName = Constants.Cells.upcomingCell
    var iconMovie: MovieResponse? {
        didSet {
            if let icon = iconMovie?.posterPath, let url = URL(string: Constants.Urls.imageURL + icon) {
                iconMovieImageView.contentMode = .scaleAspectFill
                iconMovieImageView?.kf.indicatorType = .activity
                iconMovieImageView?.kf.setImage(
                    with: url,
                    options: [
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage])
            }
            let borderColorViewA = UIColor(named: "borderWhite")
            iconMovieImageView.layer.borderColor = borderColorViewA?.cgColor
            iconMovieImageView.layer.borderWidth = 2.0
            iconMovieImageView.layer.cornerRadius = 20
            iconMovieImageView.layer.masksToBounds = true
        }
    }
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconMovieImageView.kf.cancelDownloadTask()
        iconMovieImageView.kf.setImage(with: URL(string: .empty))
        iconMovieImageView.image = nil
    }
}
