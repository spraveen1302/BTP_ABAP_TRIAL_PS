@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic View for Sales Order Header Table'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

//@VDM.viewType: #BASIC

define view entity ZI_SALESORDER_HEADER_CDS_PS as select from zzt_vbak_ps

association[1..*] to ZI_SALESORDER_ITEM_CDS_PS as _salesitm       on $projection.ECommVbeln       = _salesitm.ECommVbeln

association[1..1] to ZI_SOTYPE_CDS_PS          as _sotypedet      on $projection.SoType           = _sotypedet.SoType

association[1]    to ZI_COMPANYCODE_CDS_PS     as _companycode    on $projection.Bukrs            = _companycode.Bukrs

// All the key field should be mapped on the ON condition.
association[0..1] to ZI_SALESORG_CDS_PS        as _salesorg       on $projection.Vkorg            = _salesorg.Vkorg 
                                                                 and $projection.Bukrs            = _salesorg.Bukrs
                                                              
association[1]    to ZI_SOSTATUS_CDS_PS        as _sostatus       on $projection.SoStatus         = _sostatus.SoStatus

association[1]    to ZI_CUSTOMER_MASTER_CDS_PS as _soldtoparty    on $projection.SoldToPartyKunnr = _soldtoparty.Kunnr

{

    key e_comm_vbeln    as ECommVbeln,
    so_type             as SoType,
    short_text          as ShortText,
    bukrs               as Bukrs,
    vkorg               as Vkorg,
    so_status           as SoStatus,
    sold_to_party_kunnr as SoldToPartyKunnr,
    core_vbeln          as CoreVbeln,
    created_by          as CreatedBy,
    created_date        as CreatedDate,
    created_time        as CreatedTime,
    changed_data        as ChangedData,
    changed_time        as ChangedTime,
    
    
    //Association
    _salesitm,
    _sotypedet,
    _companycode,
    _salesorg,
    _sostatus,
    _soldtoparty
    
}
