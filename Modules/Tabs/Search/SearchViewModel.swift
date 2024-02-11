import UIKit

struct SearchViewModel {
    let postImage: String?
    
    init(postImage: String) {
        self.postImage = postImage
    }
}


extension SearchViewModel {
    static func mockArray() -> [SearchViewModel] {
        var result: [SearchViewModel] = []
        
        let a = SearchViewModel(postImage: "yellow")
        let b = SearchViewModel(postImage: "cat")
        let c = SearchViewModel(postImage: "yellow")
        let d = SearchViewModel(postImage: "young-fashionable-man-in-the-shadows")
        let f = SearchViewModel(postImage: "cat")
        let q = SearchViewModel(postImage: "young-fashionable-man-in-the-shadows")
        let w = SearchViewModel(postImage: "cat")
        let e = SearchViewModel(postImage: "young-fashionable-man-in-the-shadows")
        let r = SearchViewModel(postImage: "cat")
        let t = SearchViewModel(postImage: "yellow")
        let y = SearchViewModel(postImage: "cat")
        let u = SearchViewModel(postImage: "young-fashionable-man-in-the-shadows")
        
        result.append(a)
        result.append(b)
        result.append(c)
        result.append(d)
        result.append(f)
        result.append(q)
        result.append(w)
        result.append(e)
        result.append(r)
        result.append(t)
        result.append(y)
        result.append(u)
        
        result.append(a)
        result.append(b)
        result.append(c)
        result.append(d)
        result.append(f)
        result.append(q)
        result.append(w)
        result.append(e)
        result.append(r)
        result.append(t)
        result.append(y)
        result.append(u)
        result.append(a)
        result.append(b)
        result.append(c)
        result.append(d)
        result.append(f)
        result.append(q)
        result.append(w)
        result.append(e)
        result.append(r)
        result.append(t)
        result.append(y)
        result.append(u)
        
        return result
    }
}
