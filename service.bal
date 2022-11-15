import ballerina/http;

type Address record {
    string streetNumber;
    string line1;
    string line2;
    string state;
    string country;
};



# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # Validates a address
    # + address - address to validate
    # + return - HTTP Ok if the address is found, otherwise HTTP Not found
    resource function post maps/address/validate(@http:Payload Address address) returns Address|error? {

        if address.streetNumber == "" { 
            return error("unable to find the address" + address.streetNumber);
        } else {
            return address;
        }
    }

}
