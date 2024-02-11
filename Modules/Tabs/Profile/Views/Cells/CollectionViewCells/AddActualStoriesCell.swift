import UIKit

final class AddActualStoriesCell: UICollectionViewCell {
    
    @UsesAutoLayout
    private var ellipseImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "profile_avatar_ellipse")
        
        return view
    }()
    
    @UsesAutoLayout
    private var plusImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "plus")
        view.tintColor = .white
        
        return view
    }()
    
//    private var viewModel: ActualStoriesCellViewModel?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func bind(_ item: ActualStoriesCellViewModel) -> Self {
//        self.viewModel = item
//
//        return self
//    }
}

private extension AddActualStoriesCell {
    func setupUI() {
        contentView.addSubview(ellipseImage)
        contentView.addSubview(plusImage)

        NSLayoutConstraint.activate([
            ellipseImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            ellipseImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ellipseImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: -5),
            ellipseImage.heightAnchor.constraint(equalTo: ellipseImage.widthAnchor)
        ])
 
        NSLayoutConstraint.activate([
            plusImage.centerXAnchor.constraint(equalTo: ellipseImage.centerXAnchor),
            plusImage.centerYAnchor.constraint(equalTo: ellipseImage.centerYAnchor),
            plusImage.widthAnchor.constraint(equalTo: ellipseImage.widthAnchor, multiplier: 0.5),
            plusImage.heightAnchor.constraint(equalTo: plusImage.widthAnchor)
        ])
    }
}

