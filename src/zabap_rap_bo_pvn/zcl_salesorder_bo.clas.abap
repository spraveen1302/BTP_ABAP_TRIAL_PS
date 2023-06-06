CLASS zcl_salesorder_bo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_SALESORDER_BO IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* All derived data types in the context of the ABAP RESTful application programming model also contain components
* that don’t originate from the entity's line type.
* Their names start with the % character to avoid naming conflicts with the original components.

    DATA lt_keys TYPE TABLE FOR READ IMPORT zc_salesorder_header_tp.

**********************************************************************
* %KEY include structure that contains all the primary key fields of the entity.
* %key & refer the key field of the zc_salesorder_header_tp
* %Control fields of 01 refers - abap_true to display the fields in the output.

    lt_keys = VALUE #( (  %key-ECommVbeln = '1000008900'
                          %control-Bukrs = 01
                          %control-CoreVbeln = 01
                          %control-Currency = 01 ) ).

**********************************************************************
*  READ_ENTITY PLAIN
**********************************************************************
*   READ ENTITY ZC_SALESORDER_HEADER_TP
*   FROM lt_keys
*   RESULT DATA(lt_header).

**********************************************************************
*  READ ENTITY WITH SPECIFIC FIELDS
**********************************************************************
*/  READ ENTITY ZC_SALESORDER_HEADER_TP
*    FIELDS ( ECommVbeln Bukrs Vkorg )
*     WITH VALUE #( (  %KEY-ECommVbeln = '1000008900' ) ) */

**********************************************************************
*  READ ENTITY ALL FIELDS
**********************************************************************
*    READ ENTITY zc_salesorder_header_tp
*    ALL FIELDS
*    WITH VALUE #( (  %key-ECommVbeln = '1000008900' ) )
*    RESULT DATA(lt_header).
*
*    out->write( lt_header ).
***********************************************************************
** READ ENTITY WITH ASSOCIATION
***********************************************************************
*    READ ENTITY zc_salesorder_header_tp
*      BY \_SOItems
*      all FIELDS WITH value #( ( %key-ECommVbeln = '1000008900' ) )
*      RESULT DATA(lt_items).
*
** WRITE THE OUTPUT
*    out->write( lt_items ).

**********************************************************************
* MODIFY ENTITY
**********************************************************************
* To Identify the fields of the entity required content ID
* %CID - is the temp key for the instance.
* Its valid as long as no key value generated for the business object runtime
* its provided by SADL Framework. Whenever create operation involves, content ID %CID is needed.


*/  SoType ShortText Bukrs Vkorg SoStatus StatusText
*/                  SoldToPartyKunnr CoreVbeln CreatedBy CreatedDate CreatedTime */
*   MODIFY ENTITY zc_salesorder_header_tp
*
*   CREATE AUTO FILL CID FIELDS ( ShortText Bukrs )
*
*   WITH VALUE #(  (
**/                   %cid = 'CID_1'                     // When you are using Auto Fill CID - Frame work auto generates the CID Field Value
*                     SoType = 'YYSO'
*                     ShortText = 'Test POS Sales Order 09'
*                     Bukrs = '0010'
*                     Vkorg = '1000'
*                     SoStatus = 'A'
*                     StatusText = 'Not Yet Processed'
*                     SoldToPartyKunnr = '0000086101'
*                     CoreVbeln = '8900010009'
*                     CreatedBy = 'P61200000000'
*                     CreatedDate = '20230517'
*                     CreatedTime = '05:15:20'
*               )  )
*                  FAILED DATA(lt_failed)
*                  MAPPED DATA(lt_mapped)
*                  REPORTED DATA(lt_reported).
*
*   COMMIT ENTITIES.
*   out->write( lt_mapped ).

**********************************************************************
* MODIFY ENTITY WITH ASSOCIATION
**********************************************************************
    DATA lv_posnr TYPE char6.
    lv_posnr = '010'.

    MODIFY ENTITY zc_salesorder_header_tp
    CREATE BY \_SOItems
    AUTO FILL CID FIELDS ( ECommPosnr Matnr SoldToPartyKunnr )
    WITH VALUE #( ( ECommVbeln = '1000008909'
                    %target = VALUE #( (
*//                    %CID = 'CID_ITM'        // When you are using Auto Fill CID - Frame work will auto generates the CID Field value
                                          ECommPosnr = |{ lv_posnr ALPHA = IN }|
                                          Matnr = '500000000000000060'
                                          SoldToPartyKunnr = '0000090005'        ) )
                ) )

   FAILED DATA(lt_failed1)
   MAPPED DATA(lt_mapped1)
   REPORTED DATA(LT_REPORTED1).

   COMMIT ENTITIES.

**********************************************************************
* DELETE ENTITY
**********************************************************************

*  MODIFY ENTITY zc_salesorder_header_tp
*  ENTITY SOHEADER
*  DELETE FROM VALUE #( ( ECommVbeln = '1000008900'
*                         %is_draft  = if_abap_behv=>mk-off ) )
*  FAILED DATA(lt_headerf)
*  reported DATA(lt_reported_r).


  ENDMETHOD.
ENDCLASS.
