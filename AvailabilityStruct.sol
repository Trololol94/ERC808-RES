    pragma solidity ^0.4.17;

    contract ERC808 {

    enum BookingStatus { REQUESTED, REJECTED, CONFIRMED, CANCELLED }

    struct Availability {
        address _provider;
        bytes32 _signatureProof;
        uint _resourceId ; // resource id OR bundle id
        uint _type; // Type of Availability
        uint _minDeposit ; // minimum BTU deposit for booking this resource
        uint _commission ; // commission amount paid to booker in BTU
        uint _freeCancelDate; // Limit date for a reservation cancellation
        uint _startDate; //availability start date timestamps
        uint _endDate; //availability end date timestamps
        BookingStatus _bookingStatus ; // reservation status
        string _metaDataLink; // Link to Meta Data of the bookable resource (desc, image links, etc…)
    }

    struct Provider {
        address _providerAddress;
        mapping(bytes32 => Availability) availabilities;
    }
    
    mapping(uint => Availability) private availability;
    Availability[] availList;

    mapping(uint => Provider) private provider;
    Provider[] providerList;

    function getListAvailabilities() view public returns (Availability[]) {
            return availList;
    }

    function addAvailabilities(uint ressourceID, 
                            uint ressourceType, 
                            uint minDeposit, 
                            BookingStatus status, 
                            uint commission,
                            uint freeCancelDate,
                            uint startDate, 
                            uint endDate,
                            string metaDataLink) public {
        var avail = availability[ressourceID];
        avail._type = ressourceType;
        avail._minDeposit = minDeposit;
        avail._bookingStatus = status;
        avail._commission = commission;
        avail._freeCancelDate = freeCancelDate;
        avail._startDate = startDate;
        avail._endDate = endDate;
        avail._metaDataLink = metaDataLink;
        availList.push(avail)-1;
    }

    function getAvailability(uint _id) view public returns (uint, uint, uint, uint, uint, uint, BookingStatus) {
        return (
            availability[_id]._type, 
            availability[_id]._minDeposit, 
            availability[_id]._commission, 
            availability[_id]._freeCancelDate, 
            availability[_id]._startDate, 
            availability[_id]._endDate, 
            availability[_id]._bookingStatus);
    }

    function getMetadata(uint _id) view public returns (string) {
            return   availability[_id]._metaDataLink;
    }

}
