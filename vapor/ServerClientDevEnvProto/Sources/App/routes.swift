import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Just to make it more interesting when playing with the Health Check API
    // return one of these responses randomly.
    let responses = [HTTPResponseStatus.ok, HTTPResponseStatus.insufficientStorage, HTTPResponseStatus.internalServerError]
    
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("health") { req -> HTTPResponse in
        return HTTPResponse(status: responses.randomElement()!)
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
