{******************************************}
{                                          }
{             FastReport v4.0              }
{          Language resource file          }
{                                          }
{         Copyright (c) 1998-2008          }
{         by Alexander Tzyganenko,         }
{            Fast Reports Inc.             }
{                                          }
{******************************************}

unit frxrcInsp;

interface

implementation

uses frxRes;

const resXML =
'<?xml version="1.1" encoding="utf-8"?><Resources CodePage="1251"><StrRes Name="propActive" Text="Определяет, активен ли набор ' + 
'данных"/><StrRes Name="propActive.TfrxHighlight" Text="Определяет, активно ли условное выделение"/><StrRes N' + 
'ame="propAliasName" Text="Имя алиаса BDE"/><StrRes Name="propAlign" Text="Выравнивание объекта относительно р' + 
'одителя"/><StrRes Name="propAlignment" Text="Выравнивание текста объекта"/><StrRes Name="propAllowAllUp" Text="Опр�' + 
'�деляет, могут ли все кнопки группы быть отжаты"/><StrRes Name="propAllowEdit" Text="Определяет, мо�' + 
'�ет ли пользователь редактировать готовый отчет"/><StrRes Name="propAllowExpressions" Text="Определя�' + 
'�т, могут ли в тексте объекта находиться выражения"/><StrRes Name="propAllowGrayed" Text="Разрешает ' + 
'третье состояние чекбоксов"/><StrRes Name="propAllowHTMLTags" Text="Определяет, могут ли в тексте об' + 
'ъекта находиться HTML-тэги"/><StrRes Name="propAllowSplit" Text="Разрешает разрыв содержимого бэнда"' + 
'/><StrRes Name="propAuthor" Text="Автор отчета"/><StrRes Name="propAutoSize.TfrxPictureView" Text="Авто-размер картинки"/' + 
'><StrRes Name="propAutoWidth" Text="Авто-ширина текста"/><StrRes Name="propBackPicture" Text="Фоновая картинка стра' + 
'ницы"/><StrRes Name="propBarType" Text="Тип штрихкода"/><StrRes Name="propBevelInner" Text="Тип внутренней рамки"/><' + 
'StrRes Name="propBevelOuter" Text="Тип внешней рамки"/><StrRes Name="propBevelWidth" Text="Толщина рамки"/><StrRes Name="pr' + 
'opBorder" Text="Определяет, надо ли показывать внешнюю рамку вокруг объекта"/><StrRes Name="propBor' + 
'derStyle" Text="Стиль окна"/><StrRes Name="propBottomMargin" Text="Размер нижнего поля страницы"/><StrRes Name="prop' + 
'BrushStyle" Text="Стиль кисти, используемый при рисовании заливки объекта"/><StrRes Name="propCalcChec' + 
'kSum" Text="Определяет, надо ли вычислять контрольную сумму автоматически"/><StrRes Name="propCa' + 
'ncel" Text="Определяет, должна ли срабатывать кнопка при нажатии клавиши Esc"/><StrRes Name="propC' + 
'aption" Text="Заголовок элемента управления"/><StrRes Name="propCellFields" Text="Имена полей БД, распол�' + 
'�женных в ячейках таблицы"/><StrRes Name="propCellLevels" Text="Количество уровней в ячейках табли�' + 
'�ы"/><StrRes Name="propCenter" Text="Определяет, надо ли центрировать картинку внутри объекта"/><Str' + 
'Res Name="propCharset" Text="Набор символов шрифта"/><StrRes Name="propCharSpacing" Text="Промежуток между симв�' + 
'�лами"/><StrRes Name="propCheckColor" Text="Цвет галочки"/><StrRes Name="propChecked" Text="Определяет, отмечен ли �' + 
'�лемент управления"/><StrRes Name="propCheckStyle" Text="Тип галочки"/><StrRes Name="propChild" Text="Дочерний бэ�' + 
'�д, связанный с данным бэндом"/><StrRes Name="propClipped" Text="Определяет, надо ли выводить текс�' + 
'� только внутри объекта"/><StrRes Name="propCollate" Text="Определяет, надо ли разбирать по копиям' + 
'"/><StrRes Name="propColor.TFont" Text="Цвет шрифта"/><StrRes Name="propColor" Text="Цвет объекта"/><StrRes Name="propColor.TfrxF' + 
'rame" Text="Цвет рамки"/><StrRes Name="propColor.TfrxHighlight" Text="Цвет объекта, если условное выделение �' + 
'�ктивно"/><StrRes Name="propColumnFields" Text="Имена полей БД, расположенных в заголовке колонок та' + 
'блицы"/><StrRes Name="propColumnGap" Text="Промежуток между колонками бэнда"/><StrRes Name="propColumnLevels" Text="' + 
'Количество уровней в заголовке колонок таблицы"/><StrRes Name="propColumns" Text="Количество кол' + 
'онок на бэнде"/><StrRes Name="propColumnWidth" Text="Ширина колонки бэнда"/><StrRes Name="propCondition" Text="Услов' + 
'ие группировки. При изменении значения этого выражения формируется новая группа"/' + 
'><StrRes Name="propCondition.TfrxHighlight" Text="Выражение для условного выделения. Если значение этог�' + 
'� выражения равно True, выделение будет активно"/><StrRes Name="propConnected" Text="Определяет, акти' + 
'вно ли подключение к БД"/><StrRes Name="propConvertNulls" Text="Определяет, должны ли пустые значени' + 
'я полей БД быть конвертированы в 0, False или пустую строку, в зависимости от типа пол�' + 
'�"/><StrRes Name="propCopies" Text="Количество копий"/><StrRes Name="propCursor" Text="Форма курсора объекта"/><StrR' + 
'es Name="propDatabaseName" Text="Имя базы данных"/><StrRes Name="propDataField" Text="Имя поля БД, к которому прив�' + 
'�зан объект"/><StrRes Name="propDataSet" Text="Набор данных, к которому привязан объект"/><StrRes Name="pro' + 
'pDate" Text="Дата"/><StrRes Name="propDateFormat" Text="Формат даты"/><StrRes Name="propDecimalSeparator" Text="Разделитель �' + 
'�елой и дробной частей числа"/><StrRes Name="propDefault" Text="Определяет, сработает ли кнопка пр' + 
'и нажатии клавиши Enter"/><StrRes Name="propDefHeight" Text="Высота строки таблицы по умолчанию"/><StrRes' + 
' Name="propDescription.TfrxReportOptions" Text="Описание отчета"/><StrRes Name="propDescription" Text="Описание объекта"/' + 
'><StrRes Name="propDiagonal" Text="Определяет, является ли линия диагональной"/><StrRes Name="propDisplayFormat" ' + 
'Text="Форматирование выводимых значений"/><StrRes Name="propDoublePass" Text="Определяет, является л' + 
'и отчет двухпроходным"/><StrRes Name="propDown" Text="Определяет, нажата ли кнопка"/><StrRes Name="propDown' + 
'ThenAcross" Text="Определяет, как будет разбита на страницы большая таблица"/><StrRes Name="propDrive' + 
'rName" Text="Имя драйвера BDE"/><StrRes Name="propDropShadow" Text="Определяет, показывать ли тень"/><StrRes Name' + 
'="propDuplex" Text="Режим дуплексной печати"/><StrRes Name="propEditMask" Text="Маска для редактирования т' + 
'екста"/><StrRes Name="propEnabled" Text="Определяет, разрешен ли элемент управления"/><StrRes Name="propEngi' + 
'neOptions" Text="Свойства движка отчета"/><StrRes Name="propExpression" Text="Выражение, значение которог�' + 
'� будет отображено в объекте"/><StrRes Name="propExpressionDelimiters" Text="Символы, используемые для о' + 
'бозначения выражений в тексте"/><StrRes Name="propFieldAliases" Text="Алиасы полей БД"/><StrRes Name="propFilte' + 
'r" Text="Выражение фильтрации записей набора данных"/><StrRes Name="propFiltered" Text="Определяет, н' + 
'адо ли использовать фильтрацию, указанную в свойстве Filter"/><StrRes Name="propFlowTo" Text="Объек�' + 
'�, который будет показывать текст, не поместившийся в данном объекте"/><StrRes Name="propFont"' + 
' Text="Параметры шрифта"/><StrRes Name="propFooterAfterEach" Text="Определяет, надо ли показывать подва�' + 
'� после каждой строки данных"/><StrRes Name="propFormatStr" Text="Строка форматирования"/><StrRes Name="pro' + 
'pFrame" Text="Параметры рамки"/><StrRes Name="propGapX" Text="Отступ текста слева и справа от границ о�' + 
'�ъекта"/><StrRes Name="propGapY" Text="Отступ текста сверху и снизу от границ объекта"/><StrRes Name="prop' + 
'Glyph" Text="Картинка элемента управления"/><StrRes Name="propGroupIndex" Text="Позволяет объединять кн' + 
'опки в группу"/><StrRes Name="propHAlign" Text="Выравнивание текста по горизонтали"/><StrRes Name="propHeigh' + 
't" Text="Высота объекта"/><StrRes Name="propHideZeros" Text="Определяет, надо ли скрывать объекты с ну�' + 
'�евыми значениями"/><StrRes Name="propHighlight" Text="Параметры условного выделения"/><StrRes Name="propInd' + 
'exName" Text="Имя индекса"/><StrRes Name="propInitString" Text="Строка инициализации принтера для печати' + 
' матричных отчетов"/><StrRes Name="propItems" Text="Список строк объекта"/><StrRes Name="propKeepAspectRatio" Text="' + 
'Сохранять пропорции изображения"/><StrRes Name="propKeepChild" Text="Определяет, должен ли бэнд в�' + 
'�водиться на той же странице, что и его child"/><StrRes Name="propKeepFooter" Text="Определяет, должен �' + 
'�и бэнд выводиться на той же странице, что и его footer"/><StrRes Name="propKeepHeader" Text="Определяе�' + 
'�, должен ли бэнд выводиться на той же странице, что и его header"/><StrRes Name="propKeepTogether" Text="' + 
'Определяет, должна ли группа бэндов выводиться на одной странице"/><StrRes Name="propKind.TfrxF' + 
'ormat" Text="Тип форматирования"/><StrRes Name="propKind" Text="Тип кнопки"/><StrRes Name="propLargeDesignHeight" Text="Оп' + 
'ределяет, будет ли страница иметь большую высоту в режиме дизайнера"/><StrRes Name="propLayou' + 
't" Text="Размещение картинки"/><StrRes Name="propLeft" Text="Координата Х объекта"/><StrRes Name="propLeftMargin" ' + 
'Text="Размер левого поля страницы"/><StrRes Name="propLines" Text="Текст объекта"/><StrRes Name="propLineSpacing" ' + 
'Text="Промежуток между строками текста"/><StrRes Name="propLoginPrompt" Text="Определяет, надо ли пок�' + 
'�зывать диалог с именем/паролем при подключении к БД"/><StrRes Name="propMargin" Text="Расстояние' + 
' между картинкой и краем элемента управления"/><StrRes Name="propMaster" Text="Главный набор дан�' + 
'�ых, для образования связей master-detail"/><StrRes Name="propMasterFields" Text="Связанные поля главного �' + 
'� подчиненного набора данных"/><StrRes Name="propMaxLength" Text="Максимальная длина текста"/><StrRes N' + 
'ame="propMaxWidth" Text="Максимальная ширина колонки"/><StrRes Name="propMemo" Text="Текст объекта"/><StrRes Name' + 
'="propMinWidth" Text="Минимальная ширина колонки"/><StrRes Name="propMirrorMargins" Text="Зеркальные поля стр' + 
'аницы"/><StrRes Name="propModalResult" Text="Определяет, с каким результатом кнопка закрывает мода�' + 
'�ьную форму"/><StrRes Name="propName.TFont" Text="Имя шрифта"/><StrRes Name="propName.TfrxReportOptions" Text="Имя отчета"/' + 
'><StrRes Name="propName" Text="Имя объекта"/><StrRes Name="propNumGlyphs" Text="Количество картинок, заданных в �' + 
'�войстве Glyph"/><StrRes Name="propOpenDataSource" Text="Определяет, надо ли автоматически открывать на' + 
'бор данных"/><StrRes Name="propOrientation" Text="Ориентация страницы"/><StrRes Name="propOutlineText" Text="Текст, к' + 
'оторый будет отображен в &#38;#34;Дереве отчета&#38;#34; в окне предварительном просмотр�' + 
'�"/><StrRes Name="propOutlineVisible" Text="Определяет, показывать ли &#38;#34;Дерево отчета&#38;#34; в окне п' + 
'редварительного просмотра"/><StrRes Name="propOutlineWidth" Text="Ширина &#38;#34;Дерева отчета&#38;#34;"/><' + 
'StrRes Name="propPageNumbers.TfrxPrintOptions" Text="Номера страниц, которые должны быть напечатаны"/><StrRes ' + 
'Name="propPaperHeight" Text="Высота страницы"/><StrRes Name="propPaperWidth" Text="Ширина страницы"/><StrRes Name="propPar' + 
'agraphGap" Text="Отступ параграфа"/><StrRes Name="propParams.TfrxBDEDatabase" Text="Параметры подключения к БД"/' + 
'><StrRes Name="propParams" Text="Параметры запроса"/><StrRes Name="propParentFont" Text="Определяет, надо ли испо�' + 
'�ьзовать настройки шрифта родителя"/><StrRes Name="propPassword" Text="Пароль отчета"/><StrRes Name="propPas' + 
'swordChar" Text="Определяет символ, используемый при отображении пароля"/><StrRes Name="propPicture" T' + 
'ext="Картинка"/><StrRes Name="propPicture.TfrxReportOptions" Text="Картинка отчета"/><StrRes Name="propPosition" Text="Пози�' + 
'�ия окна по умолчанию"/><StrRes Name="propPreviewOptions" Text="Настройки предварительного просмотр�' + 
'�"/><StrRes Name="propPrintable" Text="Определяет, надо ли печатать объект. В любом случае объект бу' + 
'дет виден в окне просмотра"/><StrRes Name="propPrintChildIfInvisible" Text="Определяет, надо ли печатать' + 
' дочерний бэнд, если основной бэнд невидим"/><StrRes Name="propPrinter" Text="Принтер, который буд' + 
'ет выбран при печати отчета"/><StrRes Name="propPrintIfDetailEmpty" Text="Определяет, надо ли печатать ' + 
'бэнд, если его подбэнды не содержат записей"/><StrRes Name="propPrintIfEmpty" Text="Определяет, надо' + 
' ли печатать страницу, если все ее дата-бэнды не имеют записей"/><StrRes Name="propPrintOnFirstPage"' + 
' Text="Определяет, надо ли печатать бэнд на первой странице"/><StrRes Name="propPrintOnLastPage" Text="О�' + 
'�ределяет, надо ли печатать бэнд на последней странице"/><StrRes Name="propPrintOnParent" Text="Опре�' + 
'�еляет, выводить ли содержимое вложенного отчета на родительском бэнде"/><StrRes Name="pro' + 
'pPrintOnPreviousPage" Text="Определяет, начинать ли печать очередной страницы на свободном ме�' + 
'�те предыдущей страницы"/><StrRes Name="propPrintOptions" Text="Настройки печати"/><StrRes Name="propPrintPages" Te' + 
'xt="Определяет, какие страницы печатать - все, нечетные или четные"/><StrRes Name="propRangeBegin" ' + 
'Text="Начальная точка навигации по набору данных"/><StrRes Name="propRangeEnd" Text="Конечная точка ' + 
'навигации по набору данных"/><StrRes Name="propRangeEndCount" Text="Количество записей в наборе дан�' + 
'�ых, если RangeEnd = reCount"/><StrRes Name="propReadOnly" Text="Устанавливает режим &#38;#34;только для чтения' + 
'&#38;#34;"/><StrRes Name="propRepeatHeaders" Text="Определяет, надо ли повторять вывод заголовков на все�' + 
'� страницах"/><StrRes Name="propReportOptions" Text="Настройки отчета"/><StrRes Name="propReprintOnNewPage" Text="Опреде' + 
'ляет, надо ли повторять вывод бэнда на всех страницах"/><StrRes Name="propRestrictions" Text="Набор �' + 
'�лагов, запрещающих те или иные действия"/><StrRes Name="propRightMargin" Text="Размер правого поля ' + 
'страницы"/><StrRes Name="propRotation.TfrxBarCodeView" Text="Ориентация штрихкода"/><StrRes Name="propRotation" Text="По�' + 
'�орот текста"/><StrRes Name="propRowCount" Text="Количество строк в дата-бэнде, если он не подключе' + 
'н к данным"/><StrRes Name="propRowFields" Text="Имена полей БД, расположенных в заголовке строк таб' + 
'лицы"/><StrRes Name="propRowLevels" Text="Количество уровней в заголовке строк таблицы"/><StrRes Name="prop' + 
'RTLReading" Text="Определяет, надо ли использовать направление текста справа налево"/><StrRes' + 
' Name="propSessionName" Text="Имя сессии BDE"/><StrRes Name="propShadowColor" Text="Цвет тени"/><StrRes Name="propShadowWidth" Text="' + 
'Размер тени"/><StrRes Name="propShape" Text="Тип фигуры"/><StrRes Name="propShiftMode" Text="Режим смещения объек' + 
'та"/><StrRes Name="propShowColumnHeader" Text="Определяет, показывать ли заголовки колонок"/><StrRes Name="pro' + 
'pShowColumnTotal" Text="Определяет, показывать ли итог по колонкам"/><StrRes Name="propShowDialog" Text="Опре�' + 
'�еляет, показывать ли диалог печати в окне предварительного просмотра"/><StrRes Name="propS' + 
'howRowHeader" Text="Определяет, показывать ли заголовки строк"/><StrRes Name="propShowRowTotal" Text="Опреде' + 
'ляет, показывать ли итог по строкам"/><StrRes Name="propShowText" Text="Определяет, показывать ли �' + 
'�екст под штрихкодом"/><StrRes Name="propSize" Text="Размер шрифта"/><StrRes Name="propSorted" Text="Определяет' + 
', сортировать ли список"/><StrRes Name="propSpacing" Text="Промежуток между картинкой и надписью"/' + 
'><StrRes Name="propSQL" Text="Выражение SQL"/><StrRes Name="propStartNewPage" Text="Определяет, формировать ли раз�' + 
'�ыв страницы перед печатью бэнда"/><StrRes Name="propStretch" Text="Растягивать картинку по разме' + 
'рам объекта"/><StrRes Name="propStretched" Text="Определяет, может ли объект растягиваться"/><StrRes Nam' + 
'e="propStretchMode" Text="Режим растягивания объекта"/><StrRes Name="propStyle.TFont" Text="Стиль шрифта"/><StrRes ' + 
'Name="propStyle" Text="Стиль элемента управления"/><StrRes Name="propStyle.TfrxFrame" Text="Стиль рамки"/><StrRes Nam' + 
'e="propSuppressRepeated" Text="Определяет, скрывать ли повторяющиеся значения"/><StrRes Name="propTableName" ' + 
'Text="Имя таблицы"/><StrRes Name="propTag" Text="Тэг объекта, число"/><StrRes Name="propTagStr" Text="Тэг объекта, ' + 
'выражение"/><StrRes Name="propText" Text="Текст объекта"/><StrRes Name="propTitleBeforeHeader" Text="Определяет, над' + 
'о ли показывать заголовок отчета перед заголовком страницы"/><StrRes Name="propTop" Text="Коор�' + 
'�ината Y объекта"/><StrRes Name="propTopMargin" Text="Размер верхней границы страницы"/><StrRes Name="propTyp"' + 
' Text="Тип рамки"/><StrRes Name="propUnderlines" Text="Определяет, подчеркивать ли каждую строку текс�' + 
'�а"/><StrRes Name="propURL" Text="Выражение - URL объекта"/><StrRes Name="propUserName" Text="Пользовательское имя' + 
' объекта"/><StrRes Name="propVAlign" Text="Выравнивание текста по вертикали"/><StrRes Name="propVersionBuild" Text' + 
'="Версия, build"/><StrRes Name="propVersionMajor" Text="Версия, major version"/><StrRes Name="propVersionMinor" Text="Версия, minor ' + 
'version"/><StrRes Name="propVersionRelease" Text="Версия, release"/><StrRes Name="propVisible" Text="Определяет, видим ли об�' + 
'�ект"/><StrRes Name="propWidth" Text="Ширина объекта"/><StrRes Name="propWidth.TfrxFrame" Text="Толщина рамки"/><StrRes Na' + 
'me="propWindowState" Text="Начальное состояние окна"/><StrRes Name="propWordBreak" Text="Разбивать русские сл�' + 
'�ва по слогам"/><StrRes Name="propWordWrap" Text="Определяет, надо ли переносить текст по словам"/><S' + 
'trRes Name="propZoom.TfrxBarCodeView" Text="Масштаб штрихкода"/><StrRes Name="propConnectionName" Text="Имя коннекта к б�' + 
'�зе данных, используемой в отчете"/><StrRes Name="propCurve" Text="Степень закругления углов скр�' + 
'�гленного прямоугольника"/><StrRes Name="propDrillDown" Text="Определяет, является ли группа раск�' + 
'�ываемой (drill-down)"/><StrRes Name="propFontStyle" Text="Стиль шрифта"/><StrRes Name="propHideIfSingleDataRecord" Text="Прята' + 
'ть подвал группы, если в группе только одна строка данных"/><StrRes Name="propOutlineExpand" Text="Оп' + 
'ределяет, надо ли раскрывать дерево отчета"/><StrRes Name="propPlainCells" Text="Определяет, как пе' + 
'чатать несколько ячеек - рядом или друг под другом"/><StrRes Name="propPrintMode" Text="Режим печат' + 
'и: обычный, печать с разбивкой больших листов на малые, печать нескольких малых ли�' + 
'�тов на большом"/><StrRes Name="propPrintOnSheet" Text="Размер страницы для печати. Используется, ес�' + 
'�и PrintMode &#38;#60;&#38;#62; pmDefault"/><StrRes Name="propResetPageNumbers" Text="Сбрасывать нумерацию страниц при �' + 
'�ечати группы. Также необходимо включить опцию StartNewPage"/><StrRes Name="propReverse" Text="Определя' + 
'ет, надо ли печатать страницы в обратном порядке"/><StrRes Name="propShowFooterIfDrillDown" Text="Показы' + 
'вать подвал группы, когда группа свернута (drill-down)"/><StrRes Name="propSizeMode" Text="Режим отобра�' + 
'�ения объекта OLE"/><StrRes Name="propVersion" Text="Версия FastReport"/><StrRes Name="propWideBarRatio" Text="Относительн' + 
'ая ширина широких полосок штрихкода"/><StrRes Name="propWysiwyg" Text="Определяет, должен ли объе' + 
'кт Rich использовать холст принтера для форматирования текста. Принтер должен быть ' + 
'установлен и готов."/><StrRes Name="propArrowEnd" Text="Определяет, надо ли рисовать стрелку на ко�' + 
'�це линии"/><StrRes Name="propArrowLength" Text="Длина стрелки"/><StrRes Name="propArrowSolid" Text="Определяет, надо' + 
' ли рисовать закрашенную стрелку"/><StrRes Name="propArrowStart" Text="Определяет, надо ли рисоват�' + 
'� стрелку на начале линии"/><StrRes Name="propArrowWidth" Text="Ширина стрелки"/><StrRes Name="propCloseDataSource" T' + 
'ext="Определяет, надо ли закрывать набор данных, когда отчет построен"/><StrRes Name="propDataba' + 
'se" Text="Соединение с базой данных"/><StrRes Name="propIndexFieldNames" Text="Имена индексных полей"/><StrRe' + 
's Name="propCommandTimeOut" Text="Количество времени, необходимое для завершения запроса"/><StrRes Nam' + 
'e="propExpandDrillDown" Text="Определяет, надо ли развернуть все drill-down группы при первом запуск' + 
'е отчета"/><StrRes Name="propWysiwyg.TfrxMemoView" Text="Определяет, надо ли показывать текст в режиме WY' + 
'SIWYG"/><StrRes Name="propLeftLine" Text="Левая линия рамки"/><StrRes Name="propTopLine" Text="Верхняя линия рамки"/><' + 
'StrRes Name="propRightLine" Text="Правая линия рамки"/><StrRes Name="propBottomLine" Text="Нижняя линия рамки"/><StrRe' + 
's Name="propColor.TfrxFrameLine" Text="Цвет линии"/><StrRes Name="propStyle.TfrxFrameLine" Text="Стиль линии"/><StrRes Name="propWi' + 
'dth.TfrxFrameLine" Text="Толщина линии"/><StrRes Name="propFileLink" Text="Выражение или имя файла, содержаще' + 
'го картинку"/><StrRes Name="propEndlessWidth" Text="Бесконечная ширина страницы. Страница будет рас' + 
'ти вширь в зависимости от выводимых данных"/><StrRes Name="propEndlessHeight" Text="Бесконечная выс�' + 
'�та страницы. Страница будет расти в высоту в зависимости от выводимых данных"/><StrRe' + 
's Name="propAddHeight" Text="Увеличивает высоту ячейки на указанный размер"/><StrRes Name="propAddWidth" Text=' + 
'"Увеличивает ширину ячейки на указанный размер"/><StrRes Name="propAllowDuplicates" Text="Определяет' + 
', может ли ячейка таблицы содержать одинаковые строковые значения"/><StrRes Name="propJoinEqua' + 
'lCells" Text="Определяет, надо ли объединять одинаковые ячейки в строке"/><StrRes Name="propNextCross' + 
'" Text="Указатель на следующий кросс, который будет показан рядом справа"/><StrRes Name="propNe' + 
'xtCrossGap" Text="Промежуток между кросс-таблицами"/><StrRes Name="propShowCorner" Text="Определяет, надо �' + 
'�и показывать элементы в левом верхнем углу таблицы"/><StrRes Name="propSuppressNullRecords" Text="Опре' + 
'деляет, надо ли пропускать пустые записи"/><StrRes Name="propShowTitle" Text="Определяет, надо ли п' + 
'оказывать заголовок таблицы"/><StrRes Name="propAutoSize" Text="Определяет, надо ли автоматическ�' + 
'� подбирать размер ячеек"/><StrRes Name="propShowHint" Text="Определяет, надо ли показывать подска' + 
'зку при наведении курсора на объект в предпросмотре"/><StrRes Name="propHint" Text="Текст подск�' + 
'�зки"/><StrRes Name="propPaperSize" Text="Размер бумаги"/><StrRes Name="propPageCount" Text="Определяет, кол-во повт' + 
'орений при выводе страницы"/><StrRes Name="propBackPictureVisible" Text="Определяет, надо ли показыват' + 
'ь фоновый рисунок"/><StrRes Name="propBackPicturePrintable" Text="Определяет, надо ли печатать фоновый �' + 
'�исунок"/><StrRes Name="propHightQuality" Text="Отображать картинку в более высоком качестве"/><StrRes Na' + 
'me="propLockType" Text="Specifies the lock type to use when opening a dataset"/><StrRes Name="propIgnoreDupParams" Text="Игнорировать па' + 
'раметры с одинаковыми именами в редакторе параметров"/><StrRes Name="propTransparent" Text="Опреде' + 
'ляет, надо ли показывать картинку прозрачной"/><StrRes Name="propTransparentColor" Text="Цвет прозрач' + 
'ности"/><StrRes Name="propIgnoreNulls" Text="Позволяет игнорировать Null значения в диаграмме"/><StrRes Na' + 
'me="propShowClildIfDrillDown" Text="Определяет, надо ли показывать дочерний бэнд если группа свер�' + 
'�ута"/></Resources>' + 
' ';

initialization
  frxResources.AddXML(resXML);

end.
