const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLInt, GraphQLNonNull, GraphQLID } = graphql;
const mongoose = require("mongoose");
const God = mongoose.model("god");
const GodType = require("./god_type");
const Abode = mongoose.model("abode");
const AbodeType = require("./abode_type");
const Emblem = mongoose.model("emblem");
const EmblemType = require("./emblem_type");

// this will be the where we will create all of the mutations for our application
const mutation = new GraphQLObjectType({
    // we give it a name
    name: "Mutation",
    // then in the fields we will enter all of our different mutations
    fields: {
        newGod: {
            // we just specify the type we are mutating - in the case of making
            // a new God this will be the GodType
            type: GodType,
            args: {
                // the arguments required for this mutation
                name: { type: GraphQLString },
                type: { type: GraphQLString },
                description: { type: GraphQLString }
            },
            // here we are just destructing our arguments
            resolve(parentValue, { name, type, description }) {
                return new God({ name, type, description }).save();
            }
        },
        deleteGod: {
            type: GodType,
            args: {
                id: { type: new GraphQLNonNull(GraphQLID) }
            },
            resolve(parentValue, { id }) {
                return God.findByIdAndDelete({ _id: id })
            } 
        },
        updateGod: {
            type: GodType,
            args: {
                id: { type: GraphQLID },
                name: { type: GraphQLString },
                type: { type: GraphQLString },
                description: { type: GraphQLString }
            },
            resolve(parentValue, { id, name, type, description }) {
                const updateObj = {};
                // we can create our own object here and pass in the variables is they exist
                updateObj.id = id;
                if (name) updateObj.name = name;
                if (type) updateObj.type = type;
                if (description) updateObj.description = description;

                return God.findOneAndUpdate({ _id: id }, { $set: updateObj }, { new: true }, (err, god) => {
                    return god;
                });
            }
        },
        addGodRelative: {
            type: GodType,
            args: {
                godId: { type: GraphQLID },
                relativeId: { type: GraphQLID },
                relationship: { type: GraphQLString }
            },
            resolve(parentValue, { godId, relativeId, relationship }) {
                return God.addRelative(godId, relativeId, relationship);
            }
        },
        removeGodRelative: {
          type: GodType,
          args: {
            godId: { type: GraphQLID },
            relativeId: { type: GraphQLID },
            relationship: { type: GraphQLString }
          },
          resolve(parentValue, { godId, relativeId, relationship }) {
            return God.removeRelative(godId, relativeId, relationship);
          }
        },
        addGodEmblem: {
            type: GodType,
            args: {
                godId: { type: GraphQLID },
                emblemId: { type: GraphQLID },
            },
            resolve(parentValue, { godId, emblemId }) {
                return God.addEmblem(godId, emblemId);
            }
        },
        removeGodEmblem: {
            type: GodType,
            args: {
                godId: { type: GraphQLID },
                emblemId: { type: GraphQLID },
            },
            resolve(parentValue, { godId, emblemId }) {
                return God.removeEmblem(godId, emblemId);
            }
        },
        addGodDomain: {
          type: GodType,
          args: {
            godId: { type: GraphQLID },
            domain: { type: GraphQLString },
          },
          resolve(parentValue, { godId, domain }) {
            return God.addDomain(godId, domain);
          }
        },
        removeGodDomain: {
          type: GodType,
          args: {
            godId: { type: GraphQLID },
            domain: { type: GraphQLString },
          },
          resolve(parentValue, { godId, domain }) {
            return God.removeDomain(godId, domain);
          }
        },
        newAbode: {
            // we just specify the type we are mutating - in the case of making
            // a new God this will be the GodType
            type: AbodeType,
            args: {
                // the arguments required for this mutation
                name: { type: GraphQLString },
                coordinate: { type: GraphQLString }
            },
            // here we are just destructing our arguments
            resolve(parentValue, { name, coordinate }) {
                return new Abode({ name, coordinate }).save();
            }
        },
        deleteAbode: {
            type: AbodeType,
            args: {
                id: { type: new GraphQLNonNull(GraphQLID) }
            },
            resolve(parentValue, { id }) {
                return Abode.findByIdAndDelete({ _id: id })
            }
        },
        updateAbode: {
            type: AbodeType,
            args: {
                id: { type: GraphQLID },
                name: { type: GraphQLString },
                coordinate: { type: GraphQLString }
            },
            resolve(parentValue, { id, name, coordinate }) {
                const updateObj = {};
                // we can create our own object here and pass in the variables is they exist
                updateObj.id = id;
                if (name) updateObj.name = name;
                if (coordinate) updateObj.coordinate = coordinate;

                return Abode.findOneAndUpdate({ _id: id }, { $set: updateObj }, { new: true }, (err, abode) => {
                    return abode;
                });
            }
        },
        newEmblem: {
            // we just specify the type we are mutating - in the case of making
            // a new God this will be the GodType
            type: EmblemType,
            args: {
                // the arguments required for this mutation
                name: { type: GraphQLString }
            },
            // here we are just destructing our arguments
            resolve(parentValue, { name }) {
                return new Emblem({ name }).save();
            }
        },
        deleteEmblem: {
            type: EmblemType,
            args: {
                id: { type: new GraphQLNonNull(GraphQLID) }
            },
            resolve(parentValue, { id }) {
                return Emblem.findByIdAndDelete({ _id: id })
            }
        },
        updateEmblem: {
            type: EmblemType,
            args: {
                id: { type: GraphQLID },
                name: { type: GraphQLString },
            },
            resolve(parentValue, { id, name }) {
                const updateObj = {};
                // we can create our own object here and pass in the variables is they exist
                updateObj.id = id;
                if (name) updateObj.name = name;

                return Emblem.findOneAndUpdate({ _id: id }, { $set: updateObj }, { new: true }, (err, emblem) => {
                    return emblem;
                });
            }
        },
        updateGodAbode: {
            type: GodType,
            args: {
                godId: { type: GraphQLID },
                abodeId: { type: GraphQLID }
            },
            resolve(parentValue, { godId, abodeId }) {
              return God.updateAbode(godId, abodeId);
            }
        }
    }    
          
});

module.exports = mutation;