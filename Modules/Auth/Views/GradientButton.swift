

import UIKit

@IBDesignable
final class GradientButton: UIButton {
    
    @IBInspectable var lineWidth:    CGFloat = 1  { didSet { setNeedsLayout() } }
    let borderLayer: CAGradientLayer = {
        let borderLayer = CAGradientLayer()
        borderLayer.type = .axial
        borderLayer.colors = [#colorLiteral(red: 0.6135130525, green: 0.3031745553, blue: 0.9506058097, alpha: 1).cgColor, #colorLiteral(red: 0.9306473136, green: 0.1160953864, blue: 0.8244602084, alpha: 1).cgColor]
        borderLayer.startPoint = CGPoint(x: 0, y: 1)
        borderLayer.endPoint = CGPoint(x: 1, y: 0)
        return borderLayer
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        borderLayer.frame = bounds

        let mask = CAShapeLayer()
        let rect = bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        mask.path = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        mask.lineWidth = lineWidth
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        borderLayer.mask = mask
    }
}

private extension GradientButton {
    func configure() {
        layer.addSublayer(borderLayer)
    }
}
