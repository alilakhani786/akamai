const {list_contracts, list_enrollments, create_enrollment, update_enrollment, delete_enrollment} = require('./akamai-cert')

async function list_certs() {
    
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

async function create_cert() {
    // get the list of contract id
    const contract = await list_contracts();
    const item = contract.contracts.items
    const contractIdArr = []
    item.forEach(element => {
        const contractId = element.contractId.substr(4) //skipping ctr_ prefix
        contractIdArr.push(contractId)
    });
    
    // create enrollment 
    const enrollment = await create_enrollment(contractIdArr[0]) // assumming only one contract id
    return enrollment

}

async function modify_cert(enrollmentId) {
    const res = await update_enrollment(enrollmentId)
    return res
}

async function delete_cert(enrollmentId) {
    const res = await delete_enrollment(enrollmentId)
    return res
}
module.exports = {list_certs, create_cert, modify_cert, delete_cert}

