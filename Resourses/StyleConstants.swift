
import UIKit

enum StyleConstants {
    enum Font {
        // GoodDogPlain
        static let largeTitle = UIFont(name: "GoodDogPlain", size: 70)
        static let regularTitle = UIFont(name: "GoodDogPlain", size: 40)
        static let premiumTitle = UIFont(name: "GoodDogPlain", size: 30)
        static let premiumType = UIFont(name: "GoodDogPlain", size: 15)
        
        // Raleway
        static let placeholderTitle = UIFont(name: "Raleway-Regular", size: 13)
        static let buttonTitle = UIFont(name: "Raleway-Medium", size: 17)
        static let segmentPlaceholder = UIFont(name: "Raleway-Medium", size: 16)
        static let registerTextField = UIFont(name: "Raleway-Regular", size: 16)
        static let searchBarPlaceholder = UIFont(name: "Raleway-Regular", size: 14)
        static let titleDescriptionCell = UIFont(name: "Raleway-Regular", size: 12)
        static let storiesTitle = UIFont(name: "Raleway-Regular", size: 10)
        static let titleDescription = UIFont(name: "Raleway-SemiBold", size: 14)
        static let matchedUserName = UIFont(name: "Raleway-SemiBold", size: 38)
        static let matchedUserAge = UIFont(name: "Raleway-Regular", size: 24)
        static let geoInfoUser = UIFont(name: "Raleway-Regular", size: 16)
        static let premiumPermissionTitle = UIFont(name: "Raleway-Medium", size: 16)
        static let nameTitleProfile = UIFont(name: "Raleway-Medium", size: 40)
    }
    enum Colors {
        enum GeneralColors {
            static let lightGray = UIColor(hexString: "##d3d3d3")
            static let authTextFieldBackgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.45)
            static let registerTextFieldBorderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.45).cgColor
            static let searchBarBackground = UIColor(red: 0, green: 0, blue: 0, alpha: 0.19)
            static let searchBarPlaceholderColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
        }
        enum GradientColors {
            static let authGradient = [
                UIColor(hexString: "#915EE6"),
                UIColor(hexString: "#AA4DC8"),
                UIColor(hexString: "#A6A6A6")
            ]
            static let authLabelGradient = [
                UIColor(hexString: "#915EE6").cgColor,
                UIColor(hexString: "#AA4DC8").cgColor,
                UIColor(hexString: "#A6A6A6").cgColor
            ]
            static let basicColors = [
                UIColor(red: 0.545, green: 0.38, blue: 0.922, alpha: 1).cgColor,
                UIColor(red: 0.82, green: 0.196, blue: 0.592, alpha: 1).cgColor
            ]
            static let feedGradient = [
                UIColor(hexString: "#FA00FF"),
                UIColor(hexString: "#889BFF")
            ]
            static let profileGardient = [
                UIColor(red: 0.737, green: 0.392, blue: 0.824, alpha: 1).cgColor,
                UIColor(red: 0.929, green: 0.38, blue: 0.627, alpha: 1).cgColor,
                UIColor(red: 0.937, green: 0.38, blue: 0.616, alpha: 1).cgColor
            ]
            static let contentProfile = [
                UIColor(red: 0.545, green: 0, blue: 0.506, alpha: 1).cgColor,
                UIColor(red: 0.827, green: 0, blue: 0.604, alpha: 1).cgColor,
                UIColor(red: 0.976, green: 0.004, blue: 0.404, alpha: 1).cgColor
            ]
            static let chatGradient = [
                UIColor(hexString: "#DC2E99"),
                UIColor(hexString: "#DE62AF"),
                UIColor(hexString: "#BA64CC")
            ]
        }
        enum TextColor {
            static let titleColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
            static let placeholderColor = UIColor(red: 0.98, green: 0.98, blue: 0.98, alpha: 1)
            static let titleDescriptionColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
}

