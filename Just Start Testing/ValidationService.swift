//
//  ValidationService.swift
//  Just Start Testing
//
//  Created by Macintosh on 2.03.2022.
//

import Foundation

struct ValidationService{
    func validateUserName(_ userName:String?) throws -> String {
        guard let username = userName else { throw ValidationError.invalidValue }
        guard username.count > 3 else { throw ValidationError.usernameTooShort }
        guard username.count < 20 else { throw ValidationError.usernameTooLong }
        return username
    }
    func validatePassword(_ password:String?) throws -> String {
        guard let password = password else { throw ValidationError.invalidValue }
        guard password.count >= 8 else { throw ValidationError.passwordTooShort }
        guard password.count < 20 else { throw ValidationError.passwordTooLong }
        return password
    }
}
enum ValidationError: LocalizedError {
    case invalidValue
    case passwordTooLong
    case passwordTooShort
    case usernameTooLong
    case usernameTooShort
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have entered an invalid value."
        case .passwordTooLong:
            return "Your password is too long."
        case .passwordTooShort:
            return "Your password is too short."
        case .usernameTooLong:
            return "Your username is too long."
        case .usernameTooShort:
            return "Your username is too short."
        }
    }
}

