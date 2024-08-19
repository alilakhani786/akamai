const {list_contracts, list_enrollments, create_enrollment, update_enrollment, delete_enrollment} = require('./akamai-cert')

async function list_certs(switchkey) {
    
    // get the list of contract id
    const contract = await list_contracts(switchkey);
    const item = contract.contracts.items
    const contractIdArr = []
    item.forEach(element => {
        const contractId = element.contractId.substr(4) //skipping ctr_ prefix
        contractIdArr.push(contractId)
    });

    // get the certs 
    const certs = await list_enrollments(switchkey, contractIdArr[0])
    
    return certs;
}

async function create_cert(switchkey) {
    // get the list of contract id
    const contract = await list_contracts(switchkey);
    const item = contract.contracts.items
    const contractIdArr = []
    item.forEach(element => {
        const contractId = element.contractId.substr(4) //skipping ctr_ prefix
        contractIdArr.push(contractId)
    });
    
    // create enrollment 
    const enrollment = await create_enrollment(switchkey, contractIdArr[0]) // assumming only one contract id
    return enrollment

}

async function modify_cert(switchkey, enrollmentId) {
    const res = await update_enrollment(switchkey, enrollmentId)
    return res
}

async function delete_cert(switchkey, enrollmentId) {
    const res = await delete_enrollment(switchkey, enrollmentId)
    return res
}
module.exports = {list_certs, create_cert, modify_cert, delete_cert}

