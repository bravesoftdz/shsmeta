object frmReplacement: TfrmReplacement
  Left = 0
  Top = 0
  Caption = #1047#1072#1084#1077#1085#1072' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' '#1080' '#1084#1077#1093#1072#1085#1080#1079#1084#1086#1074
  ClientHeight = 515
  ClientWidth = 779
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 779
    Height = 57
    Align = alTop
    TabOrder = 0
    object groupReplace: TGroupBox
      Left = 145
      Top = 1
      Width = 633
      Height = 55
      Align = alClient
      Caption = ' '#1052#1072#1090#1077#1088#1080#1072#1083#1072': '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label2: TLabel
        Left = 13
        Top = 21
        Width = 24
        Height = 13
        Caption = #1050#1086#1076':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 146
        Top = 21
        Width = 77
        Height = 13
        Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtSourceCode: TEdit
        Left = 40
        Top = 18
        Width = 98
        Height = 21
        Color = 14802912
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edtSourceName: TMemo
        Left = 229
        Top = 20
        Width = 396
        Height = 32
        Color = 14802912
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object rgroupType: TRadioGroup
      Left = 1
      Top = 1
      Width = 144
      Height = 55
      Align = alLeft
      Caption = ' '#1047#1072#1084#1077#1085#1072' '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Items.Strings = (
        #1052#1072#1090#1077#1088#1080#1072#1083#1086#1074
        #1052#1077#1093#1072#1085#1080#1079#1084#1086#1074)
      ParentFont = False
      TabOrder = 1
      OnClick = rgroupTypeClick
    end
  end
  object groupEntry: TGroupBox
    Left = 0
    Top = 57
    Width = 779
    Height = 104
    Align = alTop
    Caption = ' '#1042#1093#1086#1078#1076#1077#1085#1080#1103
    TabOrder = 1
    object ListEntry: TListView
      Left = 2
      Top = 15
      Width = 775
      Height = 87
      Align = alClient
      Checkboxes = True
      Columns = <
        item
          Caption = #1057#1084#1077#1090#1072
          Width = 300
        end
        item
          Caption = #1056#1072#1089#1094#1077#1085#1082#1072
          Width = 80
        end
        item
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083
          Width = 100
        end
        item
          Caption = #1053#1086#1088#1084#1072
          Width = 70
        end
        item
          Caption = #1050#1086#1083'-'#1074#1086
          Width = 70
        end
        item
          Caption = #1045#1076'. '#1080#1079#1084'.'
          Width = 80
        end>
      ColumnClick = False
      GridLines = True
      ReadOnly = True
      RowSelect = True
      PopupMenu = PMEntry
      TabOrder = 0
      ViewStyle = vsReport
      OnChange = ListEntryChange
      OnCustomDrawItem = ListEntryCustomDrawItem
    end
  end
  object groupCatalog: TGroupBox
    Left = 0
    Top = 250
    Width = 779
    Height = 232
    Align = alClient
    Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
    DoubleBuffered = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentDoubleBuffered = False
    ParentFont = False
    TabOrder = 2
    object Panel5: TPanel
      Left = 2
      Top = 15
      Width = 775
      Height = 215
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object LoadAnimator: TJvGIFAnimator
        Left = 0
        Top = 34
        Width = 775
        Height = 162
        AutoSize = False
        Center = True
        Image.Data = {
          101C0000474946383961D0000D00C41E00DDDDDDBDBDBDD1D1D1B1B1B1BFBFBF
          EFEFEFE1E1E1CFCFCFA8A8A8B9B9B9ACACACC9C9C9F4F4F4E5E5E5C7C7C7A1A1
          A1EDEDED979797B3B3B3E9E9E9F8F8F8D7D7D7C3C3C3CBCBCBC5C5C5F6F6F6D5
          D5D5D9D9D9F2F2F29D9D9DFFFFFF00000021FF0B4E45545343415045322E3003
          0100000021F904050A001E002C00000000D0000D000005FFA041205D699E68AA
          AE6CEBBE702CCF746DBF08E11189344881200FA1F8197F398B72392A1E91018C
          746A71FAAE8324554AC45EB55BAB174C151FC953F337BAAD3ED76D4BD72B4173
          D57576F80DE509132304401707021A1A7E89041680158E1B901B16404C4A8D91
          911894959798929B4C9D989A9596019E90A4A5A299A095A89FA58CA7A8AA9CB4
          9EB6A1B8A3AE8B9D02841B2412181A00060D1300090B84CF170E01CA13D5D5CC
          CED0D1D3D6D6067ADADCDDCBE0D0E2DDDFD9E1D4E8E5CFE7DEEEDBECF1DAEFF4
          D7F2D2F8E4EAE6FCE9EC6180974C400902C7BA4931C4F01001001C224A2CB0F0
          904544102746AC7811A3C68DC23A3EFCC881E3C5911F4DFF5A44A951A5C38C2D
          439E8439D1A5C7943257D294689365CD120B004C9028E991514219922ACD00C0
          9851474897266DFA14EA01A9539D3E8D2A956A55AE4BBD6EBD8A55EC51B25DB5
          9EC5CA54ED23B04ACDBE451BD6AD55B64D811A80C02003C58E8F2C48A44098C2
          DFAA8806173E5C5570E1C516003B72FCD87064C4941F337E9A19B2E4C4952D7F
          EE4C78B351D2A2312B2E7DB9F16ABF91F5F2CD9033B001B6B527DFC69ABB0286
          9D497BFFC69D7B38EFE2BBA50A074E1B3971CCCC973F6F9C7CA930D90CE41E82
          4BD8805D0DDC2978971C7E3CE0F2DFD193BF105A7C7AF6A1CD77547F1E7E65F9
          17E9CFB7FFD8BCEC090849865A490D9D54407BE90DD89A874807869660839A2D
          68208205AE04A167025EC85A850E69981A600A72284088877480002413442360
          740BAC389D482CBA789C8CCAB508628C37BE38938E3AF1F8928F37D568510E09
          348088880BE025E1764996B524784DA685645F52D647655D533A996595FB5D19
          D793D17899D596585AA9A543048840C20D6CB6E9E69B70C629270C3978100200
          21F904050A001E002C01000100CE000B000005FFA0374483677A568A28A7390C
          48D2A6D6DA7A9214DF16A6B0A79C2E30EBFD6E2F04B1686B25654C607078C3F8
          A4A6DCEE64BD226150AEB72501F36A581C6C293E3A6192DB23ADA958E2C504DB
          B4D9DCAB777B1E7D18785C8137848626297A891B38678E2D8A8012827D7F2D18
          1E93279579981B85809E7C908B2816A683A3A918AB612673072D131300090B2D
          17BD010DB6B801BB5CBEC027B706821E170EBFC1CA55C6D0CBD3C8C2C42618D6
          26C982BDCEC7DDD837DC1EDED2E1D4E9CFD7CAD9CCCDED7C0F162D1CF856941B
          020400F7F92E3CC2F00FA0BE7DFE6E702870F09386840605222C7862E1B6440F
          299A083850A3078B9C262AE4D0904F46850C43FF9EA803B12243899F36B4EC56
          02A09F81B56CAA3C8521E7890C1900EC6C25C0E7C6A0433768E87503A8509C23
          4741BD87746A450E4FF7156D5A95D252A31FB126DDC054E7A3AD001D0064E8A1
          420B0D0F3F56CCC0B04ECCB86B3168D06AA1405E8C1AFAE6DD7B57F0DC021608
          9B7CC8812AE2B6272A4836BCD1E2590BF8AE22564C14F360AF81FD56A45017B4
          BDC61B2940E05AD6210103AC619E9AE901686B930463DF980C3B62C7911745B6
          B02DBB556EAAB70769C0D07B6EF2C91E89EFB6D3DC8474E15777023590747971
          0A14B85B4D2D5E2B580E5D5756480EBEBCC30B609D0E85CB3EFCFCA5DFED3FAA
          EF9E27D8F6F7F1D75D703FA5C7005D6385D6D4BF667CA17614830E05E6E046A5
          B5B01E6526504092000DAE650187117A765862FB28A8D97D1510205A658F7538
          1A04F69836E1472D8638A36A1F5E25003CCA31A79B57AFFD18136DF8ECF81B40
          46627754728478C4010549BA565D58519AC052741954D90A9119302993931C68
          09176DD79DC3417F1ED471418C050A05226E173040959B6F5D28E75559ADB4D4
          027792C7E629BDF4595B060690E8D03682E223D55BF8092ADF9B69EE992807A3
          40DA47518E121A209FC311FA679A76EAC461080021F904050A001E002C010001
          00CE000B000005FFA0E73D482789A865210A2A0E0392B89ECAD28324D318A6B4
          2E892EE052F93C03947048B3F880A8DCAEB8828A840822F51664BA7A3F1A76F6
          F52595586DCA12EE4E51982A4EF1387B101E0519A5A9584E54096A221A1B1E80
          707F831E1B8688227182348D188F358A938E3C982E85959B929D1B9F818B8D87
          4D16A12894962A12A6A3AEAAB1A489422808030912002E131300090B34171701
          0DBFC101C470C6C8CA068BC60ED028C0D23CCFC9D713D9C5D5DC22C0008B1817
          E1D1CC2EC6C7E21ED88B1EE8D6E3DEE6F4EFE4D3F9EACD90DB50E84950810607
          0E3D440920E0CB0587020945616888E2604456A3287A380811C3240D0C0D22BC
          9069A2C387E768FF78D2B87164498D075DBAA0C4D2A2C74E1542564449722648
          983C5F76B9B9B346C9032247A91C85F42400A2222835DDF9F46852A88C988AAC
          EAD3D8D5A518A68A38A874A6D693655969B820766306AE7CCE52C52A554C8209
          27216602797067010B1A7CF2CD0B58A18502846978A830D86F61148C1B8FCD00
          31F04C0116FA4EFEBBF77062C31C085B8EBA418367C7A3A3620E8DDAAC69C415
          15F4AC98C1ABC49A1C6C63347952B708C6BC27D79EFDDB8F0191295D54A8107C
          ACCCDDB87D33FAE930C370A1D5A5F769DE523A4D83D7956BC070DCA11DE77009
          C9458F753B710F142818685F417AFCF956ABE397D8964386FD7CACF5DE7DED09
          480381F9CD9520C77B0BBA0560546BF5C781059FA9F55A85105E48DB5F024CB2
          5A751C82464306CF7950C88728C45762231A3AC7190D152C04DB64137ED4624B
          2FF211E3699B59D0214637FA17A2853CE238620602FC03A14E3B25891D0AD639
          891377512A696246225D60651F4CBA85E496D4D1F6E5932258A71D96D981C9DD
          415A92E941956EB2E902036F51C81F7806D8A9E3390C3885C18FA485D5276DF3
          013A1D5B834E96A7A1EE25DAD2538CD6B780A3D615DAC95A93FAC9285394D6C9
          A8809D5A1A97A09A9A452A551E84000021F904050A001E002C01000100CE000B
          000005FFA0277AC8938C238128A83820676BADADF7C628E6B1AD04D7165EEB15
          90E984232290D6FBC998281F6E341BD47CC567CD86C8E6B65CEFE8582B892583
          A9A86291D43009B168D306C66B74B7ECDECABFF9287E7B721E82281680231B18
          7A8712848B8D548F788C7F909632947D752D010392010409062D1300090B350E
          010DA6A86FACAE28A78417B2AF841EB8B4008418BC231306B6C122B5B1ADA6C4
          C9B3C2BE35B7CAB4CC2DD2CEC7BEAA87882D18011B35051E177D0204002D1CE3
          E59CE9EAE495EF23EBF1EE351C18ED281AE8EA05FA6A54F0A72E608B7EF34600
          DCA7084342111CEC0522486FA1408A102DDEA3428021443A950EE003A0C39C48
          752443FF8E2CC9EFC2491419529A5CA91225CB11155CD29C69B3264C992D5FD2
          038A53E7210210FE61D060CE023E804C0309B0101126D483FDC6A158B7B48606
          AA4AA3E2CC1AB60F59AB16C4AEF95A7544860269CD82DD0A576DA1A96D33760D
          74B6625CBE7345484850019FC140184A15F458C8A161C6741E7AC82011A705C5
          302BAF49FC585E0DCA901DC30B2D3922640BA5357BA8C079B467140A08513070
          738EEA98B51B339E9D9BE96EDA3E87F656CD81E81C0C423F0EFFBD7C6750E745
          937B289E3B1C6305762900C483B7C55BA74DF34EAF1BFE1F787E5FB5BA258FDE
          827A85B93D9C7B3FFEFC080DE9BDC315989FAE0501E5A1A09D7D6BB9A7D416F3
          A9231D7C05026CC30F461035F81A4C126EB45585280C541A86F741381D877378
          C8A0830D499601881E20F4198A1AE283E2061E72F0A268997907008185DCB212
          80FC7870000336F1181D903F6120E41C172C40A47047EAB6A4724D6AD0E093D3
          91D4241D4ADA682427590A485B94BB5019D37F0725492575575AD0253D1E8400
          0021F904050A001E002C01000100CE000B000005FFA0277A4AF924A367AD4899
          0E0382A6AC927A521CDC18D6DE03898CE71B0085B391A578930877A99EEBF5BC
          2D7FA9DC90C6CC56A398E9C8B91D4961591DAD962A25458180043AAA542C736E
          822EDA6C707C4B7B377E187966787C1E7E806B87238C12448329858F2A169490
          1B86938A969E849C927A9FA38189A27856090A0B23010E1801062913130009AF
          2317BDB4B6B88ABDB30DC0066F1E18BEC523B7C7440EBFCDC1D0D222CEC2CBC6
          D9C4DBD5CCD7D429C3D61ED8DFDBBB22CA781522B2070400291CF53D951B02F2
          F4F617A218F3F8DDC3B76F44BD020321692868904342111A16061471F0A1870A
          126FF4FB37D143457F043B7A74085221C391084BFF42CCD83025217D7F44F8C3
          7040630615FF6AF2038021A74D9E3E77F6C427406743A0448D52CC805461AF9F
          4337D1D4C8A1E9CAA742831E8DDA47C305A523AD5EF45A92A63EAA052C68A814
          9180C79618228E88B810ADDAB52230D6E597166F5E8C6EF9AA256AA18060BF17
          ED143E4CD870CBC19B042C7E8C7843C4C91439F465ABC1C25B8A141056CE87D9
          413C911C28609DEBB5964095632FB86EB83A6F6B9BB5135B989D39B762911932
          F8AE8081B747D5B0151BE7203CF91DD4CD395255269DDFF0E26354C0A640C100
          570F117373F7AE1534F9A454C5FA299AFE7B21B0E3BF87DFDE5D3ED91BF10979
          05CB5C7D3EFE55B9C7097CF5953747021330C65AB3678E659696008D09066164
          981D475284237077A1429DD985985E15A6E69052EB55C85D5AFA75A8E04A0C4A
          C899672E2E58E1051220E6517421E1069B65277910DC05EA5CB51C8EACC94695
          0041C6B61C0748DE101E701934598900D8F1232524544279E54A3DD6935B3E00
          E978034646DE005B7FEEEDD7DE845D7DC580506C2EF2DF9B5BC519DE027466C6
          539C64E209275B6EFE59A49F067507E3A0798685019F5E112A4270DED9D968A2
          F5EC9954A21E84000021F904050A001E002C01000100CE000B000005FFA0A778
          2439284F529296858CEB89A825662BC3EA0D67A0B72F1D6FF6C3046312E2CA62
          84952449DF1283130E10D25AD38A2D1E9F3DAF9304556ABFA624AD6421A0496B
          924D9225553616FA3451F76CF07A5A81257F797518863A8512457C8A1B1E831E
          2D927E808D7D7F91752D8E2B9A8C7B99909294A3793A73A7921217292B360106
          2B131300010B3A1717B2B4B67DBB0EBD25B5067D1EBB010DBEC6BA17C2B3C413
          CD2BC1CABEB73AC8BCCBD2D425D6D124C5C01718D7D2D9D5C9DDE3D3E5C2ED1E
          E4B95A7502F804003A1C1C369F1B04E8E3E7EFC2A3812BFAFD03889044BF020B
          4B68D0D0D0A13F0C3A2A50DC57E26144121B3612C46010A0058E1621FF969428
          3261C18C2D2DBE6488D283C795240E1CA8337117BF0C931EF974090023C00B07
          7E16159A346186A5000534EDC8012ACBA154AD820C38D5E153A384362025A8D5
          D258A260ED68C0EAD5435A3F6B71DAACFAB6E74A0D77DE7A9CB86222819F1035
          44B54010A2B689845D16202C582DC5C2161A83F40BF99100C21C4A50A0107885
          460D89A92EF620F9CE63A78B2593405C4071E8AD9721AB9E08BAF5EAB5E22C92
          7C74F2275B0F7973CFFD5DA102869AC3E5163FEE5BF9060CC23964F85D08B942
          B97F2ACEDDDD1777F38CC6916798AE3CFC779AE03C3890BBD940DDB83ADABFFD
          73B66306F796BBCE2DFB472AD9F962E9D74F5976C547017EDDFD269FD10E05AE
          B060827249C71F573F2178D54A0924635B4A910D265B77B5B90653882B64B018
          3E2C915882891608305866F69DC8A08A0E4184A263166C38576A9EB126E22788
          01D6628F344A2723213E9240C002DAF573413D574547DE8C1744C7810050AAA5
          DD784FEA70404C167599A094C48169D3942B7CC99C4B58CED8E4745992A6C19A
          548919566F2ED9B995762D28F5DE6F036270A3076A2EC0005A2E8625D5A15909
          9AA89CBB30EA957B83F66428A2104ABA9FA3176A3A1EA58F5AAA69A08F5AB228
          A62568F4E4A8F7091AD5019286000021F904050A001E002C01000100CE000B00
          0005FFA097748F677A43FA24A7695988D2A2C313CC18A60CF32021B7534E276B
          F9803858F19442B62CC4DEC0298C1A7FC1EA4E4A35E5B6D7AE07A3EC6167D0D8
          4C723EBD0808DCB22AC99A2A154BFD8949D83D1B1B187B747F8183766F861B1E
          845E7A8B904F16048B8D497E33871298969C2D64992D817A9D9A828E1E2FA980
          1B163C467133171801062D131300010B380EB6B8BA7FB4BFB727B9067F1EB4C0
          C713C9B3CC0DC1D0A017BFD3CEBB38D7CD26C87F18DDD9DFC2D1B5E41EB9DBA0
          3901E9C82C2D17E3D409BD42089F271B020400333870C8314A833F802D381420
          58F05FC08117341D4C28509C448714199E3088D184C0851866704478A262C816
          1534FF74F4F0D16243921E218A540993E5C288A32696AC88F3C40559FC5C1D08
          9861CCA90B432902381914E9C3A5479396CC00B5A0D38454999AD8A0E1EACEAA
          1BBB4A8D09D68406B14FB57AD050C12B59B56CDDB2E450D6434AB902EB1A9C81
          47E5C3857B4FA424F0178386822A39502C60C18300C167092F56BBD6EFE4C328
          355828B0D802E6AD6737770E6C37A5E89D8C49E3C9C319B5E799A763A66EC156
          F35FCF8FEF54C82D388FB19D72F158F81DD3E5C6B6C4E706F74D743986E4029D
          D7CC90417AF39E77BA4EAF8EBDF4F0EBA72C6CB74E911EDF3CB405C8A540C100
          5C83DD39648D9A96BE52B581F0D2C5BF417FDDFC6379C09E7BF69D30E07BEBB5
          C75FBC82045A15A07CFFA16582001CB526DB6BFC8466E15CB365A8D9861F6108
          DA879DCD50596C1C5AC05B6524BA66A28625F2A59962AE7D965D63A365D6A209
          ECC9E4218A21BEB8E3013A4D65DE4BE0D1A6DD0CD45D804F5817D424DF91C75D
          001D77324699E446457A84A5922BB1F46558CF6D699606188CF7E4565D2AD75D
          3F1D6170C0026BCE15A17F18AC18D7020CDCB7E25D7CFAE9609F5FE539A8A050
          1E40E85B7AAA1768A17A8AB5A89D8656F928A34AAA372975EE454A4B9F210000
          21F904050A001E002C01000100CE000B000005FFA0E70DD2838828F924A86859
          88D28E0312CC18A690AD54DE2D8B4ED6FBE186B3410D88C2C088A9E53136F3D9
          66C25D52DA726A8BD7664E01155999222F0F75C6054C6C426280B324D09E4AC5
          2221043177331B1B187D5D1E812D83857589288B86282F8E22908D78907E4D7C
          98841297829E58809D1E9F7F941E837C9A2E769D3A7117912217B6010D2D1313
          00010B2DB60EB8BABC78C1C328BB06C6B7B9C9C5331ECDC4CB381718C822CA2C
          C0D3CFD5DDC2CEDAD0E1D91EDBD1D7E7E9E6E3E8C518280402BEA11600331C1C
          398A1BF5F950EC2BD0CF1F818002F9C953A4E1A03E7E17EE2114B10F43447FF8
          5A0CB418CAA146881D276EBCF86843C68F0551FF6868289203C185282AB0D4F7
          B2C5026CF70EE8CBE00166A50DB67602F0A90AA8CE8F43435D382A3043527F02
          9852E4F0B46454A144072D7D58B59286A048B31AE54A544305B009BB16DDAA31
          03A1190424901421B3D5D4021604ADB4EB61A3070D2D64E66D4B7086CC860FF1
          AE8C5977A762C074F50C4E4810F24F0193EF5AB05C1473818F95196AC8DC3703
          5EC38D5B50A05018AA85CF943170D6300096819D684598C570FB63EE3C1A78E3
          9EFBB70206911932FC96DC3B21C7C0C1912B27CE7CB844EB81F734A7381DB585
          EDA57F0FF29870F909A852FB52157B356CA8F64D0D94FD4A7CB57CA5E9EDB3CF
          4FE13EC3DFFACDB01280FDCD47A07F2A19575FC481F8CD10A03F7458F51A68A4
          6DB0D284946D66D868B071A7986B1D96F6E1231786E81774A33948013F0280A8
          DA8A18B4482287146E48230AABB1B8218602B5D6C257A4E5182354027E259D00
          BF1834917A485EF762934A6257D2492824072589171C9924964B72D0DD7F5D72
          209E494B263726952258B9A56EC675F965823E09F0D59AA51950E13FE925279F
          8C7405B7000361F1F9179080A635A44A7316CA9D9D820E7881A21ED857217D90
          EA49DA6E8FB6901C218D261A287A9566B027A89F62E941080021F904050A001E
          002C01000100CE000B000005FFA0277AC9838CE3F024A848204AEB0D4820634A
          DC4AF5EDE9289EAD65F9C968C311A6084CF55A18D8F189B2E464C21B62304D2A
          8D3BAA68790D7B3D1896047509708989B3A76259C3E51B8C1D95C6EB6F713279
          7B4A812D833216862888508B238D7C8F22912316047E84228A9980786E281A1A
          120E37160D2D1300090B2D170E01A828AA01AD7C16B1A9067268B9B3BB37B0B2
          23B4321EC2A9ABC1BEC400B550C8BF72AFCC2213C0AED1C4D86CDAD6CEA1BBA5
          A11A040032051E458C02E62D1CE9178218E7EFEA8201F528054B32E5FA233860
          907728DF3B7EEB505470F7AEDF218601F9110C0531E0BD87003DC0F3301112BD
          83C750006837EF808C0C794AFF9E048041E53B962E517080790883C9972D6BDE
          44918166A80B3B03FA1C51C14350113D7332B22963A6D2111A8C361D4A09E8D4
          A717E8083824E0A908785E45684818B16554A2639BF213D4359DCCB55C31B82D
          EB2FED410C67D15AE070D0425E4A76DFE23D143822594A6DFB8A6254F86B81C3
          F2C26E2060E0249A7919350EC4DCF472CDCC7CC3FEB3DC51C442D09E155644CA
          9173C3D21E26577EED9A67EBCF4D37A360E1CF6A8BA431854A668A33F85703A2
          530744EE4FF9F1E14735326F11153687E94BA353C0EE31BA53E31EB687153367
          EC5CC77EFD5938AFF1F156EAEBEFFE8DDD58A3C0F77AD9839DEFA11C7B8D87F5
          671E3AE92934E05B054272A0814C18E087985C7D39185B62EF5820614AD47DF4
          9B00B6A8061A87B50504226EEF8C48D1871D4242D9492612B59A462D52B2E286
          298A65416619C418DB8C32E998078A82F4161670D4F926134B175E800103385D
          681393473658E402500A2761544B36499D51553E77A507546AA9D0056146E9E4
          015D6A84E42164A6E9D4850184000021F904050A001E002C01000100CE000B00
          0005FFA0277A418928A3380C4F925A3092AA6C3063D6394B1262BF18052AC5F3
          DD2CC2D9CA98C20487225EEF27B23893C4E9CCAACB32475728ED2BC2614745AA
          C7F9DCF55CA392657610782437428230DB6CEE5B187B7D1B16784D827C297E80
          4D16838B1B1887233090237E93799722999455826A1E8C9F6B7AA29E37A1848D
          95AB91AD65A73302179700061B090B2917BE010D2913130001BC604EC0C2C4A2
          BE0ECA23C306C6BDBFC1D1CCB4D6CBD3DACFD722D2CDDBD8C5DED0E1CCC765E4
          E9DDD5DFDCE338E01E0D0D15128A1EC338DE00293808C4706191060104008E10
          5880202D0D09670C2C6830E2C2890F2D5E745851A108861C3141F4F89143C84E
          2303FF62EC28D12445911A3D807C8932E6CC681C0A11C270A0A58739067DF9C4
          B0B3A7CA35455B02201AD4E8C5A57D3408550935124FA54C3149725AB2AAC80B
          5C65E6CC8A122CD6A866A9663500618285832221B66CE8C10E4AB92A1B6A3088
          F76281B77C2D14C80B34AE60C275B5F62DA937F05CC08607FB7D6BD74385CB87
          27271671B94266C685EF869649A1B108B653611A6899BAE66A95AD47497ABD91
          A66C0C2449C7C64CBBE4EE0A187A8BFD6D41B8C0D8997267C8F03B386BDB9771
          CF58DEDCB8CB1117002CBE1D96030503646FDBA6F03D7CA6B0E4C1A3EDCEC1AB
          8883B1D387D700BFA524B4E3CBCFA01F5FBF55F4FE7DD55D80EF49959F7A232C
          0011AF571BD0F799587FED65D863128A46A16312FD159506A331345A831C4AB6
          9086818908E1870D3EE8DD7513660899681C1056E1280E9A281389234C238A00
          29A5B05C2D19E5769C6D0DC6349C6D3C1A3964544A7200244BB0ADE3DA734C5A
          871C44561289259515592780942280C9637F087E75208A0431A0566534FAA2E6
          5318B0D9E0050BBCD9559C565D60A7584BC929D5017B7A071E9BF0D5B966507A
          1EFA95A1232C37680AF4D5B2A7A378A61002003B}
        Threaded = False
        Align = alClient
        ExplicitLeft = 304
        ExplicitTop = 80
        ExplicitWidth = 105
        ExplicitHeight = 105
      end
      object LoadLabel: TLabel
        AlignWithMargins = True
        Left = 3
        Top = 69
        Width = 769
        Height = 124
        Margins.Top = 35
        Align = alClient
        Alignment = taCenter
        Caption = #1048#1076#1105#1090' '#1079#1072#1075#1088#1091#1079#1082#1072'...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
        ExplicitWidth = 96
        ExplicitHeight = 13
      end
      object StatusBar1: TStatusBar
        Left = 0
        Top = 196
        Width = 775
        Height = 19
        Panels = <
          item
            Width = 650
          end
          item
            Width = 100
          end>
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 775
        Height = 34
        Align = alTop
        TabOrder = 1
        object lbFindCode: TLabel
          Left = 8
          Top = 11
          Width = 24
          Height = 13
          Caption = #1050#1086#1076':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lbFindName: TLabel
          Left = 133
          Top = 11
          Width = 77
          Height = 13
          Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077':'
        end
        object btnFind: TButton
          Left = 452
          Top = 5
          Width = 75
          Height = 25
          Caption = #1055#1086#1080#1089#1082
          Enabled = False
          TabOrder = 0
          OnClick = btnFindClick
        end
        object btnSelect: TButton
          Left = 672
          Top = 3
          Width = 96
          Height = 25
          Caption = #1042#1099#1073#1086#1088
          Enabled = False
          TabOrder = 1
          OnClick = btnSelectClick
        end
        object cbMat: TCheckBox
          Left = 538
          Top = 10
          Width = 75
          Height = 17
          Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
          Checked = True
          State = cbChecked
          TabOrder = 2
          OnClick = btnFindClick
        end
        object cbJBI: TCheckBox
          Left = 621
          Top = 9
          Width = 52
          Height = 17
          Caption = #1046#1041#1048
          TabOrder = 3
          OnClick = btnFindClick
        end
        object edtFindCode: TEdit
          Left = 37
          Top = 6
          Width = 91
          Height = 23
          TabOrder = 4
          OnKeyPress = edtFindKeyPress
        end
        object edtFindName: TEdit
          AlignWithMargins = True
          Left = 215
          Top = 6
          Width = 232
          Height = 23
          Margins.Left = 217
          Margins.Top = 5
          Margins.Bottom = 4
          TabOrder = 5
          OnKeyPress = edtFindKeyPress
        end
      end
      object ListSpr: TListView
        Left = 0
        Top = 34
        Width = 775
        Height = 162
        Align = alClient
        Columns = <
          item
            Caption = #1050#1086#1076
            Width = 100
          end
          item
            Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 350
          end
          item
            Caption = #1045#1076'. '#1080#1079#1084'.'
            Width = 70
          end
          item
            Caption = #1062#1077#1085#1072' '#1089' '#1053#1044#1057', '#1088#1091#1073
            Width = 100
          end
          item
            Caption = #1062#1077#1085#1072' '#1073#1077#1079' '#1053#1044#1057', '#1088#1091#1073
            Width = 110
          end>
        ColumnClick = False
        DoubleBuffered = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        GridLines = True
        ReadOnly = True
        RowSelect = True
        ParentDoubleBuffered = False
        ParentFont = False
        ShowWorkAreas = True
        TabOrder = 2
        ViewStyle = vsReport
        OnCustomDrawItem = ListSprCustomDrawItem
        OnDblClick = ListSprDblClick
        OnSelectItem = ListSprSelectItem
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 482
    Width = 779
    Height = 33
    Align = alBottom
    TabOrder = 3
    object btnReplace: TButton
      AlignWithMargins = True
      Left = 590
      Top = 4
      Width = 104
      Height = 25
      Align = alRight
      Caption = #1047#1072#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnReplaceClick
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 700
      Top = 4
      Width = 75
      Height = 25
      Align = alRight
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnDelReplacement: TButton
      Tag = 1
      Left = 464
      Top = 4
      Width = 120
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1084#1077#1085#1099
      TabOrder = 2
      Visible = False
      OnClick = btnReplaceClick
    end
  end
  object groupRep: TGroupBox
    Left = 0
    Top = 161
    Width = 779
    Height = 89
    Align = alTop
    Caption = ' '#1047#1072#1084#1077#1085#1080#1090#1100' '#1085#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    object Panel2: TPanel
      Left = 750
      Top = 15
      Width = 27
      Height = 72
      Align = alRight
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 2
        Top = -1
        Width = 24
        Height = 24
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000A21022C28830AAF33A70CE337B80CFF35B709FF2DA3
          05E3217E02AF0820002C00000000000000000000000000000000000000000000
          0000000000002C860EAF3FC114FF37C708FF34CB01FF33CC00FF33CC00FF33CB
          01FF33C302FF30B604FF207D01AF000000000000000000000000000000000306
          02083EB019E33DC710FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF33CC
          00FF33CC00FF33CC00FF31BE02FF29A001E3010500080000000000000000318A
          14AF40C913FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF259500FF2595
          00FF33CC00FF33CC00FF33CC00FF31BE02FF207D01AF00000000102A08344CCB
          22FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF2595
          00FF33CC00FF33CC00FF33CC00FF33CC00FF30B604FF09250034389718BB3ECC
          0FFF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF2595
          00FF33CC00FF33CC00FF33CC00FF33CC00FF33C302FF238802BB4DBB28E535CC
          03FF33CC00FF33CC00FF33CC00FF259500FF259500FFFFFFFFFFFFFFFFFF2595
          00FF259500FF259500FF259500FF33CC00FF33CB01FF2DA305E559D231FF33CC
          00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF259500FF33CC00FF33CC00FF35B709FF5CD434FF33CC
          00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF33CC00FF33CC00FF33CC00FF37B80CFF54BF30E536CC
          03FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF2595
          00FF33CC00FF33CC00FF33CC00FF33CC00FF34CB01FF33A80DE53F9B20BB43CF
          14FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF2595
          00FF33CC00FF33CC00FF33CC00FF33CC00FF37C708FF2B8D0ABB132C0B345BD6
          32FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FFFFFFFFFFFFFFFFFF33CC
          00FF33CC00FF33CC00FF33CC00FF33CC00FF3FC114FF0C270434000000003D92
          20AF4DD220FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF33CC
          00FF33CC00FF33CC00FF33CC00FF3DC710FF2C860EAF00000000000000000407
          040853BF2EE34DD220FF33CC00FF33CC00FF33CC00FF33CC00FF33CC00FF33CC
          00FF33CC00FF33CC00FF40C913FF3EB019E30306020800000000000000000000
          0000000000003D9220AF5BD632FF43CF14FF36CC03FF33CC00FF33CC00FF35CC
          03FF3ECC0FFF4CCB22FF318A14AF000000000000000000000000000000000000
          000000000000000000000F26072E3C9220AF50BD2CE35CD434FF59D231FF4AB9
          25E3368D18AF0D25052E00000000000000000000000000000000}
        OnClick = SpeedButton1Click
      end
      object SpeedButton2: TSpeedButton
        Left = 2
        Top = 24
        Width = 24
        Height = 24
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          000000000000000000000209212C0A2281AF0C2AA4E30C2DB3FF092BB2FF0524
          9EE3021A7BAF00061F2C00000000000000000000000000000000000000000000
          0000000000000E2684AF1335BCFF072BBEFF0127BDFF0026BDFF0026BCFF0126
          BCFF0227B8FF0326B0FF011979AF000000000000000000000000000000000203
          06081836AEE31033C0FF0026BFFF0025BBFF0025B8FF0024B6FF0024B6FF0024
          B6FF0025B8FF0025BBFF0226B5FF01209CE3000105080000000000000000142B
          89AF1336C3FF0026BFFF0025BAFF0024B6FF0024B2FF0023B0FF0023AFFF0023
          B0FF0024B2FF0024B6FF0025BAFF0226B5FF011979AF00000000080E29342143
          C7FF0026C1FF0025BBFF0024B6FF0023B1FF0023ADFF0022AAFF0022A9FF0022
          AAFF0023ADFF0023B1FF0024B6FF0025BBFF0326B0FF00072434183195BB0F34
          C6FF0026BEFF0025B8FF0024B2FF0023ADFF0022A8FF0021A4FF0021A2FF0021
          A4FF0022A8FF0023ADFF0024B2FF0025B8FF0227B8FF021C84BB2845B8E50329
          C3FF0026BDFF0024B6FF0023B0FF001E95FF001E95FF001E95FF001E95FF001E
          95FF001E95FF001E95FF001E95FF0024B6FF0126BCFF05249EE53151CFFF0027
          C3FF0026BCFF0024B6FFFEFEFFFFF9FAFEFFF4F6FDFFF0F2FCFFEBEEFBFFE6EA
          FAFFE1E6F9FFDCE2F8FF001E95FF0024B6FF0026BCFF092BB2FF3453D1FF0027
          C3FF0026BDFF0024B6FFFFFFFFFFFAFBFEFFF5F7FDFFF1F3FCFFECEFFBFFE7EB
          FAFFE2E7F9FFDDE2F8FF0023B0FF0024B6FF0026BDFF0C2DB3FF304CBDE5032A
          C6FF0026BEFF0025B8FF5970CDFF586EC9FF566CC6FF546AC3FF5269C1FF5167
          C2FF4F67C4FF4D66C7FF0024B2FF0025B8FF0127BDFF0D2AA4E520389ABB1439
          CBFF0026C1FF0025BBFF0024B6FF0023B1FF0023ADFF0022AAFF0022A9FF0022
          AAFF0023ADFF0023B1FF0024B6FF0025BBFF072BBEFF0A238ABB0B112B343252
          D3FF0027C4FF0026BFFF0025BAFF0024B6FF0024B2FF0023B0FF0023AFFF0023
          B0FF0024B2FF0024B6FF0025BAFF0026BFFF1335BCFF040B2734000000002037
          91AF2043CFFF0027C3FF0026BFFF0025BBFF0025B8FF0024B6FF0024B6FF0024
          B6FF0025B8FF0025BBFF0026BFFF1033C0FF0E2684AF00000000000000000404
          07082E4BBDE32043CFFF0027C4FF0026C1FF0026BEFF0026BDFF0026BCFF0026
          BDFF0026BEFF0026C1FF1336C3FF1836AEE30203060800000000000000000000
          000000000000203791AF3252D3FF1439CBFF032AC6FF0027C3FF0027C3FF0329
          C3FF0F34C6FF2143C7FF142B89AF000000000000000000000000000000000000
          00000000000000000000070D262E203690AF2C48BBE33453D1FF3151CFFF2543
          B6E3182F8BAF050B242E00000000000000000000000000000000}
        OnClick = SpeedButton2Click
      end
    end
    object grdRep: TStringGrid
      Left = 2
      Top = 15
      Width = 748
      Height = 72
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 16
      RowCount = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      ParentFont = False
      TabOrder = 1
      OnKeyPress = grdRepKeyPress
      OnMouseMove = grdRepMouseMove
      OnSelectCell = grdRepSelectCell
      OnSetEditText = grdRepSetEditText
    end
  end
  object qrRep: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    Left = 441
    Top = 153
  end
  object qrTemp: TFDQuery
    Connection = DM.Connect
    Transaction = DM.Read
    UpdateTransaction = DM.Write
    FetchOptions.AssignedValues = [evRecordCountMode]
    UpdateOptions.AssignedValues = [uvEDelete, uvEInsert, uvEUpdate]
    UpdateOptions.EnableDelete = False
    UpdateOptions.EnableInsert = False
    Left = 520
    Top = 145
  end
  object PMEntry: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PMEntryPopup
    Left = 608
    Top = 145
    object pmShowRep: TMenuItem
      Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1079#1072#1084#1077#1085#1103#1102#1097#1080#1077
      OnClick = pmShowRepClick
    end
    object pmCurRate: TMenuItem
      Caption = 'CurRate'
      object pmSelectRate: TMenuItem
        Tag = 1
        Caption = #1042#1099#1073#1088#1072#1090#1100
        OnClick = pmSelectRateClick
      end
      object pmDeselectRate: TMenuItem
        Caption = #1054#1090#1084#1077#1085#1080#1090#1100
        OnClick = pmSelectRateClick
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pmSelectAll: TMenuItem
      Tag = 1
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      OnClick = pmSelectAllClick
    end
    object pmDeselectAll: TMenuItem
      Caption = #1054#1090#1084#1077#1085#1080#1090#1100' '#1074#1089#1077
      OnClick = pmSelectAllClick
    end
  end
end
