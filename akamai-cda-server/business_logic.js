const {property_hostname} = require('./akamai')

let property_details = []

/*
Each functon below will return a card_details (a json block), which contains 'front' and 'back' of the widget, 
which contains data to be displayed in the front and details of each card.
*/

// 
function count_property(inputId) {
    return property_hostname(inputId).then(data => {
                console.log(data.hostnames)
                hostnames = data.hostnames.items
                hostnames.forEach(element => {
                    // console.log(element)
                    property = {
                        "Property Name" : element.propertyName,
                        "Contract ID" : element.contractId,
                        "Group ID" : element.groupId,
                    }
                    property_details.push(property)
                });
                console.log(property_details)
                card_details = { 
                    "front" : data.hostnames.totalItems,
                    "back" : property_details
                }
                return card_details
            })
}

module.exports = {count_property, property_details}

