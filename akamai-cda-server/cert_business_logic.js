const {list_contracts, list_enrollments} = require('./akamai-cert')

async function list_certs(inputId) {
    
    // get the list of contract id
    const contract = await list_contracts();
    const item = contract.contracts.items
    const contractIdArr = []
    item.forEach(element => {
        const contractId = element.contractId.substr(4) //skipping ctr_ prefix
        contractIdArr.push(contractId)
    });

    // get the certs 
    const certPromises = contractIdArr.map(async element  => await list_enrollments(element))
    const certArr = await Promise.all(certPromises)
    return certArr;
}


module.exports = {list_certs}

