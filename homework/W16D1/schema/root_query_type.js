const graphql = require("graphql");
const { GraphQLObjectType, GraphQLList, GraphQLNonNull, GraphQLID } = graphql;
const mongoose = require("mongoose");
const User = mongoose.model("user");
const UserType = require("./user_type");
const PostType = require("./post_type");

const RootQuery = new GraphQLObjectType({
    name: "RootQueryType",
    fields: {
        users: {
            type: new GraphQLList(UserType),
            resolve() {
                return User.find({});
            }
        },
        user: {
            type: UserType,
            args: { id: { type: new GraphQLNonNull(GraphQLID) } },
            resolve(parentValue, args) {
                return User.findById(args.id)
            }
        },
        posts: {
            // we want all our returned posts in an Array so we use the GraphQLList type
            type: new GraphQLList(PostType),
            resolve() {
                return Post.find({});
            }
        },
        post: {
            // here we just want to return a single post
            type: PostType,
            // we need an id for this query so we'll use GraphQLNonNull
            args: { id: { type: new GraphQLNonNull(GraphQLID) } },
            resolve(parentValue, args) {
                return Post.findById(args.id)
            }
        }
    }
});

module.exports = RootQuery;