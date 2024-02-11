import UIKit

extension UIView {
    func applyGradientMajor() {
        let colors = StyleConstants.Colors.GradientColors.basicColors
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.maskedCorners = layer.maskedCorners
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0 }
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyGradientForButton() {
        let colors = StyleConstants.Colors.GradientColors.basicColors
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.maskedCorners = layer.maskedCorners
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0 }
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyGradientForProfileView() {
        let colors = StyleConstants.Colors.GradientColors.profileGardient
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.maskedCorners = layer.maskedCorners
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.locations = [0, 0.87, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyGradientForContentProfileView() {
        let colors = StyleConstants.Colors.GradientColors.contentProfile
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = layer.cornerRadius
        gradientLayer.maskedCorners = layer.maskedCorners
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        gradientLayer.locations = [0, 0.87, 1]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)

        layer.insertSublayer(gradientLayer, at: 0)
    }
}


extension UIView {

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            border(width: newValue, color: borderColor)
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else { return nil }

            return UIColor(cgColor: cgColor)
        }
        set {
            border(width: borderWidth, color: newValue)
        }
    }

    func border(width: CGFloat, color: UIColor?) {
        layer.borderWidth = width
        layer.borderColor = color?.cgColor
    }

    func cornerRadius(_ radius: CGFloat, corners: CACornerMask) {
        clipsToBounds = true
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }

    func shadow(radius: CGFloat = 0,
                offset: CGSize = .zero,
                color: UIColor,
                opacity: Float,
                corners: Corners = .init(),
                masksToBounds: Bool = false) {
        let path = UIBezierPath(shouldRoundRect: bounds, corners: corners)
        // setup shadow
        layer.masksToBounds = masksToBounds

        layer.shadowRadius = radius

        if layer.shadowRadius > 0 {
            // performance improvement depends on the size of view
            layer.shouldRasterize = true
            layer.rasterizationScale = UIScreen.main.scale

            layer.shadowOffset = offset
            layer.shadowColor = color.cgColor
            layer.shadowOpacity = opacity
            layer.shadowPath = path.cgPath
        }
    }

    func addBottomRoundedEdge(desiredCurve: CGFloat = 1) {
        let offset: CGFloat = self.frame.width / desiredCurve
        let bounds: CGRect = self.bounds

        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y,
                                        width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y,
                                        width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
    }

    func addTopRoundedEdge(desiredCurve: CGFloat = 1) {
        let offset: CGFloat = self.frame.width / desiredCurve
        let bounds: CGRect = self.bounds

        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y + bounds.size.height / 2,
                                        width: bounds.size.width, height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y,
                                        width: bounds.size.width + offset, height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        // Create the shape layer and set its path
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        // Set the newly created shape layer as the mask for the view's layer
        self.layer.mask = maskLayer
    }

    func clearConstraints() {
        for subview in subviews {
            subview.clearConstraints()
        }

        removeConstraints(constraints)
    }

    func corners(_ corners: Corners) {
        let path = UIBezierPath(shouldRoundRect: bounds, corners: corners)

        let shape = CAShapeLayer()
        shape.path = path.cgPath

        layer.mask = shape
        layer.masksToBounds = true
    }
}

extension CACornerMask {

    static let topCorners: CACornerMask = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    static let bottomCorners: CACornerMask = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
}

struct Corners {

    private(set) var topLeft: CGFloat = 0
    private(set) var topRight: CGFloat = 0
    private(set) var bottomLeft: CGFloat = 0
    private(set) var bottomRight: CGFloat = 0
}

extension Corners {

    init(radius: CGFloat) {
        topLeft = radius
        topRight = radius
        bottomLeft = radius
        bottomRight = radius
    }
}

fileprivate extension UIBezierPath {

    convenience init(shouldRoundRect: CGRect, corners: Corners) {
        self.init(shouldRoundRect: shouldRoundRect,
                  topLeftRadius: corners.topLeft,
                  topRightRadius: corners.topRight,
                  bottomLeftRadius: corners.bottomLeft,
                  bottomRightRadius: corners.bottomRight)
    }

    convenience init(shouldRoundRect rect: CGRect,
                     topLeftRadius: CGFloat,
                     topRightRadius: CGFloat,
                     bottomLeftRadius: CGFloat,
                     bottomRightRadius: CGFloat) {
        self.init()

        let path = CGMutablePath()

        let topLeft = rect.origin
        let topRight = CGPoint(x: rect.maxX, y: rect.minY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)

        if topLeftRadius != 0 {
            path.move(to: CGPoint(x: topLeft.x + topLeftRadius, y: topLeft.y))
        } else {
            path.move(to: topLeft)
        }

        if topRightRadius != 0 {
            path.addLine(to: CGPoint(x: topRight.x - topRightRadius, y: topRight.y))
            path.addArc(tangent1End: topRight,
                        tangent2End: CGPoint(x: topRight.x, y: topRight.y + topRightRadius),
                        radius: topRightRadius)
        } else {
            path.addLine(to: topRight)
        }

        if bottomRightRadius != 0 {
            path.addLine(to: CGPoint(x: bottomRight.x, y: bottomRight.y - bottomRightRadius))
            path.addArc(tangent1End: bottomRight,
                        tangent2End: CGPoint(x: bottomRight.x - bottomRightRadius, y: bottomRight.y),
                        radius: bottomRightRadius)
        } else {
            path.addLine(to: bottomRight)
        }

        if bottomLeftRadius != 0 {
            path.addLine(to: CGPoint(x: bottomLeft.x + bottomLeftRadius, y: bottomLeft.y))
            path.addArc(tangent1End: bottomLeft,
                        tangent2End: CGPoint(x: bottomLeft.x, y: bottomLeft.y - bottomLeftRadius),
                        radius: bottomLeftRadius)
        } else {
            path.addLine(to: bottomLeft)
        }

        if topLeftRadius != 0 {
            path.addLine(to: CGPoint(x: topLeft.x, y: topLeft.y + topLeftRadius))
            path.addArc(tangent1End: topLeft, tangent2End: CGPoint(x: topLeft.x + topLeftRadius, y: topLeft.y), radius: topLeftRadius)
        } else {
            path.addLine(to: topLeft)
        }

        path.closeSubpath()
        cgPath = path
    }
}

extension UIView {

    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

extension UIView {

    func allSubviews() -> [UIView] {
        var res = self.subviews
        for subview in self.subviews {
            let riz = subview.allSubviews()
            res.append(contentsOf: riz)
        }
        return res
    }
}
