import UIKit

final class ContentProfileView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradientForContentProfileView()
    }
    
    private func configureView() {
        alpha = 0.5
//        alpha = 1
        layer.cornerRadius = 50
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        translatesAutoresizingMaskIntoConstraints = false
    }
}
   

