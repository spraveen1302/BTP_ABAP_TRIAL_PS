@AbapCatalog.sqlViewName: 'ZSQLV_ADRC_PS'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS View for Address Table'
define view ZI_ADDRESS_CDS_PS as select from zzt_adrc_ps

{
    key addrnumber as Addrnumber,
    title as Title,
    name1 as Name1,
    name2 as Name2,
    name3 as Name3,
    name4 as Name4,
    name_text as NameText,
    addr_line1 as AddrLine1,
    addr_line2 as AddrLine2,
    addr_line3 as AddrLine3,
    addr_line4 as AddrLine4,
    city as City,
    city_pin as CityPin,
    region as Region,
    country as Country,
    tel_number as TelNumber,
  
    
    email_address as EmailAddress,
//    case 
//    when email_address = ' '
//    then 'Email Address Not maintained'
//    when email_address <> ' '
//    then 'Email Address Maintained'
   
//    end as EmailAddress_status,
    coalesce( www_address, 'Web address not avilable' ) as WebAddress
//    www_address as WwwAddress
    
}

