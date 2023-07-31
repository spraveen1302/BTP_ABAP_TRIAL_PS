CLASS zcl_test_class_ps DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_test_class_ps IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA : lt_adrc      TYPE TABLE OF zzt_adrc_ps,
           lt_curc      TYPE TABLE OF zzt_curc_ps,
           lt_kna1      TYPE TABLE OF zzt_kna1_ps,
           lt_mara      TYPE TABLE OF zzt_ps_mara,
           lt_so_status type table of zzt_so_status,
           lt_so_type   TYPE TABLE OF ZZT_SO_TYPE,
           lt_t001      TYPE TABLE OF zzt_t001_ps,
           lt_t005      TYPE TABLE OF zzt_t005_ps,
           lt_tvko      TYPE TABLE OF zzt_tvko,
           lt_vbak      TYPE TABLE OF zzt_vbak_ps,
           lt_vbap      TYPE TABLE OF zzt_vbap_ps.

    lt_adrc = value #( ( addrnumber = '1000000001' title        = 'M/s'                    name1 = 'Nokia Mobiles ltd'            name2 = ' '                      name3 = ' '                                     name4  = ' ' name_text  = ' '
                         addr_line1 = 'Lane10'     addr_line2   = 'Richardson Street'      addr_line3   = 'Austin'                addr_line4   = 'Texas'           city       = 'Austin'
                         city_pin   = '73301'      region       = 'Texas'                  country    = 'US'                      tel_number   = '+1 7390657899 '  email_address  = 'helpline.sales@nokia.com'     www_address  = 'www.Nokia.com'  )

                       ( addrnumber = '1000000002' title        = 'M/s'                    name1 = 'Wireless Solution Pvt ltd'    name2 = ' '                      name3 = ' '          name4  = ' '               name_text  = 'Wireless Solution Pvt ltd'
                         addr_line1 = '141'        addr_line2   = 'Burbank St'             addr_line3   = ''                      addr_line4   = ''                city       = 'Hartlepool'
                         city_pin   = 'TS24 7JW1'  region       = 'Cleveland'              country    = 'UK'                      tel_number   = '+1 7390657899 '  email_address  = 'hotline.sales@wsol.com'       www_address  = 'www.wsol.com'  )

                       ( addrnumber = '1000000003' title        = 'M/s'                    name1 = 'Toyota Pvt Ltd'               name2 = ' '                      name3 = ' '          name4  = ' '               name_text  = ''
                         addr_line1 = '269-1015'   addr_line2   = 'Kamiizue'               addr_line3   = ''                      addr_line4   = ''                city       = 'Taki-cho Taki-gun'
                         city_pin   = '519-2100'   region       = 'Mie'                    country    = 'JP'                      tel_number   = '+8154-280-1212'  email_address  = 'voc@toyota-kirloskar.co.in'   www_address  = 'www.toyotabharat.com'  )

                       ( addrnumber = '1000000004' title        = 'M/s'                    name1 = 'Nokia Mobiles ltd'            name2 = ' '                      name3 = ' '          name4  = ' '               name_text  = 'Nokia Mobiles ltd'
                         addr_line1 = 'Lane10'     addr_line2   = 'Richardson Street'      addr_line3   = 'Austin'                addr_line4   = 'Texas'           city       = 'Austin'
                         city_pin   = '73301'      region       = 'Mie'                    country    = 'JP'                      tel_number   = '+1 7390657899'   email_address  = 'helpline.sales@nokia.com'     www_address  = 'www.Nokia.com'  )

                       ( addrnumber = '1000000005' title        = 'M/s'                    name1 = 'Ice Qube Pvt ltd'             name2 = ' '                      name3 = ' '          name4  = ' '               name_text  = 'Ice Qube Pvt ltd'
                         addr_line1 = '80'         addr_line2   = 'Richardson Street West' addr_line3   = 'Suite 700'             addr_line4   = ''                city       = 'Toronto'
                         city_pin   = 'M5H 2A4'    region       = 'ON'                     country    = 'CA'                      tel_number   = '+1 416-368-3894' email_address  = 'iceqube.sales@nokia.com'      www_address  = 'www.iceqube.com'  )

                       ( addrnumber = '1000000006' title        = 'M/s'                    name1 = 'Reliance Industries Limited'  name2 = ' '                      name3 = ' '          name4  = ' '               name_text  = 'Reliance Industries Limited'
                         addr_line1 = '8'          addr_line2   = 'Connaught Cir'          addr_line3   = 'Connaught Lane'        addr_line4   = ''                city       = 'New Delhi'
                         city_pin   = '110001'     region       = 'Delhi'                  country    = 'IN'                      tel_number   = '+22 3555 5000'   email_address  = 'info@ril.com'                 www_address  = 'www.ril.com'  )

                       ( addrnumber = '1000000007' title        = 'M/s'                    name1 = 'Animal Planet pvt ltd'        name2 = ' '                      name3 = ' '          name4  = ' '               name_text  = 'Animal Planet pvt ltd'
                         addr_line1 = '25'         addr_line2   = 'Stanley Drive'          addr_line3   = ''                      addr_line4   = 'Barakhamba'      city       = 'Laguna Quays'
                         city_pin   = '73301'      region       = 'Queensland'             country    = 'AU'                      tel_number   = '(07) 4908 1212'  email_address  = 'info.sales@animalplanet.com'  www_address  = 'www.animalplanet.com'  )


                       ( addrnumber = '1000000008' title        = 'M/s'                    name1 = 'Singapore pte ltd'            name2 = ' '                      name3 = ' '          name4  = ' '               name_text  = 'Singapore pte ltd'
                         addr_line1 = '2'          addr_line2   = 'Woodlands Loop'         addr_line3   = ''                      addr_line4   = ''                city       = 'Singapore'
                         city_pin   = '738-74'     region       = 'Singapore'              country    = 'SG'                      tel_number   = '+65 6631 4499'   email_address  = 'helpline.sales@sgs.com'       www_address  = 'www.sgst.com'  )

                       ( addrnumber = '0000000100' title        = 'Mr'                     name1 = 'Jhon'                         name2 = 'Andrew'                  name3 = ' '          name4  = ' '              name_text  = 'Jhon Andrew'
                         addr_line1 = '325'        addr_line2   = 'W FULLERTON PKWY APT'   addr_line3   = ''                      addr_line4   = ''                 city       = 'CHICAGO'
                         city_pin   = '60614-2862' region       = 'IL'                     country    = 'USA'                     tel_number   = '+312 42131222045' email_address  = 'jhonandrew@gmail.com'        www_address  = ' '  )

                       ).


      lt_curc = value #( ( waers = 'USD' country = 'US' waers_text = 'U.S Dollar'          image_url = 'https://cdn-icons-png.flaticon.com/128/1138/1138523.pn' )
                         ( waers = 'AUD' country = 'AU' waers_text = 'Australian Dollar'   image_url = 'https://cdn-icons-png.flaticon.com/128/6943/6943067.png' )
                         ( waers = 'SGD' country = 'SG' waers_text = 'Singapore Dollar'    image_url = 'https://cdn-icons-png.flaticon.com/128/3033/3033805.png' )
                         ( waers = 'GBP' country = 'UK' waers_text = 'Great Britian Pound' image_url = 'https://cdn-icons-png.flaticon.com/128/9586/9586546.png' )
                         ( waers = 'JPY' country = 'JP' waers_text = 'Japanese Yen'        image_url = 'https://cdn-icons-png.flaticon.com/128/330/330622.png' )
                         ( waers = 'CAD' country = 'CA' waers_text = 'Candian Dollar'      image_url = 'https://cdn-icons-png.flaticon.com/128/197/197430.png' )
                         ( waers = 'INR' country = 'IN' waers_text = 'Currency'            image_url = 'https://cdn-icons-png.flaticon.com/128/1490/1490817.png' )

                       ).


     lt_kna1 = value #(
                         ( kunnr = '0000050001' country = 'US' addrnumber = '1000000001' )
                         ( kunnr = '0000060001' country = 'UK' addrnumber = '1000000002' )
                         ( kunnr = '0000070001' country = 'JP' addrnumber = '1000000003' )
                         ( kunnr = '0000080001' country = 'CA' addrnumber = '1000000004' )
                         ( kunnr = '0000090001' country = 'IN' addrnumber = '1000000005' )
                         ( kunnr = '0000010001' country = 'AU' addrnumber = '1000000006' )
                         ( kunnr = '0000020001' country = 'SG' addrnumber = '1000000007' )
                         ( kunnr = '0000086101' country = 'US' addrnumber = '0000000100' )  ).



     lt_mara = value #(
                         ( matnr = '500000000000000001' maktx = 'Hard disk'    mtart = 'DLAG' material_category = '01'  imageurl = 'https://cdn-icons-png.flaticon.com/128/2132/2132415.png' )
                         ( matnr = '500000000000000005' maktx = 'Mother Board' mtart = 'ORG'  material_category = '01'  imageurl = 'https://cdn-icons-png.flaticon.com/128/2764/2764211.png' )
                         ( matnr = '500000000000000010' maktx = 'Key board'    mtart = 'LOGT' material_category = '01'  imageurl = 'https://cdn-icons-png.flaticon.com/128/2824/2824623.png' )
                         ( matnr = '500000000000000015' maktx = 'Mouse'        mtart = 'MIOR' material_category = '01'  imageurl = 'https://cdn-icons-png.flaticon.com/128/1787/1787045.png' )
                         ( matnr = '500000000000000020' maktx = 'Joy Stick'    mtart = 'QSET' material_category = '05'  imageurl = 'https://cdn-icons-png.flaticon.com/128/4854/4854246.png' )
                         ( matnr = '500000000000000025' maktx = 'Screw'        mtart = 'UVWS' material_category = '10'  imageurl = 'https://cdn-icons-png.flaticon.com/128/10030/10030325.png' )
                         ( matnr = '500000000000000030' maktx = 'Plugs'        mtart = 'XOYL' material_category = '10'  imageurl = 'https://cdn-icons-png.flaticon.com/512/2060/2060448.png' )
                         ( matnr = '500000000000000035' maktx = 'Socket Holder' mtart = 'ABBB' material_category = '15' imageurl = 'https://cdn-icons-png.flaticon.com/128/675/675857.png' )
                         ( matnr = '500000000000000040' maktx = 'Fan'          mtart = 'MONT' material_category = '25'  imageurl = 'https://cdn-icons-png.flaticon.com/128/979/979619.png' )
                         ( matnr = '500000000000000045' maktx = 'Ram'          mtart = 'KALM' material_category = '25'  imageurl = 'https://cdn-icons-png.flaticon.com/128/3786/3786035.png' )
                         ( matnr = '500000000000000050' maktx = 'Box'          mtart = 'NORT' material_category = '15'  imageurl = 'https://cdn-icons-png.flaticon.com/128/685/685388.png' )
                         ( matnr = '500000000000000055' maktx = 'Bottle'       mtart = 'FAOL' material_category = '15'  imageurl = 'https://cdn-icons-png.flaticon.com/128/8012/8012727.png' ) ).

     lt_so_status = VALUE #( ( so_status = '' status_text = 'Not Relavant' )
                             ( so_status = 'A' status_text = 'Not Yet Processed' )
                             ( so_status = 'B' status_text = 'Paritially Processed' )
                             ( so_status = 'C' status_text = 'Completely Processed' )
                           ).


     lt_so_type = VALUE #( ( so_type = 'YYDM'  so_type_text = 'Demo Orders'        imageurl = 'https://cdn-icons-png.flaticon.com/128/8448/8448418.png' )
                           ( so_type = 'YYSO'  so_type_text = 'Standard Order'     imageurl = 'https://cdn-icons-png.flaticon.com/128/3649/3649775.png' )
                           ( so_type = 'YYQT'  so_type_text = 'Quatation'          imageurl = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcScppk10mpHDE_ezv4mNXmpVUEw_AaCr1NmuFgv4LK9CBH3eoXYxhO4sLiJ97MnBz7yGC0&usqp=CAU' )
                           ( so_type = 'YYSIF' so_type_text = 'Sales Information'  imageurl = 'https://cdn-icons-png.flaticon.com/128/7626/7626228.png' )
                           ( so_type = 'YYDO'  so_type_text = 'Delivery Order'     imageurl = 'https://cdn-icons-png.flaticon.com/128/3045/3045670.png' )
                           ( so_type = 'YYFOD' so_type_text = 'Free Delivery'      imageurl = 'https://cdn-icons-png.flaticon.com/128/5163/5163977.png' )
                           ( so_type = 'YYDMR' so_type_text = 'Debit Memo Request' imageurl = 'https://cdn-icons-png.flaticon.com/128/5420/5420423.png' )
                           ( so_type = 'YYPOR' so_type_text = 'Promotion Order'    imageurl = 'https://cdn-icons-png.flaticon.com/256/6299/6299658.png' )
                         ).


     lt_t001 = VALUE #( ( bukrs = '0010' butxt = 'Nokia ltd'                 country = 'US' ort01 = 'Cupertino'         category = '' waers = 'USD' addrnumber = '1000000001' )
                        ( bukrs = '0050' butxt = 'Samsung pte ltd'           country = 'SG' ort01 = 'Keat Hong Village' category = '' waers = 'SGD' addrnumber = '1000000007' )
                        ( bukrs = '0090' butxt = 'Toyoto pvt ltd'            country = 'JP' ort01 = 'Keat Hong Village' category = '' waers = 'JPY' addrnumber = '1000000003' )
                        ( bukrs = '0120' butxt = 'Reliance India Pvt ltd'    country = 'IN' ort01 = 'Delhi'             category = '' waers = 'INR' addrnumber = '1000000005' )
                        ( bukrs = '0140' butxt = 'Animal Planet pvt ltd'     country = 'AU'   ort01 = 'Sydney'          category = '' waers = 'AUD' addrnumber = '1000000006' )
                        ( bukrs = '0160' butxt = 'Ice Qube Pvt ltd'          country = 'CA'   ort01 = 'Ontario'         category = '' waers = 'CAD' addrnumber = '1000000004' )
                        ( bukrs = '0180' butxt = 'Wireless Solution pvt ltd' country = 'UK'   ort01 = 'London'          category = '' waers = 'GBP' addrnumber = '1000000002' ) ).


      lt_t005 = VALUE #( ( country = 'JP' country_text = 'Japan'                    country_image = 'https://cdn-icons-png.flaticon.com/128/555/555646.png' )
                         ( country = 'US' country_text = 'United States of America' country_image = 'https://cdn-icons-png.flaticon.com/128/197/197484.png' )
                         ( country = 'CA' country_text = 'Canada'                   country_image = 'https://cdn-icons-png.flaticon.com/128/197/197430.png' )
                         ( country = 'SG' country_text = 'Singapore'                country_image = 'https://cdn-icons-png.flaticon.com/128/197/197496.png' )
                         ( country = 'JP' country_text = 'Japan'                    country_image = 'https://cdn-icons-png.flaticon.com/128/555/555646.png' )
                         ( country = 'AU' country_text = 'Australia'                country_image = 'https://cdn-icons-png.flaticon.com/128/323/323367.png' )
                         ( country = 'UK' country_text = 'United Kingdom'           country_image = 'https://cdn-icons-png.flaticon.com/128/197/197374.png' )
                         ( country = 'IN' country_text = 'India'                    country_image = 'https://cdn-icons-png.flaticon.com/128/3909/3909444.png'  ) ).


      lt_tvko = VALUE #( ( vkorg = '1000' bukrs = '0010' waers = 'USD' sorg_txt = 'USA'            addrnumber = '1000000001' )
                         ( vkorg = '1001' bukrs = '0180' waers = 'GBP' sorg_txt = 'United Kingdom' addrnumber = '1000000002' )
                         ( vkorg = '1002' bukrs = '0090' waers = 'JPY' sorg_txt = 'Japan'          addrnumber = '1000000003' )
                         ( vkorg = '1003' bukrs = '0160' waers = 'CAD' sorg_txt = 'Canada'         addrnumber = '1000000004' )
                         ( vkorg = '1004' bukrs = '0120' waers = 'INR' sorg_txt = 'India'          addrnumber = '1000000005' )
                         ( vkorg = '1005' bukrs = '0140' waers = 'AUD' sorg_txt = 'Australia'      addrnumber = '1000000006' )
                         ( vkorg = '1006' bukrs = '0050' waers = 'SGD' sorg_txt = 'Singapore'      addrnumber = '1000000007' )
                         ).

      lt_vbak = VALUE #( ( E_COMM_VBELN = '1000008900'  SO_TYPE = 'YYDM'    SHORT_TEXT = 'Test POS Sales Order'    BUKRS = '0010'    VKORG = '1000'    SO_STATUS = 'A'   SOLD_TO_PARTY_KUNNR = '0000086101'
                                    CORE_VBELN = '8900010000'  CREATED_BY = 'P41200000000'    CREATED_DATE = '20230327'    CREATED_TIME = '120530'  CHANGED_DATA = '20230327'    CHANGED_TIME = '140530' )
                         ( E_COMM_VBELN = '1000008901'  SO_TYPE = 'YYSO'    SHORT_TEXT = 'Test POS Sales Order 01' BUKRS = '0050'    VKORG = '1006'    SO_STATUS = 'B'   SOLD_TO_PARTY_KUNNR = '0000020001'
                                    CORE_VBELN = '8900010001'  CREATED_BY = 'P41300000000'    CREATED_DATE = '20230327'    CREATED_TIME = '123051'  CHANGED_DATA = '20230327'    CHANGED_TIME = '133051' )
                         ( E_COMM_VBELN = '1000008902'  SO_TYPE = 'YYPOR'   SHORT_TEXT = 'Test POS Sales Order 02' BUKRS = '0090'    VKORG = '1002'    SO_STATUS = 'B'   SOLD_TO_PARTY_KUNNR = '0000070001'
                                    CORE_VBELN = '8900010002'  CREATED_BY = 'P41500000000'    CREATED_DATE = '20230327'    CREATED_TIME = '142040'  CHANGED_DATA = '20230327'    CHANGED_TIME = '150530' )
                         ( E_COMM_VBELN = '1000008903'  SO_TYPE = 'YYSO'    SHORT_TEXT = 'Test POS Sales Order 03' BUKRS = '0120'    VKORG = '1004'    SO_STATUS = 'C'   SOLD_TO_PARTY_KUNNR = '0000090001'
                                    CORE_VBELN = '8900010003'  CREATED_BY = 'P41600000000'    CREATED_DATE = '20230327'    CREATED_TIME = '151020'  CHANGED_DATA = '20230327'    CHANGED_TIME = '161020' )
                         ( E_COMM_VBELN = '1000008904'  SO_TYPE = 'YYSO'    SHORT_TEXT = 'Test POS Sales Order 04' BUKRS = '0140'    VKORG = '1005'    SO_STATUS = ' '   SOLD_TO_PARTY_KUNNR = '0000010001'
                                    CORE_VBELN = '8900010004'  CREATED_BY = 'P41700000000'    CREATED_DATE = '20230327'    CREATED_TIME = '165120'  CHANGED_DATA = '20230327'    CHANGED_TIME = '175120' )
                         ( E_COMM_VBELN = '1000008905'  SO_TYPE = 'YYDMR'   SHORT_TEXT = 'Test POS Sales Order 05' BUKRS = '0160'    VKORG = '1003'    SO_STATUS = 'A'   SOLD_TO_PARTY_KUNNR = '0000080001'
                                    CORE_VBELN = '8900010005'  CREATED_BY = 'P41800000000'    CREATED_DATE = '20230327'    CREATED_TIME = '170010'  CHANGED_DATA = '20230327'    CHANGED_TIME = '180010' )
                         ( E_COMM_VBELN = '1000008906'  SO_TYPE = 'YYDO'    SHORT_TEXT = 'Test POS Sales Order 06' BUKRS = '0180'    VKORG = '1001'    SO_STATUS = 'B'   SOLD_TO_PARTY_KUNNR = '0000060001'
                                    CORE_VBELN = '8900010006'  CREATED_BY = 'P41900000000'    CREATED_DATE = '20230327'    CREATED_TIME = '174021'  CHANGED_DATA = '20230327'    CHANGED_TIME = '184021' )
                         ( E_COMM_VBELN = '1000008907'  SO_TYPE = 'YYSO'    SHORT_TEXT = 'Test POS Sales Order 07' BUKRS = '0010'    VKORG = '1000'    SO_STATUS = 'C'   SOLD_TO_PARTY_KUNNR = '0000050001'
                                    CORE_VBELN = '8900010007'  CREATED_BY = 'P42200000000'    CREATED_DATE = '20230327'    CREATED_TIME = '182021'  CHANGED_DATA = '20230327'    CHANGED_TIME = '192021' )
                         ( E_COMM_VBELN = '1000008908'  SO_TYPE = 'YYSO'    SHORT_TEXT = 'Test POS Sales Order 08' BUKRS = '0090'    VKORG = '1002'    SO_STATUS = 'A'   SOLD_TO_PARTY_KUNNR = '0000070001'
                                    CORE_VBELN = '8900010008'  CREATED_BY = 'P51200000000'    CREATED_DATE = '20230327'    CREATED_TIME = '205011'  CHANGED_DATA = '20230327'    CHANGED_TIME = '215011' )
                       ).

      lt_vbap = VALUE #( (
                             E_COMM_VBELN = '1000008900'  E_COMM_POSNR = '000010'  SOLD_TO_PARTY_KUNNR = '0000050001'  MATNR = '500000000000000001'  SHIP_TO_PARTY_KUNNR = '0000050001'  BILL_TO_PARTY_KUNNR = '0000050001'
                                         PAYER_KUNNR = '0000050001'  FKIMG = '10.000' MEINS = 'EA'  BASE_PRICE = '100.00'  SGST_TAX_AMOUNT = '10.00'   CGST_TAX_AMOUNT = '10.00'   IGST_TAX_AMOUNT = '10.00'   CURRENCY = 'USD'
                                         CORE_VBELN = '8900010000'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '130000' )
                          (  E_COMM_VBELN = '1000008900'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000050001'  MATNR = '500000000000000050'  SHIP_TO_PARTY_KUNNR = '0000050001'  BILL_TO_PARTY_KUNNR = '0000050001'
                                         PAYER_KUNNR = '0000050001'  FKIMG = '5.000'  MEINS = 'EA'  BASE_PRICE = '50.00'   SGST_TAX_AMOUNT = '5.00'    CGST_TAX_AMOUNT = '5.00'    IGST_TAX_AMOUNT = '5.00'    CURRENCY = 'USD'
                                         CORE_VBELN = '8900010000'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '130500'  )
                          (  E_COMM_VBELN = '1000008901'  E_COMM_POSNR = '000010'  SOLD_TO_PARTY_KUNNR = '0000020001'  MATNR = '500000000000000005'  SHIP_TO_PARTY_KUNNR = '0000020001'  BILL_TO_PARTY_KUNNR = '0000020001'
                                         PAYER_KUNNR = '0000020001'  FKIMG = '20.000'  MEINS = 'EA'  BASE_PRICE = '120.00' SGST_TAX_AMOUNT = '5.00'    CGST_TAX_AMOUNT = '5.00'    IGST_TAX_AMOUNT = '5.00'    CURRENCY = 'SGD'
                                          CORE_VBELN = '8900010001'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '123051' )
                          (  E_COMM_VBELN = '1000008901'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000020001'  MATNR = '500000000000000025'  SHIP_TO_PARTY_KUNNR = '0000020001'  BILL_TO_PARTY_KUNNR = '0000020001'
                                         PAYER_KUNNR = '0000020001'  FKIMG = '5.000'   MEINS = 'EA'  BASE_PRICE = '25.00'  SGST_TAX_AMOUNT = '2.00'    CGST_TAX_AMOUNT = '2.00'    IGST_TAX_AMOUNT = '2.00'    CURRENCY = 'SGD'
                                         CORE_VBELN = '8900010001'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '123051' )
                          (  E_COMM_VBELN = '1000008902'  E_COMM_POSNR = '000010'  SOLD_TO_PARTY_KUNNR = '0000070001'  MATNR = '500000000000000010'  SHIP_TO_PARTY_KUNNR = '0000070001'  BILL_TO_PARTY_KUNNR = '0000070001'
                                         PAYER_KUNNR = '0000070001'  FKIMG = '12.000'  MEINS = 'EA'  BASE_PRICE = '500.00' SGST_TAX_AMOUNT = '12.00'   CGST_TAX_AMOUNT = '12.00'   IGST_TAX_AMOUNT = '12.00'   CURRENCY = 'JPY'
                                         CORE_VBELN = '8900010002'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '150005' )
                          (  E_COMM_VBELN = '1000008902'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000070001'  MATNR = '500000000000000025'  SHIP_TO_PARTY_KUNNR = '0000070001'  BILL_TO_PARTY_KUNNR = '0000070001'
                                         PAYER_KUNNR = '0000070001'  FKIMG = '2.000'  MEINS = 'EA'  BASE_PRICE = '100.00'  SGST_TAX_AMOUNT = '12.00'   CGST_TAX_AMOUNT = '12.00'   IGST_TAX_AMOUNT = '12.00'   CURRENCY = 'JPY'
                                         CORE_VBELN = '8900010002'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '150005' )
                          (  E_COMM_VBELN = '1000008903'  E_COMM_POSNR = '000010'  SOLD_TO_PARTY_KUNNR = '0000090001'  MATNR = '500000000000000015'  SHIP_TO_PARTY_KUNNR = '0000090001'  BILL_TO_PARTY_KUNNR = '0000090001'
                                         PAYER_KUNNR = '0000090001'  FKIMG = '80.000'  MEINS = 'EA'  BASE_PRICE = '400.00' SGST_TAX_AMOUNT = '8.00'    CGST_TAX_AMOUNT = '8.00'    IGST_TAX_AMOUNT = '8.00'    CURRENCY = 'INR'
                                          CORE_VBELN = '8900010003'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '153000' )
                          (  E_COMM_VBELN = '1000008903'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000090001'  MATNR = '500000000000000020'  SHIP_TO_PARTY_KUNNR = '0000090001'  BILL_TO_PARTY_KUNNR = '0000090001'
                                         PAYER_KUNNR = '0000090001'  FKIMG = '20.000'  MEINS = 'EA'  BASE_PRICE = '150.00' SGST_TAX_AMOUNT = '8.00'    CGST_TAX_AMOUNT = '8.00'    IGST_TAX_AMOUNT = '8.00'    CURRENCY = 'INR'
                                          CORE_VBELN = '8900010003'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '153500' )
                          (  E_COMM_VBELN = '1000008904'  E_COMM_POSNR = '000010' SOLD_TO_PARTY_KUNNR = '0000010001'   MATNR = '500000000000000020'  SHIP_TO_PARTY_KUNNR = '0000010001'  BILL_TO_PARTY_KUNNR = '0000010001'
                                         PAYER_KUNNR = '0000010001'  FKIMG = '5.000'   MEINS = 'EA'  BASE_PRICE = '1200.00' SGST_TAX_AMOUNT = '15.00'   CGST_TAX_AMOUNT = '5.00'    IGST_TAX_AMOUNT = '15.00'   CURRENCY = 'AUD'
                                         CORE_VBELN = '8900010004'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '170510' )
                          (  E_COMM_VBELN = '1000008904'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000010001'  MATNR = '500000000000000035'  SHIP_TO_PARTY_KUNNR = '0000010001'  BILL_TO_PARTY_KUNNR = '0000010001'
                                         PAYER_KUNNR = '0000010001'  FKIMG = '20.000'  MEINS = 'EA'  BASE_PRICE = '300.00'  SGST_TAX_AMOUNT = '15.00'   CGST_TAX_AMOUNT = '15.00'   IGST_TAX_AMOUNT = '15.00'   CURRENCY = 'AUD'
                                         CORE_VBELN = '8900010004'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '170510' )
                          (  E_COMM_VBELN = '1000008905'  E_COMM_POSNR = '000010'  SOLD_TO_PARTY_KUNNR = '0000080001'  MATNR = '500000000000000025'  SHIP_TO_PARTY_KUNNR = '0000080001'  BILL_TO_PARTY_KUNNR = '0000080001'
                                         PAYER_KUNNR = '0000080001'  FKIMG = '50.000'  MEINS = 'EA'  BASE_PRICE = '5000.00' SGST_TAX_AMOUNT = '20.00'   CGST_TAX_AMOUNT = '20.00'   IGST_TAX_AMOUNT = '20.00'   CURRENCY = 'CAD'
                                         CORE_VBELN = '8900010005'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '172500' )
                          (  E_COMM_VBELN = '1000008905'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000080001'  MATNR = '500000000000000030'  SHIP_TO_PARTY_KUNNR = '0000080001'  BILL_TO_PARTY_KUNNR = '0000080001'
                                         PAYER_KUNNR = '0000080001'  FKIMG = '20.000'  MEINS = 'EA'  BASE_PRICE = '1000.00' SGST_TAX_AMOUNT = '20.00'   CGST_TAX_AMOUNT = '20.00'   IGST_TAX_AMOUNT = '20.00'   CURRENCY = 'CAD'
                                         CORE_VBELN = '8900010005'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '172500' )
                          (  E_COMM_VBELN = '1000008906'  E_COMM_POSNR = '000010'  SOLD_TO_PARTY_KUNNR = '0000060001'  MATNR = '500000000000000045'  SHIP_TO_PARTY_KUNNR = '0000060001'  BILL_TO_PARTY_KUNNR = '0000060001'
                                         PAYER_KUNNR = '0000060001'  FKIMG = '140.000' MEINS = 'EA'  BASE_PRICE = '1800.00' SGST_TAX_AMOUNT = '40.00'   CGST_TAX_AMOUNT = '40.00'   IGST_TAX_AMOUNT = '40.00'   CURRENCY = 'GBP'
                                         CORE_VBELN = '8900010006'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '181020' )
                          (  E_COMM_VBELN = '1000008906'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000060001'  MATNR = '500000000000000030'  SHIP_TO_PARTY_KUNNR = '0000060001'  BILL_TO_PARTY_KUNNR = '0000060001'
                                         PAYER_KUNNR = '0000060001'  FKIMG = '60.000'  MEINS = 'EA'  BASE_PRICE = '1000.00' SGST_TAX_AMOUNT = '40.00'   CGST_TAX_AMOUNT = '40.00'   IGST_TAX_AMOUNT = '40.00'   CURRENCY = 'GBP'
                                         CORE_VBELN = '8900010006'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '181020' )
                          (  E_COMM_VBELN = '1000008907'  E_COMM_POSNR = '000010'  SOLD_TO_PARTY_KUNNR = '0000050001'  MATNR = '500000000000000050'  SHIP_TO_PARTY_KUNNR = '0000050001'  BILL_TO_PARTY_KUNNR = '0000050001'
                                         PAYER_KUNNR = '0000050001'  FKIMG = '90.000'  MEINS = 'EA'  BASE_PRICE = '550.00'  SGST_TAX_AMOUNT = '25.00'   CGST_TAX_AMOUNT = '25.00'   IGST_TAX_AMOUNT = '25.00'   CURRENCY = 'USD'
                                         CORE_VBELN = '8900010007'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '181020' )
                          (  E_COMM_VBELN = '1000008907'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000050001'  MATNR = '500000000000000005'  SHIP_TO_PARTY_KUNNR = '0000050001'  BILL_TO_PARTY_KUNNR = '0000050001'
                                         PAYER_KUNNR = '0000050001'  FKIMG = '10.000'  MEINS = 'EA'  BASE_PRICE = '440.00'  SGST_TAX_AMOUNT = '25.00'   CGST_TAX_AMOUNT = '25.00'   IGST_TAX_AMOUNT = '25.00'   CURRENCY = 'USD'
                                         CORE_VBELN = '8900010007'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '181020' )
                          (  E_COMM_VBELN = '1000008908'  E_COMM_POSNR = '000010'  SOLD_TO_PARTY_KUNNR = '0000070001'  MATNR = '500000000000000055'  SHIP_TO_PARTY_KUNNR = '0000070001'  BILL_TO_PARTY_KUNNR = '0000070001'
                                         PAYER_KUNNR = '0000070001'  FKIMG = '40.000'  MEINS = 'EA'  BASE_PRICE = '4000.00' SGST_TAX_AMOUNT = '30.00'   CGST_TAX_AMOUNT = '30.00'   IGST_TAX_AMOUNT = '30.00'   CURRENCY = 'JPY'
                                         CORE_VBELN = '8900010008'  CORE_POSNR = '000010'  CHANGED_DATA = '20230328'    CHANGED_TIME = '211500' )
                          (  E_COMM_VBELN = '1000008908'  E_COMM_POSNR = '000020'  SOLD_TO_PARTY_KUNNR = '0000070001'  MATNR = '500000000000000005'  SHIP_TO_PARTY_KUNNR = '0000070001'  BILL_TO_PARTY_KUNNR = '0000070001'
                                         PAYER_KUNNR = '0000070001'  FKIMG = '25.000'  MEINS = 'EA'  BASE_PRICE = '1200.00' SGST_TAX_AMOUNT = '30.00'   CGST_TAX_AMOUNT = '30.00'   IGST_TAX_AMOUNT = '30.00'   CURRENCY = 'JPY'
                                         CORE_VBELN = '8900010008'  CORE_POSNR = '000020'  CHANGED_DATA = '20230328'    CHANGED_TIME = '211500' )

                         ).


