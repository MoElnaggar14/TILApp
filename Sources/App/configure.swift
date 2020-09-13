import Fluent
import FluentPostgresDriver
import Vapor

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    app.databases.use(try .postgres(url: "postgres://vapor_username:vapor_password@localhost:5432/vapor_database"), as: .psql)
    
    app.migrations.add(CreateAcronym())
    app.logger.logLevel = .debug

    try app.autoMigrate().wait()
    
    // register routes
    try routes(app)
}
