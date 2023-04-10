// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public struct BooleanConditionFieldsRecursive: Lens.SelectionSet, Fragment {
  public static var fragmentDefinition: StaticString { """
    fragment BooleanConditionFieldsRecursive on AccessConditionOutput {
      __typename
      and {
        __typename
        criteria {
          __typename
          ...SimpleConditionFields
          and {
            __typename
            criteria {
              __typename
              ...SimpleConditionFields
            }
          }
          or {
            __typename
            criteria {
              __typename
              ...SimpleConditionFields
            }
          }
        }
      }
      or {
        __typename
        criteria {
          __typename
          ...SimpleConditionFields
          and {
            __typename
            criteria {
              __typename
              ...SimpleConditionFields
            }
          }
          or {
            __typename
            criteria {
              __typename
              ...SimpleConditionFields
            }
          }
        }
      }
    }
    """ }

  public let __data: DataDict
  public init(_dataDict: DataDict) { __data = _dataDict }

  public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
  public static var __selections: [ApolloAPI.Selection] { [
    .field("__typename", String.self),
    .field("and", And?.self),
    .field("or", Or?.self),
  ] }

  public var and: And? { __data["and"] }
  public var or: Or? { __data["or"] }

  /// And
  ///
  /// Parent Type: `AndConditionOutput`
  public struct And: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AndConditionOutput }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("criteria", [Criterium].self),
    ] }

    public var criteria: [Criterium] { __data["criteria"] }

    /// And.Criterium
    ///
    /// Parent Type: `AccessConditionOutput`
    public struct Criterium: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("and", And?.self),
        .field("or", Or?.self),
        .fragment(SimpleConditionFields.self),
      ] }

      public var and: And? { __data["and"] }
      public var or: Or? { __data["or"] }
      public var nft: Nft? { __data["nft"] }
      public var eoa: Eoa? { __data["eoa"] }
      public var token: Token? { __data["token"] }
      public var profile: Profile? { __data["profile"] }
      public var follow: Follow? { __data["follow"] }
      public var collect: Collect? { __data["collect"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var simpleConditionFields: SimpleConditionFields { _toFragment() }
      }

      /// And.Criterium.And
      ///
      /// Parent Type: `AndConditionOutput`
      public struct And: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AndConditionOutput }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("criteria", [Criterium].self),
        ] }

        public var criteria: [Criterium] { __data["criteria"] }

        /// And.Criterium.And.Criterium
        ///
        /// Parent Type: `AccessConditionOutput`
        public struct Criterium: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(SimpleConditionFields.self),
          ] }

          public var nft: Nft? { __data["nft"] }
          public var eoa: Eoa? { __data["eoa"] }
          public var token: Token? { __data["token"] }
          public var profile: Profile? { __data["profile"] }
          public var follow: Follow? { __data["follow"] }
          public var collect: Collect? { __data["collect"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var simpleConditionFields: SimpleConditionFields { _toFragment() }
          }

          /// And.Criterium.And.Criterium.Nft
          ///
          /// Parent Type: `NftOwnershipOutput`
          public struct Nft: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var chainID: Lens.ChainId { __data["chainID"] }
            public var contractType: GraphQLEnum<Lens.ContractType> { __data["contractType"] }
            public var tokenIds: [Lens.TokenId]? { __data["tokenIds"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var nftOwnershipFields: NftOwnershipFields { _toFragment() }
            }
          }

          /// And.Criterium.And.Criterium.Eoa
          ///
          /// Parent Type: `EoaOwnershipOutput`
          public struct Eoa: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EoaOwnershipOutput }

            public var address: Lens.EthereumAddress { __data["address"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var eoaOwnershipFields: EoaOwnershipFields { _toFragment() }
            }
          }

          /// And.Criterium.And.Criterium.Token
          ///
          /// Parent Type: `Erc20OwnershipOutput`
          public struct Token: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20OwnershipOutput }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var amount: String { __data["amount"] }
            public var chainID: Lens.ChainId { __data["chainID"] }
            public var condition: GraphQLEnum<Lens.ScalarOperator> { __data["condition"] }
            public var decimals: Double { __data["decimals"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var erc20OwnershipFields: Erc20OwnershipFields { _toFragment() }
            }
          }

          /// And.Criterium.And.Criterium.Profile
          ///
          /// Parent Type: `ProfileOwnershipOutput`
          public struct Profile: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileOwnershipOutput }

            public var profileId: Lens.ProfileId { __data["profileId"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var profileOwnershipFields: ProfileOwnershipFields { _toFragment() }
            }
          }

          /// And.Criterium.And.Criterium.Follow
          ///
          /// Parent Type: `FollowConditionOutput`
          public struct Follow: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowConditionOutput }

            public var profileId: Lens.ProfileId { __data["profileId"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var followConditionFields: FollowConditionFields { _toFragment() }
            }
          }

          /// And.Criterium.And.Criterium.Collect
          ///
          /// Parent Type: `CollectConditionOutput`
          public struct Collect: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CollectConditionOutput }

            public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
            public var thisPublication: Bool? { __data["thisPublication"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var collectConditionFields: CollectConditionFields { _toFragment() }
            }
          }
        }
      }

      /// And.Criterium.Or
      ///
      /// Parent Type: `OrConditionOutput`
      public struct Or: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.OrConditionOutput }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("criteria", [Criterium].self),
        ] }

        public var criteria: [Criterium] { __data["criteria"] }

        /// And.Criterium.Or.Criterium
        ///
        /// Parent Type: `AccessConditionOutput`
        public struct Criterium: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(SimpleConditionFields.self),
          ] }

          public var nft: Nft? { __data["nft"] }
          public var eoa: Eoa? { __data["eoa"] }
          public var token: Token? { __data["token"] }
          public var profile: Profile? { __data["profile"] }
          public var follow: Follow? { __data["follow"] }
          public var collect: Collect? { __data["collect"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var simpleConditionFields: SimpleConditionFields { _toFragment() }
          }

          /// And.Criterium.Or.Criterium.Nft
          ///
          /// Parent Type: `NftOwnershipOutput`
          public struct Nft: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var chainID: Lens.ChainId { __data["chainID"] }
            public var contractType: GraphQLEnum<Lens.ContractType> { __data["contractType"] }
            public var tokenIds: [Lens.TokenId]? { __data["tokenIds"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var nftOwnershipFields: NftOwnershipFields { _toFragment() }
            }
          }

          /// And.Criterium.Or.Criterium.Eoa
          ///
          /// Parent Type: `EoaOwnershipOutput`
          public struct Eoa: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EoaOwnershipOutput }

            public var address: Lens.EthereumAddress { __data["address"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var eoaOwnershipFields: EoaOwnershipFields { _toFragment() }
            }
          }

          /// And.Criterium.Or.Criterium.Token
          ///
          /// Parent Type: `Erc20OwnershipOutput`
          public struct Token: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20OwnershipOutput }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var amount: String { __data["amount"] }
            public var chainID: Lens.ChainId { __data["chainID"] }
            public var condition: GraphQLEnum<Lens.ScalarOperator> { __data["condition"] }
            public var decimals: Double { __data["decimals"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var erc20OwnershipFields: Erc20OwnershipFields { _toFragment() }
            }
          }

          /// And.Criterium.Or.Criterium.Profile
          ///
          /// Parent Type: `ProfileOwnershipOutput`
          public struct Profile: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileOwnershipOutput }

            public var profileId: Lens.ProfileId { __data["profileId"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var profileOwnershipFields: ProfileOwnershipFields { _toFragment() }
            }
          }

          /// And.Criterium.Or.Criterium.Follow
          ///
          /// Parent Type: `FollowConditionOutput`
          public struct Follow: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowConditionOutput }

            public var profileId: Lens.ProfileId { __data["profileId"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var followConditionFields: FollowConditionFields { _toFragment() }
            }
          }

          /// And.Criterium.Or.Criterium.Collect
          ///
          /// Parent Type: `CollectConditionOutput`
          public struct Collect: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CollectConditionOutput }

            public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
            public var thisPublication: Bool? { __data["thisPublication"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var collectConditionFields: CollectConditionFields { _toFragment() }
            }
          }
        }
      }
      /// And.Criterium.Nft
      ///
      /// Parent Type: `NftOwnershipOutput`
      public struct Nft: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }

        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var chainID: Lens.ChainId { __data["chainID"] }
        public var contractType: GraphQLEnum<Lens.ContractType> { __data["contractType"] }
        public var tokenIds: [Lens.TokenId]? { __data["tokenIds"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var nftOwnershipFields: NftOwnershipFields { _toFragment() }
        }
      }

      /// And.Criterium.Eoa
      ///
      /// Parent Type: `EoaOwnershipOutput`
      public struct Eoa: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EoaOwnershipOutput }

        public var address: Lens.EthereumAddress { __data["address"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var eoaOwnershipFields: EoaOwnershipFields { _toFragment() }
        }
      }

      /// And.Criterium.Token
      ///
      /// Parent Type: `Erc20OwnershipOutput`
      public struct Token: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20OwnershipOutput }

        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var amount: String { __data["amount"] }
        public var chainID: Lens.ChainId { __data["chainID"] }
        public var condition: GraphQLEnum<Lens.ScalarOperator> { __data["condition"] }
        public var decimals: Double { __data["decimals"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var erc20OwnershipFields: Erc20OwnershipFields { _toFragment() }
        }
      }

      /// And.Criterium.Profile
      ///
      /// Parent Type: `ProfileOwnershipOutput`
      public struct Profile: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileOwnershipOutput }

        public var profileId: Lens.ProfileId { __data["profileId"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var profileOwnershipFields: ProfileOwnershipFields { _toFragment() }
        }
      }

      /// And.Criterium.Follow
      ///
      /// Parent Type: `FollowConditionOutput`
      public struct Follow: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowConditionOutput }

        public var profileId: Lens.ProfileId { __data["profileId"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var followConditionFields: FollowConditionFields { _toFragment() }
        }
      }

      /// And.Criterium.Collect
      ///
      /// Parent Type: `CollectConditionOutput`
      public struct Collect: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CollectConditionOutput }

        public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
        public var thisPublication: Bool? { __data["thisPublication"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var collectConditionFields: CollectConditionFields { _toFragment() }
        }
      }
    }
  }

  /// Or
  ///
  /// Parent Type: `OrConditionOutput`
  public struct Or: Lens.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { Lens.Objects.OrConditionOutput }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("__typename", String.self),
      .field("criteria", [Criterium].self),
    ] }

    public var criteria: [Criterium] { __data["criteria"] }

    /// Or.Criterium
    ///
    /// Parent Type: `AccessConditionOutput`
    public struct Criterium: Lens.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("and", And?.self),
        .field("or", Or?.self),
        .fragment(SimpleConditionFields.self),
      ] }

      public var and: And? { __data["and"] }
      public var or: Or? { __data["or"] }
      public var nft: Nft? { __data["nft"] }
      public var eoa: Eoa? { __data["eoa"] }
      public var token: Token? { __data["token"] }
      public var profile: Profile? { __data["profile"] }
      public var follow: Follow? { __data["follow"] }
      public var collect: Collect? { __data["collect"] }

      public struct Fragments: FragmentContainer {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public var simpleConditionFields: SimpleConditionFields { _toFragment() }
      }

      /// Or.Criterium.And
      ///
      /// Parent Type: `AndConditionOutput`
      public struct And: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AndConditionOutput }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("criteria", [Criterium].self),
        ] }

        public var criteria: [Criterium] { __data["criteria"] }

        /// Or.Criterium.And.Criterium
        ///
        /// Parent Type: `AccessConditionOutput`
        public struct Criterium: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(SimpleConditionFields.self),
          ] }

          public var nft: Nft? { __data["nft"] }
          public var eoa: Eoa? { __data["eoa"] }
          public var token: Token? { __data["token"] }
          public var profile: Profile? { __data["profile"] }
          public var follow: Follow? { __data["follow"] }
          public var collect: Collect? { __data["collect"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var simpleConditionFields: SimpleConditionFields { _toFragment() }
          }

          /// Or.Criterium.And.Criterium.Nft
          ///
          /// Parent Type: `NftOwnershipOutput`
          public struct Nft: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var chainID: Lens.ChainId { __data["chainID"] }
            public var contractType: GraphQLEnum<Lens.ContractType> { __data["contractType"] }
            public var tokenIds: [Lens.TokenId]? { __data["tokenIds"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var nftOwnershipFields: NftOwnershipFields { _toFragment() }
            }
          }

          /// Or.Criterium.And.Criterium.Eoa
          ///
          /// Parent Type: `EoaOwnershipOutput`
          public struct Eoa: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EoaOwnershipOutput }

            public var address: Lens.EthereumAddress { __data["address"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var eoaOwnershipFields: EoaOwnershipFields { _toFragment() }
            }
          }

          /// Or.Criterium.And.Criterium.Token
          ///
          /// Parent Type: `Erc20OwnershipOutput`
          public struct Token: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20OwnershipOutput }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var amount: String { __data["amount"] }
            public var chainID: Lens.ChainId { __data["chainID"] }
            public var condition: GraphQLEnum<Lens.ScalarOperator> { __data["condition"] }
            public var decimals: Double { __data["decimals"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var erc20OwnershipFields: Erc20OwnershipFields { _toFragment() }
            }
          }

          /// Or.Criterium.And.Criterium.Profile
          ///
          /// Parent Type: `ProfileOwnershipOutput`
          public struct Profile: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileOwnershipOutput }

            public var profileId: Lens.ProfileId { __data["profileId"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var profileOwnershipFields: ProfileOwnershipFields { _toFragment() }
            }
          }

          /// Or.Criterium.And.Criterium.Follow
          ///
          /// Parent Type: `FollowConditionOutput`
          public struct Follow: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowConditionOutput }

            public var profileId: Lens.ProfileId { __data["profileId"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var followConditionFields: FollowConditionFields { _toFragment() }
            }
          }

          /// Or.Criterium.And.Criterium.Collect
          ///
          /// Parent Type: `CollectConditionOutput`
          public struct Collect: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CollectConditionOutput }

            public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
            public var thisPublication: Bool? { __data["thisPublication"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var collectConditionFields: CollectConditionFields { _toFragment() }
            }
          }
        }
      }

      /// Or.Criterium.Or
      ///
      /// Parent Type: `OrConditionOutput`
      public struct Or: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.OrConditionOutput }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("criteria", [Criterium].self),
        ] }

        public var criteria: [Criterium] { __data["criteria"] }

        /// Or.Criterium.Or.Criterium
        ///
        /// Parent Type: `AccessConditionOutput`
        public struct Criterium: Lens.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { Lens.Objects.AccessConditionOutput }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .fragment(SimpleConditionFields.self),
          ] }

          public var nft: Nft? { __data["nft"] }
          public var eoa: Eoa? { __data["eoa"] }
          public var token: Token? { __data["token"] }
          public var profile: Profile? { __data["profile"] }
          public var follow: Follow? { __data["follow"] }
          public var collect: Collect? { __data["collect"] }

          public struct Fragments: FragmentContainer {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public var simpleConditionFields: SimpleConditionFields { _toFragment() }
          }

          /// Or.Criterium.Or.Criterium.Nft
          ///
          /// Parent Type: `NftOwnershipOutput`
          public struct Nft: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var chainID: Lens.ChainId { __data["chainID"] }
            public var contractType: GraphQLEnum<Lens.ContractType> { __data["contractType"] }
            public var tokenIds: [Lens.TokenId]? { __data["tokenIds"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var nftOwnershipFields: NftOwnershipFields { _toFragment() }
            }
          }

          /// Or.Criterium.Or.Criterium.Eoa
          ///
          /// Parent Type: `EoaOwnershipOutput`
          public struct Eoa: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EoaOwnershipOutput }

            public var address: Lens.EthereumAddress { __data["address"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var eoaOwnershipFields: EoaOwnershipFields { _toFragment() }
            }
          }

          /// Or.Criterium.Or.Criterium.Token
          ///
          /// Parent Type: `Erc20OwnershipOutput`
          public struct Token: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20OwnershipOutput }

            public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
            public var amount: String { __data["amount"] }
            public var chainID: Lens.ChainId { __data["chainID"] }
            public var condition: GraphQLEnum<Lens.ScalarOperator> { __data["condition"] }
            public var decimals: Double { __data["decimals"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var erc20OwnershipFields: Erc20OwnershipFields { _toFragment() }
            }
          }

          /// Or.Criterium.Or.Criterium.Profile
          ///
          /// Parent Type: `ProfileOwnershipOutput`
          public struct Profile: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileOwnershipOutput }

            public var profileId: Lens.ProfileId { __data["profileId"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var profileOwnershipFields: ProfileOwnershipFields { _toFragment() }
            }
          }

          /// Or.Criterium.Or.Criterium.Follow
          ///
          /// Parent Type: `FollowConditionOutput`
          public struct Follow: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowConditionOutput }

            public var profileId: Lens.ProfileId { __data["profileId"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var followConditionFields: FollowConditionFields { _toFragment() }
            }
          }

          /// Or.Criterium.Or.Criterium.Collect
          ///
          /// Parent Type: `CollectConditionOutput`
          public struct Collect: Lens.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CollectConditionOutput }

            public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
            public var thisPublication: Bool? { __data["thisPublication"] }

            public struct Fragments: FragmentContainer {
              public let __data: DataDict
              public init(_dataDict: DataDict) { __data = _dataDict }

              public var collectConditionFields: CollectConditionFields { _toFragment() }
            }
          }
        }
      }
      /// Or.Criterium.Nft
      ///
      /// Parent Type: `NftOwnershipOutput`
      public struct Nft: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.NftOwnershipOutput }

        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var chainID: Lens.ChainId { __data["chainID"] }
        public var contractType: GraphQLEnum<Lens.ContractType> { __data["contractType"] }
        public var tokenIds: [Lens.TokenId]? { __data["tokenIds"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var nftOwnershipFields: NftOwnershipFields { _toFragment() }
        }
      }

      /// Or.Criterium.Eoa
      ///
      /// Parent Type: `EoaOwnershipOutput`
      public struct Eoa: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.EoaOwnershipOutput }

        public var address: Lens.EthereumAddress { __data["address"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var eoaOwnershipFields: EoaOwnershipFields { _toFragment() }
        }
      }

      /// Or.Criterium.Token
      ///
      /// Parent Type: `Erc20OwnershipOutput`
      public struct Token: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.Erc20OwnershipOutput }

        public var contractAddress: Lens.ContractAddress { __data["contractAddress"] }
        public var amount: String { __data["amount"] }
        public var chainID: Lens.ChainId { __data["chainID"] }
        public var condition: GraphQLEnum<Lens.ScalarOperator> { __data["condition"] }
        public var decimals: Double { __data["decimals"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var erc20OwnershipFields: Erc20OwnershipFields { _toFragment() }
        }
      }

      /// Or.Criterium.Profile
      ///
      /// Parent Type: `ProfileOwnershipOutput`
      public struct Profile: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.ProfileOwnershipOutput }

        public var profileId: Lens.ProfileId { __data["profileId"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var profileOwnershipFields: ProfileOwnershipFields { _toFragment() }
        }
      }

      /// Or.Criterium.Follow
      ///
      /// Parent Type: `FollowConditionOutput`
      public struct Follow: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.FollowConditionOutput }

        public var profileId: Lens.ProfileId { __data["profileId"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var followConditionFields: FollowConditionFields { _toFragment() }
        }
      }

      /// Or.Criterium.Collect
      ///
      /// Parent Type: `CollectConditionOutput`
      public struct Collect: Lens.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { Lens.Objects.CollectConditionOutput }

        public var publicationId: Lens.InternalPublicationId? { __data["publicationId"] }
        public var thisPublication: Bool? { __data["thisPublication"] }

        public struct Fragments: FragmentContainer {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public var collectConditionFields: CollectConditionFields { _toFragment() }
        }
      }
    }
  }
}