*    INSERT ZZT_ADRC_PS FROM TABLE @lt_adrc.
*    INSERT zzt_curc_ps FROM TABLE @lt_curc.
*    INSERT zzt_kna1_ps FROM TABLE @lt_kna1.
*    INSERT zzt_ps_mara FROM TABLE @lt_mara.
*    INSERT zzt_so_status FROM TABLE @lt_so_status.
*    INSERT zzt_so_type FROM TABLE @lt_so_type.
*    INSERT zzt_t001_ps FROM TABLE @lt_t001.
*    INSERT zzt_t005_ps FROM TABLE @lt_t005.
*    INSERT zzt_tvko FROM TABLE @lt_tvko.
*    INSERT ZZT_VBAK_PS FROM TABLE @lt_vbak.
*    INSERT ZZT_VBAP_PS FROM TABLE @lt_vbap.
*
*    check sy-subrc EQ 0.
*    out->write( 'SUCCESS' ).
*
*SELECT carrid connid loccuram loccurkey FROM sbook INTO TABLE lt_booking WHERE customid = lv_customer.
*
*SELECT FROM sbook. FIELDS carrid, connid, loccuram, loccurkey . WHERE customid = @lv_customer . INTO TABLE @lt_booking.
*SELECT carrid connid loccuram loccurkey . FROM sbook . WHERE customid = lv_customer . INTO TABLE lt_booking.
*SELECT FROM sbook . FIELDS carrid, connid, loccuram, loccurkey . INTO TABLE @lt_booking . WHERE customid = @lv_customer.
*SELECT carrid, connid, loccuram, loccurkey . FROM sbook . INTO TABLE @lt_booking . WHERE customid = @lv_customer.

  ENDMETHOD.
ENDCLASS.






