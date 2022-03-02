

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let dummyDatabase = [User(username: "umut", password: "password1")]
    
    private let validation:ValidationService
    init(validation:ValidationService) {
        self.validation = validation
        super.init(nibName:nil, bundle:nil)
    }
    required init?(coder: NSCoder) {
        validation = ValidationService()
        super.init(coder:coder)
    }
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        do {
            let username = try validation.validateUserName(usernameTextField.text)
            let password = try validation.validatePassword(passwordTextField.text)
            
            
            // Login to database...
            if let user = dummyDatabase.first(where: { user in
                user.username == username && user.password == user.password
            }) {
                presentAlert(with: "You successfully logged in as \(user.username)")
                
            } else {
                throw LoginError.invalidCredentials
            }
            
        } catch {
            present(error)
        }
    }
}

extension ViewController {
    
    enum LoginError: LocalizedError {
        case invalidCredentials
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return "Incorrect username or password. Please try again."
            }
        }
    }
}
