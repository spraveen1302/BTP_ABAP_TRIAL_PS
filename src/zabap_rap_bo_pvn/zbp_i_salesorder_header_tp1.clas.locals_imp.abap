CLASS lhc_ZI_SALESORDER_HEADER_TP1 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR SOHEADER RESULT result.

    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE soheader.

    METHODS earlynumbering_SOITEMS FOR NUMBERING
      IMPORTING entities FOR CREATE soheader\_SOITEMS.

ENDCLASS.

CLASS lhc_ZI_SALESORDER_HEADER_TP1 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.


**********************************************************************
**** EARLY NUMBERING Header Level
**********************************************************************

  METHOD earlynumbering_create.

  SELECT MAX( ECommVbeln ) FROM ZC_SALESORDER_HEADER_TP INTO @DATA(lv_count).

  data(lt_entity) = entities.

  LOOP AT lt_entity ASSIGNING FIELD-SYMBOL(<lfs_entity>).

   lv_count = lv_count + 1.

   <lfs_entity>-ECommVbeln = lv_count.
*/   | { lv_count ALPHA = IN } |. */

   APPEND VALUE #( %CID       = <lfs_entity>-%cid
                   ECommVbeln = <lfs_entity>-%key ) to MAPPED-soheader.


  ENDLOOP.


  ENDMETHOD.

**********************************************************************
**** EARLY NUMBERING Item Level
**********************************************************************
  METHOD earlynumbering_soitems.

   SELECT  e_comm_vbeln, e_comm_posnr
   FROM ZZT_VBAP_PS
   FOR ALL ENTRIES IN @entities
   WHERE e_comm_vbeln = @entities-ECommVbeln
   INTO TABLE @DATA(lt_SoItems).

   DATA(lt_entity) = entities.

*   SORT lt_SoItems BY e_comm_posnr DESCENDING.

   LOOP AT lt_entity ASSIGNING FIELD-SYMBOL(<lfs_ety>).
*    READ TABLE lt_soitems INTO DATA(lwa_itm) INDEX 1.
*    IF sy-subrc EQ 0.
*     data(lv_posnr) = lwa_itm-e_comm_posnr.
*    ENDIF.

     SELECT MAX( e_comm_posnr ) FROM @lt_SoItems as itemkeys
     WHERE e_comm_vbeln = @<lfs_ety>-ECommVbeln
     INTO @DATA(lv_itemno).


    LOOP AT <lfs_ety>-%target ASSIGNING FIELD-SYMBOL(<lfs_key>).

     lv_itemno += 10.
     <lfs_key>-ECommPosnr = |{ lv_itemno ALPHA = IN }|.

     APPEND VALUE #( %cid = <lfs_key>-%cid
                     %key = <lfs_key>-%key ) TO mapped-soitems.
    ENDLOOP.

   ENDLOOP.

  ENDMETHOD.

ENDCLASS.
