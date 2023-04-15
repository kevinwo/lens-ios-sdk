# Models

## Publications

The Apollo Client already generates model objects for us when interfacing with GraphQL. However, when it comes to publications, posts, comments, and mirrors, and their properties, are all duplicatively split into separate unrelated discrete types. This makes it tricky to build list views backed by shared business logic since the hierarchy of data for each publication type is separate.

Since all publications largely share the same properties, I figured there were two ways to solve this:

1. Traverse through all fetched publication data and parse all the GraphQL models into custom Post, Comment, and Mirror models, with shared custom MediaSet, Media, etc. property types, using separate initializers in each model to support each model (e.g. init Media with PostMedia/CommentMedia/MirrorMedia).
2. Create protocols with shared type names for all publication property GraphQL types, and extend each GraphQL type to conform to the shared protocols (e.g. Now PostMedia, CommentMedia, and MirrorMedia are just Media). Then traverse through the fetched GraphQL data only creating concrete Post, Comment, and Mirror models to more easily ingest all the same property types during init.

I went with number 2 as it seemed easier and cheaper than duplicating data across all types. If reusable data representation/transformation needs get more complicated, then maybe I'll consider migrating to 1 for some or all of the publication property types, which having 2 already would make a bit easier I think anyway.
