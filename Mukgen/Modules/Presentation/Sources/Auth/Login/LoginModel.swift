import SnapKit
import MukgenKit

class LoginModel {
    
    var id = ""
    var password = ""
    
    convenience init(id: String, password: String) {
        self.init()
        self.id = id
        self.password = password
    }
}

