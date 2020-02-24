1. Create 3 new wizards and make sure you can view their name, house, and patronus information.
mutation {
    addWizard(name: "Max Lin", houseId: 1, patronusId: 5) {
        id,
        name,
        house {
            name
        },
        patronus {
            form
        }
    }
}

mutation {
    addWizard(name: "Javier Ortiz", houseId: 3, patronusId: 3) {
        id,
        name,
        house {
            name
        },
        patronus {
            form
        }
    }
}

mutation {
    addWizard(name: "Andy Wynkoop", houseId: 2, patronusId: 2) {
        id,
        name,
        house {
            name
        },
        patronus {
            form
        }
    }
}

2. Edit the name of a wizard and verify that no other value has changed on that wizard.
mutation {
    updateWizard(id: 22, name: "Test Update"){
        id,
        name,
        house {
            name
        },
        patronus {
            form
        }
    }
}
3. Edit the house id and patronus id of a wizard and verify their name did not change. (You'll need to provide an id for the wizard you'd like to mutate).
mutation {
    updateWizard(id: 1, houseId: 2, patronusId: 2){
        id,
        name,
        house {
            name
        },
        patronus {
            form
        }
    }
}
4. Delete two wizards (just make sure you are deleting wizards who exist! You can query the wizards root type for a list of all wizards.)