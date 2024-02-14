
import UIKit

enum AssetConstants {
    enum Image {
        enum Tabs {
            static let main = UIImage(named: "main")?.withRenderingMode(.alwaysTemplate)
            static let match = UIImage(named: "match")?.withRenderingMode(.alwaysTemplate)
            static let premium = UIImage(named: "premium")?.withRenderingMode(.alwaysTemplate)
            static let search = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
            static let profile = UIImage(named: "profile_avatar_ellipse")?.withRenderingMode(.alwaysTemplate)
        }
        enum Common {
            static let backgroundBtn = UIImage(named: "backgroundButtonImage")
            static let backgroundStars = UIImage(named: "back_stars")
            static let backgroundMainStories = UIImage(named: "back_stars")
            static let backgroundEllipse = UIImage(named: "back_ellipse")
            static let searchBarGlass = UIImage(named: "magnifyingGlass")
            static let backgroundCosmo = UIImage(named: "back_cosmo")
            static let backgroundMessage = UIImage(named: "background_message")
        }
    }
   

    
    static let passwordEye = UIImage(systemName: "eye")
    static let passwordHideEye = UIImage(systemName: "eye.slash")
   
}
