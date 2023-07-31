@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption View for Customer Master Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true

//@VDM.viewType: #CONSUMPTION

define view entity ZC_CUSTOMER_MASTER_DETAILS_PS as select from ZI_CUSTOMER_MASTER_CDS_PS
{   
    @ObjectModel.text.element: ['CustomerName']
    key Kunnr as CustomerNumber,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.70
    Country,
    Addrnumber,
    
    
 // Exposing the country and address details of customer details via association 
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Semantics.text: true
    @Semantics.name.fullName: true
    _addressdetails.name1 as CustomerName,
        

    @Semantics.address.street: true 
    _addressdetails.addr_line2,
    
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.70
    @Search.ranking: #MEDIUM
    @Semantics.address.city: true
    _addressdetails.city,
    
    @EndUserText.label: 'Region'
    @Semantics.address.region: true
    _addressdetails.region,
    
    @EndUserText.label: 'PinCode'
    @Semantics.address.zipCode: true
    _addressdetails.city_pin,
    
    @EndUserText.label: 'Country'
    @Semantics.address.country: true
    _countrydetails.country_text,
    
    @EndUserText.label: 'EmailAddress'
    @Semantics.eMail.type:[ #WORK ]
    _addressdetails.email_address,
    
    @EndUserText.label: 'TelephoneNumber'
    @Semantics.telephone.type: [ #CELL ]
    _addressdetails.tel_number,
    
    @EndUserText.label: 'WebsiteAddress'
    _addressdetails.www_address

  
    
//    /* Associations */
//    _addressdetails,
//    _countrydetails
}
