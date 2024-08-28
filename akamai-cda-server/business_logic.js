const {property_hostname, appsec_config} = require('./akamai')

 
function count_property(inputId) {
    return property_hostname(inputId).then(data => {
                let property_array = []
                hostnames = data.hostnames.items
                
                let property_map = {} // used to check duplicate product
                hostnames.forEach(element => {
                    if(!property_map.hasOwnProperty(element.propertyId)) {
                        const property = {
                            "Property Name" :  element.propertyName,
                            "Contract ID" : element.contractId,
                            "Group ID" :  element.groupId,
                            "Property Hostname" : element.cnameFrom
                        }
                        property_map[element.propertyId] = ''
                        property_array.push(property)
                    }

                });
                const result = { 
                    "Property Count" : property_array.length,
                    "Property List" : property_array
                }                
                return result
            })
}
function WAF_protected(inputId) {
    return appsec_config(inputId).then(data => {
        let count = 0;
        hostname_list = []
        const config = data.configurations;
        config.forEach(element => {
            if(element.hasOwnProperty("productionHostnames")) {
                count += element.productionHostnames.length
                hostname_list.push(element.productionHostnames)
            }
        })
        const result = {
            "WAF Protected Hostnames Count" : count,
            "WAF Hostname List" : hostname_list
        }
        return result
    })
}
async function property_card(inputId) {
    const hostname = await count_property(inputId)
    const WAF_hostname = await WAF_protected(inputId)
    const card_details = Object.assign({}, hostname, WAF_hostname)
    return card_details
}
async function another_card(inputId) {
    // your code here 
    const data1 = await count_property(inputId)
    const data2 = await WAF_protected(inputId)
    const card_details = Object.assign({}, data1, data2)
    return card_details
}

module.exports = {property_card}

