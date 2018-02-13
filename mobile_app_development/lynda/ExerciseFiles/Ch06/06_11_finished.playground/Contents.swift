
import Foundation

struct HttpError: Error {
    let code: Int
    let message: String
}

func simulateHttpGet() throws {
    let httpStatusCode = (arc4random_uniform(5) + 1) * 100
    
    switch httpStatusCode {
    case 100:
        print("Continue")
    case 200:
        print("Success!")
    case 300:
        print("Redirection")
    case 400:
        throw HttpError(code: 400, message: "Bad request")
    case 500:
        throw HttpError(code: 500, message: "Internal server error")
    default:
        break
    }
}

do {
    try simulateHttpGet()
} catch let error as HttpError {
    print("\(error.message) (\(error.code))")
}
