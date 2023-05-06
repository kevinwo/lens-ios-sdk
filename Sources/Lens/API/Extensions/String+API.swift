import ApolloAPI

extension GraphQLNullable {
    static func value(for value: String?) -> GraphQLNullable<String> {
        if let value {
            return .init(stringLiteral: value)
        } else {
            return .null
        }
    }
}
