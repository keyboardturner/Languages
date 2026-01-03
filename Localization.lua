local _, Lang = ...; -- Let's use the private table passed to every .lua 

local L = {}
Lang.L = L

local function defaultFunc(L, key)
 -- If this function was called, we have no localization for this key.
 -- We could complain loudly to allow localizers to see the error of their ways, 
 -- but, for now, just return the key as its own localization. This allows you to—avoid writing the default localization out explicitly.
 return key;
end
setmetatable(L, {__index=defaultFunc});

local LOCALE = GetLocale()

local colorThingS = "|cff9ce6d9"
local colorThingE = "|r"

if LOCALE == "enUS" then
-- The EU English game client also
-- uses the US English locale code.
	L["Languages"] = "Languages"
	L["Language"] = "Language"
	L["SLASH_1"] = "/languages"
	L["SLASH_2"] = "/language"
	L["SLASH_3"] = "/lang"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "Understand"
	L["TogglePrefixOff"] = "Language Prefix: Off"
	L["TogglePrefixOn"] = "Language Prefix: On"
	L["TogglePrefixTextOff"] = "Toggling off automated language prefix."
	L["TogglePrefixTextOn"] = "Toggling off automated language prefix."
	L["TogglePrefixTT"] = "Controls if the currently selected language automatically prefixes the user's message."
	L["Diction"] = "Diction"
	L["Settings"] = SETTINGS
	L["Profiles"] = "Profiles"
	L["ResetAccSettings"] = "Resets all settings specific to the account section. This will not reset character-specific settings."
	L["ResetCharSettings"] = "Resets all settings specific to the character section. This will not reset account-specific settings."
	L["ResetAccSettingsConfirm"] = "Are you sure you want to reset the account-specific settings for Languages?"
	L["ResetCharSettingsConfirm"] = "Are you sure you want to reset this character's specific settings for Languages?"
	L["ApplyPresetConfirm"] = "Are you sure you want to overwrite your current learned languages?"
	L["AddonPrefixColor"] = "Languages Prefix Color"
	L["AccountSettings"] = "Account Settings"
	L["CharacterSettings"] = "Character Settings"
	L["MinimapTooltip"] = "Languages\nClick to toggle Languages menu."
	L["GlyphsOff"] = "Turning glyphs off."
	L["GlyphsOn"] = "Turning glyphs on."
	L["UseGlyphs"] = "Unlearned languages use glyphs"
	L["UseGlyphsTT"] = "Controls if an unlearned language uses glyphs, when available, to replace the individual characters. Some languages may not have glyphs available yet."
	L["SpeechBubblesOff"] = "Turning speech bubble translations off."
	L["SpeechBubblesOn"] = "Turning speech bubble translations on."
	L["SpeechBubbles"] = "Show in speech bubbles"
	L["SpeechBubblesTT"] = "Controls if untranslated languages will show up in speech bubbles.\nBlizzard API limits this feature from working in instanced content."
	L["CombatOptionOn"] = "Turning translations during combat on."
	L["CombatOptionOff"] = "Turning translations during combat off."
	L["CombatOption"] = "Function during combat"
	L["CombatOptionTT"] = "Controls if the addon will function in combat"
	L["FactionOptionOn"] = "Ignoring faction language on."
	L["FactionOptionOff"] = "Ignoring faction language off."
	L["FactionOption"] = "Ignore own faction's languages"
	L["FactionOptionTT"] = "Controls if the addon will ignore the prefix option for \"Common\" while on an Alliance character or \"Orcish\" for a Horde character."
	L["LinkToTotalRP3Off"] = "Total RP 3 link disabled for this character."
	L["LinkToTotalRP3On"] = "Total RP 3 link enabled for this character."
	L["LinkToTotalRP3"] = "Link to Total RP 3 Profile"
	L["LinkToTotalRP3TT"] = "Automatically change the character's profile according to the Total RP 3 profile. If multiple characters use the same profile, this should retain settings on those characters.\nRequires the addon Total RP 3"
	L["SettingLanguageTo"] = "Setting language to:"
	L["EnableUnderstand"] = "Enable Understand"
	L["DisableUnderstand"] = "Disable Understand"
	L["Dialect"] = "Dialect"
	L["DialectOff"] = "Dialect: Off"
	L["DialectOn"] = "Dialect: On"
	L["UseDialectTT"] = "Controls if the user currently speaks with a dialect while speaking, e.g. \"What do you want\" becomes \"Waschu wan'?\"."
	L["SettingDialectTo"] = "Setting dialect to:"
	L["CurrentlySpeaking"] = "Currently speaking:"
	L["NoPrefixBaseLang"] = "Don't use the prefix if speaking your faction's base language (Common/Orcish as Alliance/Horde respectively)."
	L["LanguagePreset"] = "Learn Language Presets"
	L["ImportGameplay"] = "Gameplay"
	L["ImportGameplayTT"] = "Learn preset default languages that your race would in normal gameplay mechanics.\nThis will overwrite your current learned languages."
	L["ImportRecommended"] = "Recommended"
	L["ImportRecommendedTT"] = "Learn preset languages your race / class likely would have learned in their probable history.\nThis will overwrite your current learned languages."
	L["ThisLangHasRunesTT"] = "This language can display runes when unlearned."
	L["ToggleLanguageLearnedTT"] = "Click to toggle your ability to understand this language when spoken by yourself and others."
	L["ToggleLanguageSpokenTT"] = "Click to set this language as your prefix."
	L["UseAutoShapeshiftOff"] = "Automatic Shapeshift language disabled for this character."
	L["UseAutoShapeshiftOn"] = "Automatic Shapeshift language enabled for this character."
	L["UseAutoShapeshift"] = "Automatic Shapeshift language"
	L["UseAutoShapeshiftTT"] = "Shapeshifting into a form will automatically change your language to its association.\nRequires: Shadowform, Metamorphosis." --  Druid Forms, Ghost Wolf are planned maybe later 
	L["LoadingProfile"] = "Loading Profile"
	L["HelpCMD"] = "You can use "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/language"..colorThingE..", or "..colorThingS.."/lang"..colorThingE.." to access slash commands. The list of slash command sub-options available:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - toggle the [Language] prefix on/off."..
	"\n"..colorThingS.."open"..colorThingE.." - open the options frame."..
	"\n"..colorThingS.."minimap"..colorThingE.." - toggle the minimap button on/off."..
	"\nAdditionally, you can set a language, such as for example "..colorThingS.."/Darnassian"..colorThingE.."."
	L["OnlyInCharacter"] = "Only In Character"
	L["OnlyInCharacterTT"] = "Only Enable Prefix / Dialect while 'In Character'.\nRequires the addon Total RP 3"
	L["RuneSize"] = "Glyph Size"
	L["DisablePrefix"] = "Disable Prefix"
	L["EnablePrefix"] = "Enable Prefix"
	L["ShowSelectionButton"] = "Show Languages Mini-Button"
	L["ShowSelectionButtonTT"] = "Toggles a small button on screen from which to access learned language selection."
	L["SelectLanguage"] = "Select Language"
	L["OpenMenu"] = "Open Menu"
	L["DragFrame"] = "Drag Frame"
	L["LeftClick"] = "Left-Click"
	L["RightClick"] = "Right-Click"
	L["ShiftDrag"] = "Shift-Drag"

	-- official languages
	L["Common"] = 		"Common"			--7
	L["Darnassian"] = 	"Darnassian"		--2
	L["Dwarvish"] = 	"Dwarvish"			--6
	L["Gnomish"] = 		"Gnomish"			--13
	L["Draenei"] = 		"Draenei"			--35
	L["Orcish"] = 		"Orcish"			--1
	L["Zandali"] = 		"Zandali"			--14
	L["Taurahe"] = 		"Taurahe"			--3
	L["Forsaken"] = 	"Forsaken"			--33
	L["Thalassian"] = 	"Thalassian"		--10
	L["Goblin"] = 		"Goblin"			--40
	L["Shalassian"] = 	"Shalassian"		--181
	L["Vulpera"] = 		"Vulpera"			--285
	L["Pandaren"] = 	"Pandaren"			--42
	L["Draconic"] = 	"Draconic"			--11
	L["Demonic"] = 		"Demonic"			--8
	L["Titan"] = 		"Titan"				--9
	L["Kalimag"] = 		"Kalimag"			--12
	L["Shath'Yar"] = 	"Shath'Yar"			--178
	L["Nerubian"] = 	"Nerubian"			--307
	L["Sprite"] = 		"Sprite"			--168
	L["Nerglish"] = 	"Nerglish"			--179
	L["Moonkin"] = 		"Moonkin"			--180
	L["Furbolg"] = 		"Furbolg"			--303
	L["Earthen"] = 		"Earthen"			--304
	L["Hara'ni"] = 		"Hara'ni"			--309
			--
	-- technically fanon
	L["Gutterspeak"] = 			"Gutterspeak" -- Language Gutterspeak
	--deDE		Gossensprache
	--esES		Viscerálico
	--esMX		Viscerálico
	--frFR		Bas-parler
	--itIT		Non Morto
	--ptBR		Guturalês
	--ruRU		Нежити
	--koKR		언데드어
	--zhCN		亡灵语
	--zhTW		不死族語

	L["Ancient Pandaren"] = 	"Ancient Pandaren" -- Ancient Pandaren Fishing Charm
	--deDE		Uralter Pandaren
	--esES		Pandaren antiguo
	--esMX		Pandaren antiguo
	--frFR		Pandaren ancien
	--itIT		Pandaren antico
	--ptBR		Pandaren antigo
	--ruRU		Древний пандарен
	--koKR		고대 판다렌
	--zhCN		古代熊猫人
	--zhTW		古代熊貓人

	L["Broker"] = 				"Broker" -- Broker
	--deDE		Mittler
	--esES		Especulador
	--esMX		Negociante
	--frFR		Négociant
	--itIT		Alienatore
	--ptBR		Corretor
	--ruRU		Брокер
	--koKR		중개자
	--zhCN		掮灵
	--zhTW		仲介者

	L["Cypher"] = 				"Cypher" -- Cyphers of the First Ones
	--deDE		Chiffren
	--esES		Claves
	--esMX		Códigos
	--frFR		Cryptogrammes
	--itIT		Codici
	--ptBR		Cifras
	--ruRU		Шифры
	--koKR		암호
	--zhCN		密文
	--zhTW		暗語

	L["Arathi"] = 				"Arathi" -- Arathi Bartender's Shelves
	--deDE		Arathi
	--esES		Arathi
	--esMX		Arathi
	--frFR		Arathie
	--itIT		Arathi
	--ptBR		Arathi
	--ruRU		Аратии
	--koKR		아라시
	--zhCN		阿拉希
	--zhTW		阿拉希

	L["Mogu"] = 				"Mogu" -- Mogu
	--deDE		Mogu
	--esES		Mogu
	--esMX		Mogu
	--frFR		Mogu
	--itIT		Mogu
	--ptBR		Mogu
	--ruRU		Могу
	--koKR		모구
	--zhCN		魔古族
	--zhTW		魔古

	L["Ethereal"] = 				"Ethereal" -- Ethereal Citizen
	--deDE		Astral
	--esES		Etéreo
	--esMX		Etéreo
	--frFR		Éthérien
	--itIT		Etereo
	--ptBR		Etéreo
	--ruRU		Эфириал
	--koKR		에테리얼
	--zhCN		虚灵
	--zhTW		以太

	L["K'areshi"] = 				"K'areshi" -- K'areshi Sentry
	--deDE		K'areshi
	--esES		K'areshi
	--esMX		K'areshi
	--frFR		K'areshi
	--itIT		K'areshi
	--ptBR		K'areshi
	--ruRU		К'ареши
	--koKR		크아레쉬
	--zhCN		卡雷什
	--zhTW		凱瑞西

	-- other languages to include eventually
		--Apexis
		--Drogbar
		--Drust
		--Hozen
		--Jinyu
		--Mantid
		--Nathrezim
		--Nazja
		--Ogre
		--Pygmy
		--Qiraji
		--Quilboar
		--Ravenspeech
		--Tol'vir
		--Tuskarr
		--Vrykul
		--
		--
		--
		--
		--
		--
		--
		--
		--
		--




return end

if LOCALE == "esMX" then
-- Spanish translations go here
	L["Languages"] = "Idiomas"
	L["Language"] = "Idioma"
	L["SLASH_1"] = "/idiomas"
	L["SLASH_2"] = "/idiomas"
	L["SLASH_3"] = "/idiomas"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "Entender"
	L["TogglePrefixOff"] = "Prefijo de idioma: desactivado"
	L["TogglePrefixOn"] = "Prefijo de idioma: activado"
	L["TogglePrefixTextOff"] = "Desactivar el prefijo de idioma automatizado."
	L["TogglePrefixTextOn"] = "Desactivar el prefijo de idioma automatizado."
	L["TogglePrefixTT"] = "Controla si el idioma seleccionado actualmente antepone automáticamente el mensaje del usuario."
	L["Diction"] = "Dicción"
	L["Settings"] = SETTINGS
	L["Profiles"] = "Perfiles"
	L["ResetAccSettings"] = "Restablece todas las configuraciones específicas de la sección de cuenta. Esto no restablecerá la configuración específica del personaje."
	L["ResetCharSettings"] = "Restablece todas las configuraciones específicas de la sección de personajes. Esto no restablecerá la configuración específica de la cuenta."
	L["ResetAccSettingsConfirm"] = "¿Está seguro de que desea restablecer la configuración específica de la cuenta para Idiomas?"
	L["ResetCharSettingsConfirm"] = "¿Estás seguro de que quieres restablecer la configuración específica de idiomas de este personaje?"
	L["ApplyPresetConfirm"] = "¿Está seguro de que desea sobrescribir los idiomas aprendidos actualmente?"
	L["AddonPrefixColor"] = "Idiomas Prefijo Color"
	L["AccountSettings"] = "Configuraciones de la cuenta"
	L["CharacterSettings"] = "Configuración de personajes"
	L["MinimapTooltip"] = "Idiomas\nHaga clic para alternar el menú Idiomas."
	L["GlyphsOff"] ="Desactivando glifos."
	L["GlyphsOn"] = "Activando glifos."
	L["UseGlyphs"] = "Los idiomas no aprendidos usan glifos"
	L["UseGlyphsTT"] = "Controla si un idioma no aprendido utiliza glifos, cuando están disponibles, para reemplazar los caracteres individuales. Es posible que algunos idiomas aún no tengan glifos disponibles."
	L["SpeechBubblesOff"] = "Desactivar las traducciones de bocadillos."
	L["SpeechBubblesOn"] = "Activando la traducción de bocadillos."
	L["SpeechBubbles"] = "Mostrar en bocadillos"
	L["SpeechBubblesTT"] = "Controla si los idiomas no traducidos aparecerán en los bocadillos.\nLa API de Blizzard limita el funcionamiento de esta función en contenido instanciado."
	L["CombatOptionOn"] = "Activar las traducciones durante el combate."
	L["CombatOptionOff"] = "Desactivar las traducciones durante el combate."
	L["CombatOption"] = "Función durante el combate"
	L["CombatOptionTT"] = "Controla si el complemento funcionará en combate."
	L["FactionOptionOn"] = "Ignorando el lenguaje de la facción."
	L["FactionOptionOff"] = "Ignorar el lenguaje de facción desactivado."
	L["FactionOption"] = "Ignorar los idiomas de la propia facción."
	L["FactionOptionTT"] = "Controla si el complemento ignorará la opción de prefijo para \"Común\" mientras esté en un personaje de la Alianza o \"Orco\" para un personaje de la Horda."
	L["LinkToTotalRP3Off"] = "Enlace total de RP 3 deshabilitado para este personaje."
	L["LinkToTotalRP3On"] = "Enlace total de RP 3 habilitado para este personaje."
	L["LinkToTotalRP3"] = "Enlace al perfil de Total RP 3"
	L["LinkToTotalRP3TT"] = "Cambia automáticamente el perfil del personaje según el perfil Total RP 3. Si varios personajes usan el mismo perfil, esto debería conservar la configuración de esos personajes.\nRequiere el complemento Total RP 3"
	L["SettingLanguageTo"] = "Configuración del idioma en:"
	L["EnableUnderstand"] = "Habilitar comprensión"
	L["DisableUnderstand"] = "Deshabilitar entender"
	L["Dialect"] = "Dialecto"
	L["DialectOff"] = "Dialecto: Desactivado"
	L["DialectOn"] = "Dialecto: encendido"
	L["UseDialectTT"] = "Controla si el usuario actualmente habla con un dialecto mientras habla, p. \"¿Qué quieres\" se convierte en \"Waschu wan'?\"."
	L["SettingDialectTo"] = "Configurando el dialecto en:"
	L["CurrentlySpeaking"] = "Actualmente hablando:"
	L["NoPrefixBaseLang"] = "No uses el prefijo si hablas el idioma base de tu facción (Común/Orco como Alianza/Horda respectivamente)."
	L["LanguagePreset"] = "Aprender ajustes preestablecidos de idioma"
	L["ImportGameplay"] = "Como se Juega"
	L["ImportGameplayTT"] = "Aprende los idiomas predeterminados preestablecidos que usaría tu raza en la mecánica de juego normal.\nEsto sobrescribirá los idiomas aprendidos actualmente."
	L["ImportRecommended"] = "Recomendado"
	L["ImportRecommendedTT"] = "Aprenda idiomas preestablecidos que su raza/clase probablemente habría aprendido en su historial probable.\nEsto sobrescribirá los idiomas aprendidos actualmente."
	L["ThisLangHasRunesTT"] = "Este idioma puede mostrar runas cuando no se aprende."
	L["ToggleLanguageLearnedTT"] = "Haga clic para alternar su capacidad de comprender este idioma cuando lo hablan usted mismo y otros."
	L["ToggleLanguageSpokenTT"] = "Haga clic para establecer este idioma como su prefijo."
	L["UseAutoShapeshiftOff"] = "Idioma de cambio de forma automático deshabilitado para este personaje."
	L["UseAutoShapeshiftOn"] = "Idioma de cambio de forma automático habilitado para este personaje."
	L["UseAutoShapeshift"] = "Idioma de cambio de forma automático"
	L["UseAutoShapeshiftTT"] = "Cambiar de forma a una forma cambiará automáticamente su idioma a su asociación.\nRequiere: Forma de sombra, Metamorfosis."
	L["LoadingProfile"] = "Cargando perfil"
	L["HelpCMD"] = "Puede utilizar "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/idiomas"..colorThingE..", o "..colorThingS.."/lang"..colorThingE.." para acceder a los comandos de barra diagonal. La lista de subopciones de comandos de barra diagonal disponibles:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - activa o desactiva el prefijo [Language]."..
	"\n"..colorThingS.."open"..colorThingE.." - abre el marco de opciones."..
	"\n"..colorThingS.."minimap"..colorThingE.." - activa o desactiva el botón del minimapa."..
	"\nAdemás, puede configurar un idioma, como por ejemplo "..colorThingS.."/Darnassiano"..colorThingE.."."
	L["OnlyInCharacter"] = "Solo en personaje"
	L["OnlyInCharacterTT"] = "Solo activa el prefijo / dialecto mientras estás \"En personaje\".\nRequiere el addon Total RP 3"
	L["RuneSize"] = "Tamaño del glifo"
	L["DisablePrefix"] = "Desactivar prefijo"
	L["EnablePrefix"] = "Activar prefijo"
	L["ShowSelectionButton"] = "Mostrar minibotón de idiomas"
	L["ShowSelectionButtonTT"] = "Activa un pequeño botón en pantalla para acceder a la selección de idiomas aprendidos."
	L["SelectLanguage"] = "Seleccionar idioma"
	L["OpenMenu"] = "Abrir menú"
	L["DragFrame"] = "Arrastrar marco"
	L["LeftClick"] = "Clic izquierdo"
	L["RightClick"] = "Clic derecho"
	L["ShiftDrag"] = "MAYÚS + arrastrar"


	L["Common"] = 		"Lengua común"		--7
	L["Darnassian"] = 	"Darnassiano"		--2
	L["Dwarvish"] = 	"Enánico"			--6
	L["Gnomish"] = 		"Gnomótico"			--13
	L["Draenei"] = 		"Draenei"			--35
	L["Orcish"] = 		"Orco"				--1
	L["Zandali"] = 		"Zandali"			--14
	L["Taurahe"] = 		"Taurahe"			--3
	L["Forsaken"] = 	"Renegado"			--33
	L["Thalassian"] = 	"Thalassiano"		--10
	L["Goblin"] = 		"Goblin"			--40
	L["Shalassian"] = 	"Shalassiano"		--181
	L["Vulpera"] = 		"Vulpera"			--285
	L["Pandaren"] = 	"Pandaren"			--42
	L["Draconic"] = 	"Dracónico"			--11
	L["Demonic"] = 		"Demoníaco"			--8
	L["Titan"] = 		"Titánico"			--9
	L["Kalimag"] = 		"Kalimag"			--12
	L["Shath'Yar"] = 	"Shath'Yar"			--178
	L["Nerubian"] = 	"Nerubiano"			--307
	L["Sprite"] = 		"Duende"			--168
	L["Nerglish"] = 	"Nerglish"			--179
	L["Moonkin"] = 		"Lechúcico lunar"	--180
	L["Furbolg"] = 		"Fúrbolg"			--303
	L["Earthen"] = 		"Terráneo"			--304
	L["Hara'ni"] = 		"Hara'ni"			--309

	L["Gutterspeak"] = 			"Viscerálico"
	L["Ancient Pandaren"] = 	"Pandaren antiguo"
	L["Broker"] = 				"Negociante"
	L["Cypher"] = 				"Códigos"
	L["Arathi"] = 				"Arathi"
	L["Mogu"] = 				"Mogu"
	L["Ethereal"] = 			"Etéreo"
	L["K'areshi"] = 			"K'areshi"

return end

if LOCALE == "esES" then
-- Spanish translations go here
	L["Languages"] = "Idiomas"
	L["Language"] = "Idioma"
	L["SLASH_1"] = "/idiomas"
	L["SLASH_2"] = "/idiomas"
	L["SLASH_3"] = "/idiomas"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "Entender"
	L["TogglePrefixOff"] = "Prefijo de idioma: desactivado"
	L["TogglePrefixOn"] = "Prefijo de idioma: activado"
	L["TogglePrefixTextOff"] = "Desactivar el prefijo de idioma automatizado."
	L["TogglePrefixTextOn"] = "Desactivar el prefijo de idioma automatizado."
	L["TogglePrefixTT"] = "Controla si el idioma seleccionado actualmente antepone automáticamente el mensaje del usuario."
	L["Diction"] = "Dicción"
	L["Settings"] = SETTINGS
	L["Profiles"] = "Perfiles"
	L["ResetAccSettings"] = "Restablece todas las configuraciones específicas de la sección de cuenta. Esto no restablecerá la configuración específica del personaje."
	L["ResetCharSettings"] = "Restablece todas las configuraciones específicas de la sección de personajes. Esto no restablecerá la configuración específica de la cuenta."
	L["ResetAccSettingsConfirm"] = "¿Está seguro de que desea restablecer la configuración específica de la cuenta para Idiomas?"
	L["ResetCharSettingsConfirm"] = "¿Estás seguro de que quieres restablecer la configuración específica de idiomas de este personaje?"
	L["ApplyPresetConfirm"] = "¿Está seguro de que desea sobrescribir los idiomas aprendidos actualmente?"
	L["AddonPrefixColor"] = "Idiomas Prefijo Color"
	L["AccountSettings"] = "Configuraciones de la cuenta"
	L["CharacterSettings"] = "Configuración de personajes"
	L["MinimapTooltip"] = "Idiomas\nHaga clic para alternar el menú Idiomas."
	L["GlyphsOff"] ="Desactivando glifos."
	L["GlyphsOn"] = "Activando glifos."
	L["UseGlyphs"] = "Los idiomas no aprendidos usan glifos"
	L["UseGlyphsTT"] = "Controla si un idioma no aprendido utiliza glifos, cuando están disponibles, para reemplazar los caracteres individuales. Es posible que algunos idiomas aún no tengan glifos disponibles."
	L["SpeechBubblesOff"] = "Desactivar las traducciones de bocadillos."
	L["SpeechBubblesOn"] = "Activando la traducción de bocadillos."
	L["SpeechBubbles"] = "Mostrar en bocadillos"
	L["SpeechBubblesTT"] = "Controla si los idiomas no traducidos aparecerán en los bocadillos.\nLa API de Blizzard limita el funcionamiento de esta función en contenido instanciado."
	L["CombatOptionOn"] = "Activar las traducciones durante el combate."
	L["CombatOptionOff"] = "Desactivar las traducciones durante el combate."
	L["CombatOption"] = "Función durante el combate"
	L["CombatOptionTT"] = "Controla si el complemento funcionará en combate."
	L["FactionOptionOn"] = "Ignorando el lenguaje de la facción."
	L["FactionOptionOff"] = "Ignorar el lenguaje de facción desactivado."
	L["FactionOption"] = "Ignorar los idiomas de la propia facción."
	L["FactionOptionTT"] = "Controla si el complemento ignorará la opción de prefijo para \"Común\" mientras esté en un personaje de la Alianza o \"Orco\" para un personaje de la Horda."
	L["LinkToTotalRP3Off"] = "Enlace total de RP 3 deshabilitado para este personaje."
	L["LinkToTotalRP3On"] = "Enlace total de RP 3 habilitado para este personaje."
	L["LinkToTotalRP3"] = "Enlace al perfil de Total RP 3"
	L["LinkToTotalRP3TT"] = "Cambia automáticamente el perfil del personaje según el perfil Total RP 3. Si varios personajes usan el mismo perfil, esto debería conservar la configuración de esos personajes.\nRequiere el complemento Total RP 3"
	L["SettingLanguageTo"] = "Configuración del idioma en:"
	L["EnableUnderstand"] = "Habilitar comprensión"
	L["DisableUnderstand"] = "Deshabilitar entender"
	L["Dialect"] = "Dialecto"
	L["DialectOff"] = "Dialecto: Desactivado"
	L["DialectOn"] = "Dialecto: encendido"
	L["UseDialectTT"] = "Controla si el usuario actualmente habla con un dialecto mientras habla, p. \"¿Qué quieres\" se convierte en \"Waschu wan'?\"."
	L["SettingDialectTo"] = "Configurando el dialecto en:"
	L["CurrentlySpeaking"] = "Actualmente hablando:"
	L["NoPrefixBaseLang"] = "No uses el prefijo si hablas el idioma base de tu facción (Común/Orco como Alianza/Horda respectivamente)."
	L["LanguagePreset"] = "Aprender ajustes preestablecidos de idioma"
	L["ImportGameplay"] = "Como se Juega"
	L["ImportGameplayTT"] = "Aprende los idiomas predeterminados preestablecidos que usaría tu raza en la mecánica de juego normal.\nEsto sobrescribirá los idiomas aprendidos actualmente."
	L["ImportRecommended"] = "Recomendado"
	L["ImportRecommendedTT"] = "Aprenda idiomas preestablecidos que su raza/clase probablemente habría aprendido en su historial probable.\nEsto sobrescribirá los idiomas aprendidos actualmente."
	L["ThisLangHasRunesTT"] = "Este idioma puede mostrar runas cuando no se aprende."
	L["ToggleLanguageLearnedTT"] = "Haga clic para alternar su capacidad de comprender este idioma cuando lo hablan usted mismo y otros."
	L["ToggleLanguageSpokenTT"] = "Haga clic para establecer este idioma como su prefijo."
	L["UseAutoShapeshiftOff"] = "Idioma de cambio de forma automático deshabilitado para este personaje."
	L["UseAutoShapeshiftOn"] = "Idioma de cambio de forma automático habilitado para este personaje."
	L["UseAutoShapeshift"] = "Idioma de cambio de forma automático"
	L["UseAutoShapeshiftTT"] = "Cambiar de forma a una forma cambiará automáticamente su idioma a su asociación.\nRequiere: Forma de sombra, Metamorfosis."
	L["LoadingProfile"] = "Cargando perfil"
	L["HelpCMD"] = "Puede utilizar "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/idiomas"..colorThingE..", o "..colorThingS.."/lang"..colorThingE.." para acceder a los comandos de barra diagonal. La lista de subopciones de comandos de barra diagonal disponibles:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - activa o desactiva el prefijo [Language]."..
	"\n"..colorThingS.."open"..colorThingE.." - abre el marco de opciones."..
	"\n"..colorThingS.."minimap"..colorThingE.." - activa o desactiva el botón del minimapa."..
	"\nAdemás, puede configurar un idioma, como por ejemplo "..colorThingS.."/Darnassiano"..colorThingE.."."
	L["OnlyInCharacter"] = "Solo en personaje"
	L["OnlyInCharacterTT"] = "Solo activa el prefijo / dialecto mientras estás \"En personaje\".\nRequiere el addon Total RP 3"
	L["RuneSize"] = "Tamaño del glifo"
	L["DisablePrefix"] = "Desactivar prefijo"
	L["EnablePrefix"] = "Activar prefijo"
	L["ShowSelectionButton"] = "Mostrar minibotón de idiomas"
	L["ShowSelectionButtonTT"] = "Activa un pequeño botón en pantalla para acceder a la selección de idiomas aprendidos."
	L["SelectLanguage"] = "Seleccionar idioma"
	L["OpenMenu"] = "Abrir menú"
	L["DragFrame"] = "Arrastrar marco"
	L["LeftClick"] = "Clic izquierdo"
	L["RightClick"] = "Clic derecho"
	L["ShiftDrag"] = "MAYÚS + arrastrar"


	L["Common"] = 		"Lengua común"		--7
	L["Darnassian"] = 	"Darnassiano"		--2
	L["Dwarvish"] = 	"Enánico"			--6
	L["Gnomish"] = 		"Gnomótico"			--13
	L["Draenei"] = 		"Draenei"			--35
	L["Orcish"] = 		"Orco"				--1
	L["Zandali"] = 		"Zandali"			--14
	L["Taurahe"] = 		"Taurahe"			--3
	L["Forsaken"] = 	"Renegado"			--33
	L["Thalassian"] = 	"Thalassiano"		--10
	L["Goblin"] = 		"Goblin"			--40
	L["Shalassian"] = 	"Shalassiano"		--181
	L["Vulpera"] = 		"Vulpera"			--285
	L["Pandaren"] = 	"Pandaren"			--42
	L["Draconic"] = 	"Dracónico"			--11
	L["Demonic"] = 		"Demoníaco"			--8
	L["Titan"] = 		"Titánico"			--9
	L["Kalimag"] = 		"Kalimag"			--12
	L["Shath'Yar"] = 	"Shath'yar"			--178
	L["Nerubian"] = 	"Nerubiano"			--307
	L["Sprite"] = 		"Duende"			--168
	L["Nerglish"] = 	"Nerglés"			--179
	L["Moonkin"] = 		"Lechúcico lunar"	--180
	L["Furbolg"] = 		"Fúrbolg"			--303
	L["Earthen"] = 		"Terráneo"			--304
	L["Hara'ni"] = 		"Hara'ni"			--309

	L["Gutterspeak"] = 			"Viscerálico"
	L["Ancient Pandaren"] = 	"Pandaren antiguo"
	L["Broker"] = 				"Especulador"
	L["Cypher"] = 				"Claves"
	L["Arathi"] = 				"Arathi"
	L["Mogu"] = 				"Mogu"
	L["Ethereal"] = 			"Etéreo"
	L["K'areshi"] = 			"K'areshi"

return end

if LOCALE == "deDE" then
-- German translations go here
	L["Languages"] = "Sprachen"
	L["Language"] = "Sprache"
	L["SLASH_1"] = "/sprachen"
	L["SLASH_2"] = "/sprachen"
	L["SLASH_3"] = "/sprachen"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "Verstehen"
	L["TogglePrefixOff"] = "Sprachpräfix: Aus"
	L["TogglePrefixOn"] = "Sprachpräfix: Ein"
	L["TogglePrefixTextOff"] = "Automatisches Sprachpräfix ausschalten."
	L["TogglePrefixTextOn"] = "„Automatisches Sprachpräfix ausschalten.“"
	L["TogglePrefixTT"] = "Steuert, ob die aktuell ausgewählte Sprache der Nachricht des Benutzers automatisch vorangestellt wird."
	L["Diction"] = "Diktion"
	L["Settings"] = SETTINGS
	L["Profiles"] = "Profile"
	L["ResetAccSettings"] = "Setzt alle für den Kontobereich spezifischen Einstellungen zurück. Dadurch werden die charakterspezifischen Einstellungen nicht zurückgesetzt."
	L["ResetCharSettings"] = "Setzt alle für den Charakterbereich spezifischen Einstellungen zurück. Dadurch werden kontospezifische Einstellungen nicht zurückgesetzt."
	L["ResetAccSettingsConfirm"] = "Sind Sie sicher, dass Sie die kontospezifischen Einstellungen für Sprachen zurücksetzen möchten?"
	L["ResetCharSettingsConfirm"] = "Sind Sie sicher, dass Sie die spezifischen Spracheinstellungen dieses Charakters zurücksetzen möchten?"
	L["ApplyPresetConfirm"] = "Sind Sie sicher, dass Sie Ihre aktuell erlernten Sprachen überschreiben möchten?"
	L["AddonPrefixColor"] = "Präfixfarbe für Sprachen"
	L["AccountSettings"] = "Account Einstellungen"
	L["CharacterSettings"] = "Charaktereinstellungen"
	L["MinimapTooltip"] = "Sprachen\nKlicken Sie hier, um das Sprachenmenü umzuschalten."
	L["GlyphsOff"] ="Glyphen ausschalten."
	L["GlyphsOn"] = "Glyphen einschalten."
	L["UseGlyphs"] = "Ungelernte Sprachen verwenden Glyphen"
	L["UseGlyphsTT"] = "Steuert, ob eine ungelernte Sprache Glyphen (sofern verfügbar) verwendet, um die einzelnen Zeichen zu ersetzen. Für einige Sprachen sind möglicherweise noch keine Glyphen verfügbar."
	L["SpeechBubblesOff"] = "Sprachblasenübersetzungen deaktivieren."
	L["SpeechBubblesOn"] = "Sprachblasenübersetzungen aktivieren."
	L["SpeechBubbles"] = "In Sprechblasen anzeigen"
	L["SpeechBubblesTT"] = "Steuert, ob nicht übersetzte Sprachen in Sprechblasen angezeigt werden.\nDie Blizzard-API verhindert, dass diese Funktion in instanzierten Inhalten funktioniert."
	L["CombatOptionOn"] = "Übersetzungen während des Kampfes einschalten."
	L["CombatOptionOff"] = "Übersetzungen während des Kampfes ausschalten."
	L["CombatOption"] = "Funktion während des Kampfes"
	L["CombatOptionTT"] = "Steuert, ob das Addon im Kampf funktioniert"
	L["FactionOptionOn"] = "Ignorieren Sie die Fraktionssprache."
	L["FactionOptionOff"] = "Fraktionssprache ignorieren aus."
	L["FactionOption"] = "Ignorieren Sie die Sprachen der eigenen Fraktion"
	L["FactionOptionTT"] = "Steuert, ob das Addon die Präfixoption für „Common“ bei einem Allianz-Charakter oder „Orcish“ bei einem Horde-Charakter ignoriert."
	L["LinkToTotalRP3Off"] = "Gesamt-RP-3-Link für diesen Charakter deaktiviert."
	L["LinkToTotalRP3On"] = "Gesamt-RP-3-Link für diesen Charakter aktiviert."
	L["LinkToTotalRP3"] = "Link zum Total RP 3-Profil"
	L["LinkToTotalRP3TT"] = "Ändere das Profil des Charakters automatisch entsprechend dem Gesamt-RP-3-Profil. Wenn mehrere Charaktere dasselbe Profil verwenden, sollten die Einstellungen für diese Charaktere beibehalten werden.\nErfordert das Add-on Total RP 3"
	L["SettingLanguageTo"] = "Sprache einstellen auf:"
	L["EnableUnderstand"] = "Aktivieren Sie „Verstehen“."
	L["DisableUnderstand"] = "Deaktivieren Sie „Verstehen“."
	L["Dialect"] = "Dialekt"
	L["DialectOff"] = "Dialekt: Aus"
	L["DialectOn"] = "Dialekt: Ein"
	L["UseDialectTT"] = "Steuert, ob der Benutzer beim Sprechen derzeit mit einem Dialekt spricht, z. Aus „Was willst du“ wird „Waschu wan‘?“."
	L["SettingDialectTo"] = "„Dialekt einstellen auf:“"
	L["CurrentlySpeaking"] = "Derzeit spricht:"
	L["NoPrefixBaseLang"] = "Verwenden Sie das Präfix nicht, wenn Sie die Basissprache Ihrer Fraktion sprechen (gemeinsam/Orkisch als Allianz/Horde)."
	L["LanguagePreset"] = "Lernen Sie Sprachvoreinstellungen"
	L["ImportGameplay"] = "Spielweise"
	L["ImportGameplayTT"] = "Lernen Sie voreingestellte Standardsprachen, die Ihre Rasse in der normalen Spielmechanik verwenden würde.\nDadurch werden Ihre aktuell erlernten Sprachen überschrieben."
	L["ImportRecommended"] = "Empfohlen"
	L["ImportRecommendedTT"] = "Lernen Sie voreingestellte Sprachen, die Ihre Rasse/Klasse in ihrer wahrscheinlichen Geschichte wahrscheinlich gelernt hätte.\nDadurch werden Ihre aktuell erlernten Sprachen überschrieben."
	L["ThisLangHasRunesTT"] = "Diese Sprache kann Runen anzeigen, wenn sie nicht erlernt ist."
	L["ToggleLanguageLearnedTT"] = "Klicken Sie hier, um Ihre Fähigkeit, diese Sprache zu verstehen, wenn Sie sie selbst oder andere sprechen, ein- oder auszuschalten."
	L["ToggleLanguageSpokenTT"] = "Klicken Sie, um diese Sprache als Ihr Präfix festzulegen."
	L["UseAutoShapeshiftOff"] = "Die automatische Gestaltwandlungssprache ist für diesen Charakter deaktiviert."
	L["UseAutoShapeshiftOn"] = "Für diesen Charakter ist die automatische Gestaltwandlungssprache aktiviert."
	L["UseAutoShapeshift"] = "Automatische Shapeshift-Sprache"
	L["UseAutoShapeshiftTT"] = "Durch die Gestaltwandlung in eine Form wird Ihre Sprache automatisch an die entsprechende Assoziation angepasst.\nErfordert: Schattenform, Metamorphose."
	L["LoadingProfile"] = "Profil wird geladen"
	L["HelpCMD"] = "Sie können "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/sprachen"..colorThingE..", oder "..colorThingS.."/lang"..colorThingE.." verwenden, um auf Schrägstrich-Befehle zuzugreifen. Die Liste der verfügbaren Unteroptionen für Schrägstrich-Befehle:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - Schaltet das [Language]-Präfix ein/aus."..
	"\n"..colorThingS.."open"..colorThingE.." - Öffnet den Optionsrahmen."..
	"\n"..colorThingS.."minimap"..colorThingE.." - Schaltet die Minikarten-Schaltfläche ein/aus."..
	"\nZusätzlich können Sie eine Sprache festlegen, beispielsweise "..colorThingS.."/Darnassisch"..colorThingE.."."
	L["OnlyInCharacter"] = "Nur im Charakter"
	L["OnlyInCharacterTT"] = "Aktiviert Präfix / Dialekt nur, wenn du \"Im Charakter\" bist.\nErfordert das Addon Total RP 3"
	L["RuneSize"] = "Glyphengröße"
	L["DisablePrefix"] = "Präfix deaktivieren"
	L["EnablePrefix"] = "Präfix aktivieren"
	L["ShowSelectionButton"] = "Mini-Schaltfläche für Sprachen anzeigen"
	L["ShowSelectionButtonTT"] = "Blendet eine kleine Schaltfläche ein, über die die Auswahl erlernter Sprachen geöffnet werden kann."
	L["SelectLanguage"] = "Sprache auswählen"
	L["OpenMenu"] = "Menü öffnen"
	L["DragFrame"] = "Fenster verschieben"
	L["LeftClick"] = "Links-Klick"
	L["RightClick"] = "Rechts-Klick"
	L["ShiftDrag"] = "UMSCHALT + Ziehen"


	L["Common"] = 		"Gemeinsprache"		--7
	L["Darnassian"] = 	"Darnassisch"		--2
	L["Dwarvish"] = 	"Zwergisch"			--6
	L["Gnomish"] = 		"Gnomisch"			--13
	L["Draenei"] = 		"Draenei"			--35
	L["Orcish"] = 		"Orcisch"			--1
	L["Zandali"] = 		"Zandali"			--14
	L["Taurahe"] = 		"Taurahe"			--3
	L["Forsaken"] = 	"Gossensprache"		--33
	L["Thalassian"] = 	"Thalassisch"		--10
	L["Goblin"] = 		"Goblin"			--40
	L["Shalassian"] = 	"Shalassisch"		--181
	L["Vulpera"] = 		"Vulpera"			--285
	L["Pandaren"] = 	"Pandarisch"		--42
	L["Draconic"] = 	"Drakonisch"		--11
	L["Demonic"] = 		"Dämonisch"			--8
	L["Titan"] = 		"Titanensprache"	--9
	L["Kalimag"] = 		"Kalimag"			--12
	L["Shath'Yar"] = 	"Shath'Yar"			--178
	L["Nerubian"] = 	"Nerubisch"			--307
	L["Sprite"] = 		"Feensprache"		--168
	L["Nerglish"] = 	"Nerglisch"			--179
	L["Moonkin"] = 		"Mondkin"			--180
	L["Furbolg"] = 		"Furbolg"			--303
	L["Earthen"] = 		"Irden"				--304
	L["Hara'ni"] = 		"Hara'ni"			--309

	L["Gutterspeak"] = 			"Gossensprache"
	L["Ancient Pandaren"] = 	"Uralter Pandaren"
	L["Broker"] = 				"Mittler"
	L["Cypher"] = 				"Chiffren"
	L["Arathi"] = 				"Arathi"
	L["Mogu"] = 				"Mogu"
	L["Ethereal"] = 			"Astral"
	L["K'areshi"] = 			"K'areshi"

return end

if LOCALE == "frFR" then
-- French translations go here
	L["Languages"] = "Langues"
	L["Language"] = "Langue"
	L["SLASH_1"] = "/langues"
	L["SLASH_2"] = "/langues"
	L["SLASH_3"] = "/langues"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "Comprendre"
	L["TogglePrefixOff"] = "Préfixe de langue : Désactivé"
	L["TogglePrefixOn"] = "Préfixe de langue : activé"
	L["TogglePrefixTextOff"] = "Désactivation du préfixe de langue automatisé."
	L["TogglePrefixTextOn"] = "Désactivation du préfixe de langue automatisé."
	L["TogglePrefixTT"] = "Contrôle si la langue actuellement sélectionnée préfixe automatiquement le message de l'utilisateur."
	L["Diction"] = "Diction"
	L["Settings"] = SETTINGS
	L["Profiles"] = "Profils"
	L["ResetAccSettings"] = "Réinitialise tous les paramètres spécifiques à la section compte. Cela ne réinitialisera pas les paramètres spécifiques au personnage."
	L["ResetCharSettings"] = "Réinitialise tous les paramètres spécifiques à la section personnage. Cela ne réinitialisera pas les paramètres spécifiques au compte."
	L["ResetAccSettingsConfirm"] = "Êtes-vous sûr de vouloir réinitialiser les paramètres spécifiques au compte pour les langues ?"
	L["ResetCharSettingsConfirm"] = "Êtes-vous sûr de vouloir réinitialiser les paramètres spécifiques de langue de ce personnage ?"
	L["ApplyPresetConfirm"] = "Etes-vous sûr de vouloir écraser vos langues apprises actuellement ?"
	L["AddonPrefixColor"] = "Couleur du préfixe des langues"
	L["AccountSettings"] = "Paramètres du compte"
	L["CharacterSettings"] = "Paramètres des personnages"
	L["MinimapTooltip"] = "Langues\nCliquez pour basculer le menu Langues."
	L["GlyphsOff"] ="Désactiver les glyphes."
	L["GlyphsOn"] = "Activer les glyphes."
	L["UseGlyphs"] = "Les langues non apprises utilisent des glyphes"
	L["UseGlyphsTT"] = "Contrôle si une langue non apprise utilise des glyphes, lorsqu'ils sont disponibles, pour remplacer les caractères individuels. Certaines langues peuvent ne pas encore avoir de glyphes disponibles."
	L["SpeechBubblesOff"] = "Désactiver les traductions des bulles de dialogue."
	L["SpeechBubblesOn"] = "Activer les traductions des bulles de dialogue."
	L["SpeechBubbles"] = "Afficher dans des bulles"
	L["SpeechBubblesTT"] = "Contrôle si les langues non traduites apparaîtront dans les bulles.\nL'API Blizzard limite le fonctionnement de cette fonctionnalité dans le contenu instancié."
	L["CombatOptionOn"] = "Activer les traductions pendant le combat."
	L["CombatOptionOff"] = "Désactivation des traductions pendant le combat."
	L["CombatOption"] = "Fonction pendant le combat"
	L["CombatOptionTT"] = "Contrôle si l'addon fonctionnera en combat"
	L["FactionOptionOn"] = "Ignorer le langage des factions."
	L["FactionOptionOff"] = "Ignorer le langage de la faction est désactivé."
	L["FactionOption"] = "Ignorer les langues de votre propre faction"
	L["FactionOptionTT"] = "Contrôle si l'addon ignorera l'option de préfixe pour \"Common\" sur un personnage de l'Alliance ou \"Orcish\" pour un personnage de la Horde."
	L["LinkToTotalRP3Off"] = "Lien Total RP 3 désactivé pour ce personnage."
	L["LinkToTotalRP3On"] = "Lien Total RP 3 activé pour ce personnage."
	L["LinkToTotalRP3"] = "Lien vers le profil Total RP 3"
	L["LinkToTotalRP3TT"] = "Modifiez automatiquement le profil du personnage en fonction du profil Total RP 3. Si plusieurs personnages utilisent le même profil, celui-ci devrait conserver les paramètres de ces personnages.\nNécessite l'addon Total RP 3"
	L["SettingLanguageTo"] = "Définir la langue sur :"
	L["EnableUnderstand"] = "Activer Comprendre"
	L["DisableUnderstand"] = "Désactiver Comprendre"
	L["Dialect"] = "Dialecte"
	L["DialectOff"] = "Dialecte : Désactivé"
	L["DialectOn"] = "Dialecte : Activé"
	L["UseDialectTT"] = "Contrôle si l'utilisateur parle actuellement avec un dialecte tout en parlant, par ex. \"Qu'est-ce que tu veux\" devient \"Waschu wan'?\"."
	L["SettingDialectTo"] = "« Définir le dialecte sur : »"
	L["CurrentlySpeaking"] = "Parlant actuellement :"
	L["NoPrefixBaseLang"] = "N'utilisez pas le préfixe si vous parlez la langue de base de votre faction (respectivement commun/orque comme Alliance/Horde)."
	L["LanguagePreset"] = "Apprendre les préréglages de langue"
	L["ImportGameplay"] = "Gameplay"
	L["ImportGameplayTT"] = "Apprenez les langues par défaut prédéfinies que votre race utiliserait dans les mécanismes de jeu normaux.\nCela écrasera vos langues apprises actuellement."
	L["ImportRecommended"] = "Recommandé"
	L["ImportRecommendedTT"] = "Apprenez des langues prédéfinies que votre race/classe aurait probablement apprises au cours de son histoire probable.\nCela écrasera vos langues apprises actuellement."
	L["ThisLangHasRunesTT"] = "Cette langue peut afficher des runes lorsqu'elle n'est pas apprise."
	L["ToggleLanguageLearnedTT"] = "Cliquez pour modifier votre capacité à comprendre cette langue lorsqu'elle est parlée par vous-même et par les autres."
	L["ToggleLanguageSpokenTT"] = "Cliquez pour définir cette langue comme préfixe."
	L["UseAutoShapeshiftOff"] = "Langue Shapeshift automatique désactivée pour ce personnage."
	L["UseAutoShapeshiftOn"] = "Langage Shapeshift automatique activé pour ce personnage."
	L["UseAutoShapeshift"] = "Langage Shapeshift automatique"
	L["UseAutoShapeshiftTT"] = "Le changement de forme dans un formulaire changera automatiquement votre langue en son association.\nNécessite : Forme d'Ombre, Métamorphose."
	L["LoadingProfile"] = "Chargement du profil"
	L["HelpCMD"] = "Vous pouvez utiliser "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/langues"..colorThingE..", ou "..colorThingS.."/lang"..colorThingE.." pour accéder aux commandes slash. La liste des sous-options de commande slash disponibles:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - active/désactive le préfixe [Language]."..
	"\n"..colorThingS.."open"..colorThingE.." - ouvre le cadre des options."..
	"\n"..colorThingS.."minimap"..colorThingE.." - active/désactive le bouton de la mini-carte."..
	"\nDe plus, vous pouvez définir une langue, comme par exemple "..colorThingS.."/Darnassien"..colorThingE.."."
	L["OnlyInCharacter"] = "Uniquement en personnage"
	L["OnlyInCharacterTT"] = "Active le préfixe / dialecte uniquement lorsque vous êtes « en personnage ».\nNécessite l’addon Total RP 3"
	L["RuneSize"] = "Taille du glyphe"
	L["DisablePrefix"] = "Désactiver le préfixe"
	L["EnablePrefix"] = "Activer le préfixe"
	L["ShowSelectionButton"] = "Afficher le mini-bouton des langues"
	L["ShowSelectionButtonTT"] = "Affiche un petit bouton à l’écran permettant d’accéder à la sélection des langues apprises."
	L["SelectLanguage"] = "Sélectionner la langue"
	L["OpenMenu"] = "Ouvrir le menu"
	L["DragFrame"] = "Déplacer le cadre"
	L["LeftClick"] = "Clic gauche"
	L["RightClick"] = "Clic droit"
	L["ShiftDrag"] = "MAJ + déplacer"


	L["Common"] = 		"Commun"		--7
	L["Darnassian"] = 	"Darnassien"	--2
	L["Dwarvish"] = 	"Nain"			--6
	L["Gnomish"] = 		"Gnome"			--13
	L["Draenei"] = 		"Draeneï"		--35
	L["Orcish"] = 		"Orc"			--1
	L["Zandali"] = 		"Zandali"		--14
	L["Taurahe"] = 		"Taurahe"		--3
	L["Forsaken"] = 	"Réprouvé"		--33
	L["Thalassian"] = 	"Thalassien"	--10
	L["Goblin"] = 		"Gobelin"		--40
	L["Shalassian"] = 	"Shalassien"	--181
	L["Vulpera"] = 		"Vulpérin"		--285
	L["Pandaren"] = 	"Pandaren"		--42
	L["Draconic"] = 	"Draconique"	--11
	L["Demonic"] = 		"Démoniaque"	--8
	L["Titan"] = 		"Titan"			--9
	L["Kalimag"] = 		"Kalimag"		--12
	L["Shath'Yar"] = 	"Shath’Yar"		--178
	L["Nerubian"] = 	"Nérubien"		--307
	L["Sprite"] = 		"Lutin"			--168
	L["Nerglish"] = 	"Nerglais"		--179
	L["Moonkin"] = 		"Sélénien"		--180
	L["Furbolg"] = 		"Furbolg"		--303
	L["Earthen"] = 		"Terrestre"		--304
	L["Hara'ni"] = 		"Hara’ni"		--309

	L["Gutterspeak"] = 			"Bas-parler"
	L["Ancient Pandaren"] = 	"Pandaren ancien"
	L["Broker"] = 				"Négociant"
	L["Cypher"] = 				"Cryptogrammes"
	L["Arathi"] = 				"Arathie"
	L["Mogu"] = 				"Mogu"
	L["Ethereal"] = 			"Éthérien"
	L["K'areshi"] = 			"K'areshi"

return end

if LOCALE == "itIT" then
-- French translations go here
	L["Languages"] = "Le lingue"
	L["Language"] = "Lingua"
	L["SLASH_1"] = "/lingue"
	L["SLASH_2"] = "/lingue"
	L["SLASH_3"] = "/lingue"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "Capire"
	L["TogglePrefixOff"] = "Prefisso lingua: disattivato"
	L["TogglePrefixOn"] = "Prefisso lingua: attivato"
	L["TogglePrefixTextOff"] = "Disattivazione del prefisso della lingua automatizzato."
	L["TogglePrefixTextOn"] = "Disattivazione del prefisso automatico della lingua."
	L["TogglePrefixTT"] = "Controlla se la lingua attualmente selezionata antepone automaticamente il messaggio dell'utente."
	L["Diction"] = "Dizione"
	L["Settings"] = SETTINGS
	L["Profiles"] = "Profili"
	L["ResetAccSettings"] = "Ripristina tutte le impostazioni specifiche della sezione account. Ciò non ripristinerà le impostazioni specifiche del personaggio."
	L["ResetCharSettings"] = "Ripristina tutte le impostazioni specifiche della sezione caratteri. Ciò non ripristinerà le impostazioni specifiche dell'account."
	L["ResetAccSettingsConfirm"] = "Sei sicuro di voler reimpostare le impostazioni specifiche dell'account per le lingue?"
	L["ResetCharSettingsConfirm"] = "Sei sicuro di voler reimpostare le impostazioni specifiche di questo personaggio per le lingue?"
	L["ApplyPresetConfirm"] = "Sei sicuro di voler sovrascrivere le lingue attualmente apprese?"
	L["AddonPrefixColor"] = "Colore prefisso lingue"
	L["AccountSettings"] = "Impostazioni dell'account"
	L["CharacterSettings"] = "Impostazioni dei caratteri"
	L["MinimapTooltip"] = "Lingue\nFare clic per attivare/disattivare il menu Lingue."
	L["GlyphsOff"] ="Disattivazione dei glifi."
	L["GlyphsOn"] = "Attivazione dei glifi."
	L["UseGlyphs"] = "Le lingue non apprese usano i glifi"
	L["UseGlyphsTT"] = "Controlla se una lingua non appresa utilizza i glifi, quando disponibili, per sostituire i singoli caratteri. Per alcune lingue i glifi potrebbero non essere ancora disponibili."
	L["SpeechBubblesOff"] = "Disattivazione delle traduzioni dei fumetti."
	L["SpeechBubblesOn"] = "Attivazione delle traduzioni dei fumetti."
	L["SpeechBubbles"] = "Mostra nei fumetti"
	L["SpeechBubblesTT"] = "Controlla se le lingue non tradotte verranno visualizzate nei fumetti.\nL'API Blizzard limita il funzionamento di questa funzionalità nei contenuti istanziati."
	L["CombatOptionOn"] = "Attivazione delle traduzioni durante il combattimento."
	L["CombatOptionOff"] = "Disattivazione delle traduzioni durante il combattimento."
	L["CombatOption"] = "Funzione durante il combattimento"
	L["CombatOptionTT"] = "Controlla se l'add-on funzionerà in combattimento"
	L["FactionOptionOn"] = "Ignora il linguaggio delle fazioni attivo."
	L["FactionOptionOff"] = "Ignora il linguaggio delle fazioni disattivato."
	L["FactionOption"] = "Ignora le lingue della tua fazione"
	L["FactionOptionTT"] = "Controlla se l'add-on ignorerà l'opzione del prefisso per \"Common\" su un personaggio dell'Alleanza o \"Orcish\" per un personaggio dell'Orda."
	L["LinkToTotalRP3Off"] = "Collegamento RP totale 3 disabilitato per questo personaggio."
	L["LinkToTotalRP3On"] = "Collegamento totale RP 3 abilitato per questo personaggio."
	L["LinkToTotalRP3"] = "Collegamento al profilo Total RP 3"
	L["LinkToTotalRP3TT"] = "Cambia automaticamente il profilo del personaggio in base al profilo Total RP 3. Se più personaggi utilizzano lo stesso profilo, questo dovrebbe mantenere le impostazioni su quei personaggi.\nRichiede il componente aggiuntivo Total RP 3"
	L["SettingLanguageTo"] = "Impostazione della lingua su:"
	L["EnableUnderstand"] = "Abilita Capire"
	L["DisableUnderstand"] = "Disabilita Capire"
	L["Dialect"] = "Dialetto"
	L["DialectOff"] = "Dialetto: spento"
	L["DialectOn"] = "Dialetto: acceso"
	L["UseDialectTT"] = "Controlla se l'utente parla attualmente con un dialetto mentre parla, ad es. \"Cosa vuoi\" diventa \"Waschu wan'?\"."
	L["SettingDialectTo"] = "Impostazione dialetto su:"
	L["CurrentlySpeaking"] = "Attualmente si parla:"
	L["NoPrefixBaseLang"] = "Non utilizzare il prefisso se parli la lingua base della tua fazione (rispettivamente Comune/Orco come Alleanza/Orda)."
	L["LanguagePreset"] = "Impara le lingue preimpostate"
	L["ImportGameplay"] = "Gioco"
	L["ImportGameplayTT"] = "Impara le lingue predefinite preimpostate che la tua razza utilizzerebbe nelle normali meccaniche di gioco.\nQuesto sovrascriverà le lingue attualmente apprese."
	L["ImportRecommended"] = "Consigliato"
	L["ImportRecommendedTT"] = "Impara le lingue preimpostate che la tua razza/classe probabilmente avrebbe imparato nella sua probabile storia.\nQuesto sovrascriverà le lingue attualmente apprese."
	L["ThisLangHasRunesTT"] = "Questa lingua può visualizzare le rune se non appresa."
	L["ToggleLanguageLearnedTT"] = "Fai clic per attivare/disattivare la tua capacità di comprendere questa lingua quando parlata da te e da altri."
	L["ToggleLanguageSpokenTT"] = "Fare clic per impostare questa lingua come prefisso."
	L["UseAutoShapeshiftOff"] = "Linguaggio Shapeshift automatico disabilitato per questo personaggio."
	L["UseAutoShapeshiftOn"] = "Linguaggio Shapeshift automatico abilitato per questo personaggio."
	L["UseAutoShapeshift"] = "Linguaggio Shapeshift automatico"
	L["UseAutoShapeshiftTT"] = "Trasformarti in una forma cambierà automaticamente la tua lingua in base alla sua associazione.\nRichiede: Forma d'Ombra, Metamorfosi."
	L["LoadingProfile"] = "Caricamento profilo"
	L["HelpCMD"] = "È possibile utilizzare "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/lingue"..colorThingE..", o "..colorThingS.."/lang"..colorThingE.." per accedere ai comandi slash. L'elenco delle opzioni secondarie dei comandi slash disponibili:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - attiva/disattiva il prefisso [Language]."..
	"\n"..colorThingS.."open"..colorThingE.." - apre il riquadro delle opzioni."..
	"\n"..colorThingS.."minimap"..colorThingE.." - attiva/disattiva il pulsante della minimappa."..
	"\nAdditionally, you can set a language, such as for examplInoltre è possibile impostare una lingua, come ad esempio "..colorThingS.."/Darnassiano"..colorThingE.."."
	L["OnlyInCharacter"] = "Solo in personaggio"
	L["OnlyInCharacterTT"] = "Attiva il prefisso / dialetto solo quando sei \"In personaggio\".\nRichiede l'addon Total RP 3"
	L["RuneSize"] = "Dimensione del glifo"
	L["DisablePrefix"] = "Disattiva prefisso"
	L["EnablePrefix"] = "Attiva prefisso"
	L["ShowSelectionButton"] = "Mostra mini-pulsante delle lingue"
	L["ShowSelectionButtonTT"] = "Attiva un piccolo pulsante sullo schermo per accedere alla selezione delle lingue apprese."
	L["SelectLanguage"] = "Seleziona lingua"
	L["OpenMenu"] = "Apri menu"
	L["DragFrame"] = "Trascina riquadro"
	L["LeftClick"] = "Clic sinistro"
	L["RightClick"] = "Clic destro"
	L["ShiftDrag"] = "MAIUSC + trascina"


	L["Common"] = 		"Comune"		--7
	L["Darnassian"] = 	"Darnassiano"	--2
	L["Dwarvish"] = 	"Nanico"		--6
	L["Gnomish"] = 		"Gnomesco"		--13
	L["Draenei"] = 		"Draenei"		--35
	L["Orcish"] = 		"Orchesco"		--1
	L["Zandali"] = 		"Zandali"		--14
	L["Taurahe"] = 		"Taurino"		--3
	L["Forsaken"] = 	"Non Morto"		--33
	L["Thalassian"] = 	"Thalassiano"	--10
	L["Goblin"] = 		"Goblin"		--40
	L["Shalassian"] = 	"Shalassiano"	--181
	L["Vulpera"] = 		"Vulpera"		--285
	L["Pandaren"] = 	"Pandaren"		--42
	L["Draconic"] = 	"Draconico"		--11
	L["Demonic"] = 		"Demoniaco"		--8
	L["Titan"] = 		"Titanico"		--9
	L["Kalimag"] = 		"Kalimag"		--12
	L["Shath'Yar"] = 	"Shath'yar"		--178
	L["Nerubian"] = 	"Nerubiano"		--307
	L["Sprite"] = 		"Follettiano"	--168
	L["Nerglish"] = 	"Nergliano"		--179
	L["Moonkin"] = 		"Lunagufo"		--180
	L["Furbolg"] = 		"Mezzorso"		--303
	L["Earthen"] = 		"Terrigeno"		--304
	L["Hara'ni"] = 		"Hara'ni"		--309

	L["Gutterspeak"] = 			"Non Morto"
	L["Ancient Pandaren"] = 	"Pandaren antico"
	L["Broker"] = 				"Alienatore"
	L["Cypher"] = 				"Codici"
	L["Arathi"] = 				"Arathi"
	L["Mogu"] = 				"Mogu"
	L["Ethereal"] = 			"Etereo"
	L["K'areshi"] = 			"K'areshi"

return end

if LOCALE == "ptBR" then
-- Brazilian Portuguese translations go here
	L["Languages"] = "línguas"
	L["Language"] = "Linguagem"
	L["SLASH_1"] = "/idiomas"
	L["SLASH_2"] = "/idioma"
	L["SLASH_3"] = "/lingua"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "Entender"
	L["TogglePrefixOff"] = "Prefixo de idioma: desativado"
	L["TogglePrefixOn"] = "Prefixo de idioma: ativado"
	L["TogglePrefixTextOff"] = "Desativando o prefixo de idioma automatizado."
	L["TogglePrefixTextOn"] = "Desativando o prefixo de idioma automatizado."
	L["TogglePrefixTT"] = "Controla se o idioma atualmente selecionado prefixa automaticamente a mensagem do usuário."
	L["Diction"] = "Dicção"
	L["Settings"] = SETTINGS
	L["Profiles"] = "Perfis"
	L["ResetAccSettings"] = "Redefine todas as configurações específicas da seção da conta. Isso não redefinirá as configurações específicas do personagem."
	L["ResetCharSettings"] = "Redefine todas as configurações específicas da seção do personagem. Isso não redefinirá as configurações específicas da conta."
	L["ResetAccSettingsConfirm"] = "Tem certeza de que deseja redefinir as configurações específicas da conta para idiomas?"
	L["ResetCharSettingsConfirm"] = "Tem certeza de que deseja redefinir as configurações específicas de idiomas deste personagem?"
	L["ApplyPresetConfirm"] = "Tem certeza de que deseja substituir os idiomas aprendidos atualmente?"
	L["AddonPrefixColor"] = "Cor do prefixo de idiomas"
	L["AccountSettings"] = "Configurações de Conta"
	L["CharacterSettings"] = "Configurações de personagem"
	L["MinimapTooltip"] = "Idiomas\nClique para alternar o menu Idiomas."
	L["GlyphsOff"] ="Desativando glifos."
	L["GlyphsOn"] = "Ativando glifos."
	L["UseGlyphs"] = "Idiomas não aprendidos usam glifos"
	L["UseGlyphsTT"] = "Controla se um idioma não aprendido usa glifos, quando disponíveis, para substituir caracteres individuais. Alguns idiomas podem ainda não ter glifos disponíveis."
	L["SpeechBubblesOff"] = "Desativando as traduções dos balões de fala."
	L["SpeechBubblesOn"] = "Ativando traduções de balões de fala."
	L["SpeechBubbles"] = "Mostrar em balões de fala"
	L["SpeechBubblesTT"] = "Controla se os idiomas não traduzidos aparecerão em balões de fala.\nA API da Blizzard limita o funcionamento desse recurso em conteúdo instanciado."
	L["CombatOptionOn"] = "Ativando traduções durante o combate."
	L["CombatOptionOff"] = "Desligando as traduções durante o combate."
	L["CombatOption"] = "Função durante o combate"
	L["CombatOptionTT"] = "Controla se o addon funcionará em combate"
	L["FactionOptionOn"] = "Ignorando a linguagem da facção ativada."
	L["FactionOptionOff"] = "Ignorando a linguagem da facção."
	L["FactionOption"] = "Ignore os idiomas da própria facção"
	L["FactionOptionTT"] = "Controla se o complemento irá ignorar a opção de prefixo para \"Comum\" enquanto estiver em um personagem da Aliança ou \"Orcish\" para um personagem da Horda."
	L["LinkToTotalRP3Off"] = "Link total de RP 3 desabilitado para este personagem."
	L["LinkToTotalRP3On"] = "Link total de RP 3 habilitado para este personagem."
	L["LinkToTotalRP3"] = "Link para o perfil do Total RP 3"
	L["LinkToTotalRP3TT"] = "Alterar automaticamente o perfil do personagem de acordo com o perfil Total RP 3. Se vários personagens usarem o mesmo perfil, isso deverá manter as configurações desses personagens.\nRequer o complemento Total RP 3"
	L["SettingLanguageTo"] = "Configurando o idioma para:"
	L["EnableUnderstand"] = "Ativar compreensão"
	L["DisableUnderstand"] = "Desativar compreensão"
	L["Dialect"] = "Dialeto"
	L["DialectOff"] = "Dialeto: desligado"
	L["DialectOn"] = "Dialeto: Ligado"
	L["UseDialectTT"] = "Controla se o usuário fala atualmente com um dialeto enquanto fala, por exemplo. \"O que você quer\" se torna \"Waschu wan'?\"."
	L["SettingDialectTo"] = "Definindo dialeto para:"
	L["CurrentlySpeaking"] = "Atualmente falando:"
	L["NoPrefixBaseLang"] = "Não use o prefixo se estiver falando o idioma base da sua facção (Comum/Orcish como Alliance/Horde respectivamente)."
	L["LanguagePreset"] = "Aprenda predefinições de idioma"
	L["ImportGameplay"] = "Jogabilidade"
	L["ImportGameplayTT"] = "Aprenda idiomas padrão predefinidos que sua raça aprenderia na mecânica de jogo normal.\nIsso substituirá os idiomas aprendidos atualmente."
	L["ImportRecommended"] = "Recomendado"
	L["ImportRecommendedTT"] = "Aprenda idiomas predefinidos que sua raça/classe provavelmente teria aprendido em seu provável histórico.\nIsso substituirá os idiomas aprendidos atualmente."
	L["ThisLangHasRunesTT"] = "Este idioma pode exibir runas quando não aprendido."
	L["ToggleLanguageLearnedTT"] = "Clique para alternar sua capacidade de entender esse idioma quando falado por você e por outras pessoas."
	L["ToggleLanguageSpokenTT"] = "Clique para definir este idioma como seu prefixo."
	L["UseAutoShapeshiftOff"] = "Idioma do Shapeshift automático desativado para este personagem."
	L["UseAutoShapeshiftOn"] = "Linguagem Shapeshift automática habilitada para este personagem."
	L["UseAutoShapeshift"] = "Linguagem de mudança de forma automática"
	L["UseAutoShapeshiftTT"] = "Mudar de forma para uma forma mudará automaticamente seu idioma para sua associação.\nRequer: Shadowform, Metamorphosis."
	L["LoadingProfile"] = "Carregando perfil"
	L["HelpCMD"] = "Você pode usar "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/idiomas"..colorThingE..", ou "..colorThingS.."/lang"..colorThingE.." para acessar comandos de barra. A lista de subopções de comando de barra disponíveis:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - ativa/desativa o prefixo [Language]."..
	"\n"..colorThingS.."open"..colorThingE.." - abre o quadro de opções."..
	"\n"..colorThingS.."minimap"..colorThingE.." - ativa/desativa o botão do minimapa."..
	"\nAlém disso, você pode definir um idioma, como por exemplo "..colorThingS.."/Darnassiano"..colorThingE.."."
	L["OnlyInCharacter"] = "Apenas em personagem"
	L["OnlyInCharacterTT"] = "Ativa o prefixo / dialeto apenas quando estiver \"Em personagem\".\nRequer o addon Total RP 3"
	L["RuneSize"] = "Tamanho do glifo"
	L["DisablePrefix"] = "Desativar prefixo"
	L["EnablePrefix"] = "Ativar prefixo"
	L["ShowSelectionButton"] = "Mostrar mini-botão de idiomas"
	L["ShowSelectionButtonTT"] = "Ativa um pequeno botão na tela para acessar a seleção de idiomas aprendidos."
	L["SelectLanguage"] = "Selecionar idioma"
	L["OpenMenu"] = "Abrir menu"
	L["DragFrame"] = "Arrastar quadro"
	L["LeftClick"] = "Clique esquerdo"
	L["RightClick"] = "Clique direito"
	L["ShiftDrag"] = "SHIFT + arrastar"


	L["Common"] = 		"Língua Comum"	--7
	L["Darnassian"] = 	"Darnassiano"	--2
	L["Dwarvish"] = 	"Enânico"		--6
	L["Gnomish"] = 		"Gnomês"		--13
	L["Draenei"] = 		"Draeneico"		--35
	L["Orcish"] = 		"Órquico"		--1
	L["Zandali"] = 		"Zandali"		--14
	L["Taurahe"] = 		"Taurahe"		--3
	L["Forsaken"] = 	"Guturalês"		--33
	L["Thalassian"] = 	"Talassiano"	--10
	L["Goblin"] = 		"Goblinês"		--40
	L["Shalassian"] = 	"Shalassiano"	--181
	L["Vulpera"] = 		"Vulpera"		--285
	L["Pandaren"] = 	"Pandaren"		--42
	L["Draconic"] = 	"Dracônico"		--11
	L["Demonic"] = 		"Demoníaco"		--8
	L["Titan"] = 		"Titânico"		--9
	L["Kalimag"] = 		"Kalimaico"		--12
	L["Shath'Yar"] = 	"Shath'Yar"		--178
	L["Nerubian"] = 	"Nerubiano"		--307
	L["Sprite"] = 		"Duendês"		--168
	L["Nerglish"] = 	"Nergonês"		--179
	L["Moonkin"] = 		"Lunisquês"		--180
	L["Furbolg"] = 		"Pelurso"		--303
	L["Earthen"] = 		"Terrano"		--304
	L["Hara'ni"] = 		"Hara'ni"		--309

	L["Gutterspeak"] = 			"Guturalês"
	L["Ancient Pandaren"] = 	"Pandaren antigo"
	L["Broker"] = 				"Corretor"
	L["Cypher"] = 				"Cifras"
	L["Arathi"] = 				"Arathi"
	L["Mogu"] = 				"Mogu"
	L["Ethereal"] = 			"Etéreo"
	L["K'areshi"] = 			"K'areshi"

-- Note that the EU Portuguese WoW client also
-- uses the Brazilian Portuguese locale code.
return end

if LOCALE == "ruRU" then
-- Russian translations go here
	L["Languages"] = "Языки"
	L["Language"] = "Язык"
	L["SLASH_1"] = "/языки"
	L["SLASH_2"] = "/языки"
	L["SLASH_3"] = "/языки"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "Понимать"
	L["TogglePrefixOff"] = "Префикс языка: Выкл."
	L["TogglePrefixOn"] = "Префикс языка: Вкл."
	L["TogglePrefixTextOff"] = "Отключение автоматического префикса языка."
	L["TogglePrefixTextOn"] = "«Отключение автоматического языкового префикса»."
	L["TogglePrefixTT"] = "Определяет, будет ли выбранный в данный момент язык автоматически добавляться к сообщению пользователя."
	L["Diction"] = "Дикция"
	L["Settings"] = SETTINGS
	L["Profiles"] = "Профили"
	L["ResetAccSettings"] = "Сбрасывает все настройки, специфичные для раздела учетной записи. Это не приведет к сбросу настроек персонажа."
	L["ResetCharSettings"] = "Сбрасывает все настройки, относящиеся к разделу персонажей. Это не приведет к сбросу настроек учетной записи."
	L["ResetAccSettingsConfirm"] = "Вы уверены, что хотите сбросить настройки языка для учетной записи?"
	L["ResetCharSettingsConfirm"] = "Вы уверены, что хотите сбросить настройки языков этого персонажа?"
	L["ApplyPresetConfirm"] = "Вы уверены, что хотите перезаписать текущие изученные языки?"
	L["AddonPrefixColor"] = "Цвет префикса языка"
	L["AccountSettings"] = "Настройки учетной записи"
	L["CharacterSettings"] = "Настройки персонажа"
	L["MinimapTooltip"] = "Языки\nНажмите, чтобы переключить меню языков."
	L["GlyphsOff"] ="Отключение глифов."
	L["GlyphsOn"] = "Включение глифов."
	L["UseGlyphs"] = "Неизученные языки используют глифы"
	L["UseGlyphsTT"] = "Определяет, использует ли неизученный язык глифы (если они доступны) для замены отдельных символов. Для некоторых языков глифы могут быть недоступны."
	L["SpeechBubblesOff"] = "Отключение перевода речевых облаков."
	L["SpeechBubblesOn"] = "Включение перевода речевых пузырьков."
	L["SpeechBubbles"] = "Показать в речевых облаках"
	L["SpeechBubblesTT"] = "Определяет, будут ли непереведенные языки отображаться в облачках с текстом.\nBlizzard API ограничивает работу этой функции в экземплярах контента."
	L["CombatOptionOn"] = "Включение переводов во время боя."
	L["CombatOptionOff"] = "Отключение переводов во время боя."
	L["CombatOption"] = "Функция во время боя"
	L["CombatOptionTT"] = "Определяет, будет ли аддон работать в бою."
	L["FactionOptionOn"] = "Игнорирование языка фракции включено."
	L["FactionOptionOff"] = "Игнорирование языка фракции отключено."
	L["FactionOption"] = "Игнорировать языки собственной фракции"
	L["FactionOptionTT"] = "Определяет, будет ли аддон игнорировать префикс «Общий» для персонажа Альянса или «Оркский» для персонажа Орды."
	L["LinkToTotalRP3Off"] = "Ссылка на общий RP 3 отключена для этого персонажа."
	L["LinkToTotalRP3On"] = "Для этого персонажа включена ссылка на общий RP 3."
	L["LinkToTotalRP3"] = "Ссылка на профиль Total RP 3"
	L["LinkToTotalRP3TT"] = "Автоматически менять профиль персонажа в соответствии с профилем Total RP 3. Если несколько персонажей используют один и тот же профиль, настройки этих персонажей должны сохраниться.\nТребуется дополнение. Total RP 3."
	L["SettingLanguageTo"] = "Установка языка:"
	L["EnableUnderstand"] = "Включить понимание"
	L["DisableUnderstand"] = "Отключить понимание"
	L["Dialect"] = "Диалект"
	L["DialectOff"] = "Диалект: Выкл."
	L["DialectOn"] = "Диалект: Вкл."
	L["UseDialectTT"] = "Определяет, говорит ли пользователь в настоящее время на диалекте, например «Чего вы хотите» превращается в «Вашу ван»?"
	L["SettingDialectTo"] = "Установка диалекта:"
	L["CurrentlySpeaking"] = "Сейчас говорю:"
	L["NoPrefixBaseLang"] = "Не используйте префикс, если говорите на базовом языке вашей фракции (общий/орочий как Альянс/Орда соответственно)."
	L["LanguagePreset"] = "Изучите языковые пресеты"
	L["ImportGameplay"] = "Геймплей"
	L["ImportGameplayTT"] = "Изучите предустановленные языки по умолчанию, которые ваша раса использовала бы в обычном игровом процессе.\nЭто перезапишет ваши текущие изученные языки."
	L["ImportRecommended"] = "рекомендуемые"
	L["ImportRecommendedTT"] = "Изучите предустановленные языки, которые ваша раса/класс, вероятно, выучила бы в своей вероятной истории.\nЭто перезапишет ваши текущие изученные языки."
	L["ThisLangHasRunesTT"] = "Если вы не выучили этот язык, на нем могут отображаться руны."
	L["ToggleLanguageLearnedTT"] = "Нажмите, чтобы переключить свою способность понимать этот язык, когда на нем говорите вы сами и другие."
	L["ToggleLanguageSpokenTT"] = "Нажмите, чтобы установить этот язык в качестве префикса."
	L["UseAutoShapeshiftOff"] = "Язык автоматического изменения формы отключен для этого персонажа."
	L["UseAutoShapeshiftOn"] = "Для этого персонажа включен автоматический язык Shapeshift."
	L["UseAutoShapeshift"] = "Язык автоматического изменения формы"
	L["UseAutoShapeshiftTT"] = "Преобразование в форму автоматически изменит ваш язык в соответствии с ассоциацией.\nТребуется: Теневая форма, Метаморфоза."
	L["LoadingProfile"] = "Загрузка профиля"
	L["HelpCMD"] = "Вы можете использовать "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/языки"..colorThingE..", или "..colorThingS.."/lang"..colorThingE.." для доступа к командам с косой чертой. Список доступных подопций команды с косой чертой:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - включение/выключение префикса [Language]."..
	"\n"..colorThingS.."open"..colorThingE.." - открыть рамку опций."..
	"\n"..colorThingS.."minimap"..colorThingE.." - включение/выключение кнопки миникарты."..
	"\nКроме того, вы можете установить язык, например "..colorThingS.."/дарнасский"..colorThingE.."."
	L["OnlyInCharacter"] = "Только в образе"
	L["OnlyInCharacterTT"] = "Включает префикс / диалект только в режиме «В образе».\nТребуется аддон Total RP 3"
	L["RuneSize"] = "Размер глифа"
	L["DisablePrefix"] = "Отключить префикс"
	L["EnablePrefix"] = "Включить префикс"
	L["ShowSelectionButton"] = "Показать мини-кнопку языков"
	L["ShowSelectionButtonTT"] = "Включает небольшую кнопку на экране для доступа к выбору изученных языков."
	L["SelectLanguage"] = "Выбрать язык"
	L["OpenMenu"] = "Открыть меню"
	L["DragFrame"] = "Переместить окно"
	L["LeftClick"] = "ЛКМ"
	L["RightClick"] = "ПКМ"
	L["ShiftDrag"] = "SHIFT + перетаскивание"


	L["Common"] = 		"всеобщий"				--7
	L["Darnassian"] = 	"дарнасский"			--2
	L["Dwarvish"] = 	"дворфийский"			--6
	L["Gnomish"] = 		"гномский"				--13
	L["Draenei"] = 		"дренейский"			--35
	L["Orcish"] = 		"орочий"				--1
	L["Zandali"] = 		"зандаларский"			--14
	L["Taurahe"] = 		"таурахэ"				--3
	L["Forsaken"] = 	"наречие Отрекшихся"	--33
	L["Thalassian"] = 	"талассийский"			--10
	L["Goblin"] = 		"гоблинский"			--40
	L["Shalassian"] = 	"Шалассийский"			--181
	L["Vulpera"] = 		"Вульперский"			--285
	L["Pandaren"] = 	"пандаренский"			--42
	L["Draconic"] = 	"драконий"				--11
	L["Demonic"] = 		"язык демонов"			--8
	L["Titan"] = 		"язык титанов"			--9
	L["Kalimag"] = 		"калимаг"				--12
	L["Shath'Yar"] = 	"шат'яр"				--178
	L["Nerubian"] = 	"Нерубский"				--307
	L["Sprite"] = 		"язык лесных духов"		--168
	L["Nerglish"] = 	"нерглийский"			--179
	L["Moonkin"] = 		"язык совухов"			--180
	L["Furbolg"] = 		"фурболгский"			--303
	L["Earthen"] = 		"Язык земельников"		--304
	L["Hara'ni"] = 		"хара'нийский"			--309

	L["Gutterspeak"] = 			"Нежити"
	L["Ancient Pandaren"] = 	"Древний пандарен"
	L["Broker"] = 				"Брокер"
	L["Cypher"] = 				"Шифры"
	L["Arathi"] = 				"Аратии"
	L["Mogu"] = 				"Могу"
	L["Ethereal"] = 			"Эфириал"
	L["K'areshi"] = 			"К'ареши"

return end

if LOCALE == "koKR" then
-- Korean translations go here
	L["Languages"] = "언어"
	L["Language"] = "언어"
	L["SLASH_1"] = "/언어"
	L["SLASH_2"] = "/언어"
	L["SLASH_3"] = "/언어"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "이해하다"
	L["TogglePrefixOff"] = "언어 접두어: 꺼짐"
	L["TogglePrefixOn"] = "언어 접두사: 켜짐"
	L["TogglePrefixTextOff"] = "자동화된 언어 접두어를 끕니다."
	L["TogglePrefixTextOn"] = "자동 언어 접두어를 끄는 중입니다."
	L["TogglePrefixTT"] = "현재 선택한 언어가 사용자 메시지 앞에 자동으로 추가되는지 여부를 제어합니다."
	L["Diction"] = "어법"
	L["Settings"] = SETTINGS
	L["Profiles"] = "프로필"
	L["ResetAccSettings"] = "계정 섹션과 관련된 모든 설정을 재설정합니다. 캐릭터별 설정은 초기화되지 않습니다."
	L["ResetCharSettings"] = "문자 섹션과 관련된 모든 설정을 재설정합니다. 계정별 설정은 재설정되지 않습니다."
	L["ResetAccSettingsConfirm"] = "언어에 대한 계정별 설정을 재설정하시겠습니까?"
	L["ResetCharSettingsConfirm"] = "이 캐릭터의 특정 언어 설정을 재설정하시겠습니까?"
	L["ApplyPresetConfirm"] = "현재 학습한 언어를 덮어쓰시겠습니까?"
	L["AddonPrefixColor"] = "언어 접두사 색상"
	L["AccountSettings"] = "계정 설정"
	L["CharacterSettings"] = "캐릭터 설정"
	L["MinimapTooltip"] = "언어\n언어 메뉴를 전환하려면 클릭하세요."
	L["GlyphsOff"] ="글리프를 끄는 중입니다."
	L["GlyphsOn"] = "글리프를 켜는 중입니다."
	L["UseGlyphs"] = "배우지 못한 언어는 글리프를 사용합니다."
	L["UseGlyphsTT"] = "학습되지 않은 언어가 개별 문자를 대체하기 위해 사용 가능한 경우 문자 모양을 사용하는지 여부를 제어합니다. 일부 언어에는 아직 글리프가 제공되지 않을 수 있습니다."
	L["SpeechBubblesOff"] = "말풍선 번역을 끄는 중입니다."
	L["SpeechBubblesOn"] = "말풍선 번역을 켜는 중입니다."
	L["SpeechBubbles"] = "말풍선에 표시"
	L["SpeechBubblesTT"] = "번역되지 않은 언어가 말풍선에 표시되는지 여부를 제어합니다.\nBlizzard API는 인스턴스화된 콘텐츠에서 이 기능이 작동하지 않도록 제한합니다."
	L["CombatOptionOn"] = "전투 중 번역을 켭니다."
	L["CombatOptionOff"] = "전투 중 번역을 끕니다."
	L["CombatOption"] = "전투 중 기능"
	L["CombatOptionTT"] = "애드온이 전투에서 작동할지 여부를 제어합니다."
	L["FactionOptionOn"] = "세력 언어를 무시합니다."
	L["FactionOptionOff"] = "세력 언어를 무시합니다."
	L["FactionOption"] = "자신의 세력 언어를 무시합니다."
	L["FactionOptionTT"] = "애드온이 얼라이언스 캐릭터의 경우 \"일반\"에 대한 접두사 옵션을 무시하거나 호드 캐릭터의 경우 \"오키어\"의 접두사 옵션을 무시할지 여부를 제어합니다."
	L["LinkToTotalRP3Off"] = "이 캐릭터에 대한 총 RP 3 링크가 비활성화되었습니다."
	L["LinkToTotalRP3On"] = "이 캐릭터에 총 RP 3 링크가 활성화되었습니다."
	L["LinkToTotalRP3"] = "Total RP 3 프로필 링크"
	L["LinkToTotalRP3TT"] = "Total RP 3 프로필에 따라 캐릭터 프로필을 자동으로 변경합니다. 여러 캐릭터가 동일한 프로필을 사용하는 경우 해당 캐릭터들의 설정이 유지됩니다.\nTotal RP 3 애드온이 필요합니다."
	L["SettingLanguageTo"] = "언어 설정:"
	L["EnableUnderstand"] = "이해 활성화"
	L["DisableUnderstand"] = "이해 비활성화"
	L["Dialect"] = "방언"
	L["DialectOff"] = "방언: 꺼짐"
	L["DialectOn"] = "방언: 켜짐"
	L["UseDialectTT"] = "사용자가 현재 말하는 동안 방언으로 말하는지 여부를 제어합니다. \"무엇을 원하시나요\"는 \"Waschu wan'?\"이 됩니다."
	L["SettingDialectTo"] = "방언을 다음으로 설정:"
	L["CurrentlySpeaking"] = "현재 말하고 있는 것:"
	L["NoPrefixBaseLang"] = "해당 세력의 기본 언어(각각 얼라이언스/호드와 같이 일반/오키어)를 사용하는 경우 접두사를 사용하지 마세요."
	L["LanguagePreset"] = "언어 사전 설정 알아보기"
	L["ImportGameplay"] = "게임플레이"
	L["ImportGameplayTT"] = "귀하의 종족이 일반적인 게임 플레이 메커니즘에서 사용하게 될 미리 설정된 기본 언어를 배우십시오.\n이렇게 하면 현재 학습한 언어를 덮어쓰게 됩니다."
	L["ImportRecommended"] = "추천"
	L["ImportRecommendedTT"] = "당신의 인종/직업이 아마도 역사에서 배웠을 것 같은 미리 설정된 언어를 배우십시오.\n이렇게 하면 현재 배운 언어를 덮어쓰게 됩니다."
	L["ThisLangHasRunesTT"] = "이 언어를 배우지 않으면 룬이 표시될 수 있습니다."
	L["ToggleLanguageLearnedTT"] = "자신과 다른 사람이 말할 때 이 언어를 이해할 수 있는 능력을 전환하려면 클릭하세요."
	L["ToggleLanguageSpokenTT"] = "이 언어를 접두어로 설정하려면 클릭하세요."
	L["UseAutoShapeshiftOff"] = "이 캐릭터에는 자동 변신 언어가 비활성화되었습니다."
	L["UseAutoShapeshiftOn"] = "이 캐릭터에 자동 Shapeshift 언어가 활성화되었습니다."
	L["UseAutoShapeshift"] = "자동 변신 언어"
	L["UseAutoShapeshiftTT"] = "형태로 변신하면 자동으로 언어가 연관되어 변경됩니다.\n필요 사항: Shadowform, Metamorphosis."
	L["LoadingProfile"] = "프로필 로드 중"
	L["HelpCMD"] = colorThingS.."/languages"..colorThingE..", "..colorThingS.."/언어"..colorThingE..", 또는 "..colorThingS.."/lang"..colorThingE.." 사용하여 슬래시 명령에 액세스할 수 있습니다. 사용 가능한 슬래시 명령 하위 옵션 목록은 다음과 같습니다:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - [언어] 접두어를 켜거나 끕니다."..
	"\n"..colorThingS.."open"..colorThingE.." - 옵션 프레임을 엽니다."..
	"\n"..colorThingS.."minimap"..colorThingE.." - 미니맵 버튼을 켜거나 끕니다."..
	"\n또한 "..colorThingS.."/나이트 엘프어"..colorThingE.." 과 같은 언어를 설정할 수 있습니다."
	L["OnlyInCharacter"] = "캐릭터 상태에서만"
	L["OnlyInCharacterTT"] = "\"캐릭터 상태\"일 때만 접두사 / 방언을 활성화합니다.\nTotal RP 3 애드온이 필요합니다"
	L["RuneSize"] = "문양 크기"
	L["DisablePrefix"] = "접두사 비활성화"
	L["EnablePrefix"] = "접두사 활성화"
	L["ShowSelectionButton"] = "언어 미니 버튼 표시"
	L["ShowSelectionButtonTT"] = "학습한 언어 선택에 접근할 수 있는 작은 버튼을 화면에 표시합니다."
	L["SelectLanguage"] = "언어 선택"
	L["OpenMenu"] = "메뉴 열기"
	L["DragFrame"] = "프레임 이동"
	L["LeftClick"] = "좌클릭"
	L["RightClick"] = "우클릭"
	L["ShiftDrag"] = "SHIFT + 드래그"


	L["Common"] = 		"공용어"			--7
	L["Darnassian"] = 	"나이트 엘프어"	--2
	L["Dwarvish"] = 	"드워프어"		--6
	L["Gnomish"] = 		"노움어"			--13
	L["Draenei"] = 		"드레나이어"		--35
	L["Orcish"] = 		"오크어"			--1
	L["Zandali"] = 		"잔달라어"		--14
	L["Taurahe"] = 		"타우렌어"		--3
	L["Forsaken"] = 	"포세이큰어"		--33
	L["Thalassian"] = 	"하이엘프어"		--10
	L["Goblin"] = 		"고블린어"		--40
	L["Shalassian"] = 	"나이트본어"		--181
	L["Vulpera"] = 		"불페라어"		--285
	L["Pandaren"] = 	"판다렌어"		--42
	L["Draconic"] = 	"용언"			--11
	L["Demonic"] = 		"악마어"			--8
	L["Titan"] = 		"티탄어"			--9
	L["Kalimag"] = 		"정령어"			--12
	L["Shath'Yar"] = 	"샤트야르"		--178
	L["Nerubian"] = 	"네루비안"		--307
	L["Sprite"] = 		"요마어"			--168
	L["Nerglish"] = 	"옳옳어"			--179
	L["Moonkin"] = 		"달빛야수"		--180
	L["Furbolg"] = 		"펄볼그어"		--303
	L["Earthen"] = 		"토석인어"		--304
	L["Hara'ni"] = 		"하라니"			--309

	L["Gutterspeak"] = 			"언데드어"
	L["Ancient Pandaren"] = 	"고대 판다렌"
	L["Broker"] = 				"중개자"
	L["Cypher"] = 				"암호"
	L["Arathi"] = 				"아라시"
	L["Mogu"] = 				"모구"
	L["Ethereal"] = 			"에테리얼"
	L["K'areshi"] = 			"크아레쉬"

return end

if LOCALE == "zhCN" then
-- Simplified Chinese translations go here
	L["Languages"] = "语言"
	L["Language"] = "语言"
	L["SLASH_1"] = "/语言"
	L["SLASH_2"] = "/语言"
	L["SLASH_3"] = "/语言"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "理解"
	L["TogglePrefixOff"] = "语言前缀：关"
	L["TogglePrefixOn"] = "语言前缀：开"
	L["TogglePrefixTextOff"] = "关闭自动语言前缀。"
	L["TogglePrefixTextOn"] = "“关闭自动语言前缀。”"
	L["TogglePrefixTT"] = "控制当前选择的语言是否自动为用户消息添加前缀。"
	L["Diction"] = "措辞"
	L["Settings"] = SETTINGS
	L["Profiles"] = "型材"
	L["ResetAccSettings"] = "重置特定于帐户部分的所有设置。 这不会重置特定于角色的设置。"
	L["ResetCharSettings"] = "重置特定于字符部分的所有设置。 这不会重置帐户特定的设置。"
	L["ResetAccSettingsConfirm"] = "您确定要重置帐户特定的语言设置吗？"
	L["ResetCharSettingsConfirm"] = "您确定要重置该角色的语言特定设置吗？"
	L["ApplyPresetConfirm"] = "您确定要覆盖您当前学习的语言吗？"
	L["AddonPrefixColor"] = "语言前缀颜色"
	L["AccountSettings"] = "帐号设定"
	L["CharacterSettings"] = "角色设定"
	L["MinimapTooltip"] = "语言\n单击可切换语言菜单。"
	L["GlyphsOff"] ="关闭字形。"
	L["GlyphsOn"] = "打开字形。"
	L["UseGlyphs"] = "未学过的语言使用字形"
	L["UseGlyphsTT"] = "控制未学习的语言是否使用可用的字形来替换单个字符。 有些语言可能还没有可用的字形。"
	L["SpeechBubblesOff"] = "关闭语音气泡翻译。"
	L["SpeechBubblesOn"] = "打开语音气泡翻译。"
	L["SpeechBubbles"] = "在气泡中显示"
	L["SpeechBubblesTT"] = "控制未翻译的语言是否会显示在对话气泡中。\n暴雪 API 限制此功能在实例化内容中工作。"
	L["CombatOptionOn"] = "在战斗中打开翻译。"
	L["CombatOptionOff"] = "战斗期间关闭翻译。"
	L["CombatOption"] = "战斗时的功能"
	L["CombatOptionTT"] = "控制插件是否在战斗中起作用"
	L["FactionOptionOn"] = "忽略派系语言。"
	L["FactionOptionOff"] = "忽略派系语言。"
	L["FactionOption"] = "忽略自己派系的语言"
	L["FactionOptionTT"] = "控制插件是否会忽略联盟角色的\"Common\"前缀选项或部落角色的\"Orcish\"前缀选项。"
	L["LinkToTotalRP3Off"] = "该角色总共禁用 RP 3 链接。"
	L["LinkToTotalRP3On"] = "为此角色启用的总 RP 3 链接。"
	L["LinkToTotalRP3"] = "链接至 Total RP 3 配置文件"
	L["LinkToTotalRP3TT"] = "根据 Total RP 3 个人资料自动更改角色的个人资料。 如果多个角色使用相同的配置文件，这应该保留这些角色的设置。\n需要插件 Total RP 3"
	L["SettingLanguageTo"] = "将语言设置为："
	L["EnableUnderstand"] = "启用理解"
	L["DisableUnderstand"] = "禁用理解"
	L["Dialect"] = "方言"
	L["DialectOff"] = "方言：关闭"
	L["DialectOn"] = "方言：开"
	L["UseDialectTT"] = "控制用户当前说话时是否使用方言，例如方言。 “你想要什么”变成“Waschu wan'？”。"
	L["SettingDialectTo"] = "“将方言设置为：”"
	L["CurrentlySpeaking"] = "目前正在讲："
	L["NoPrefixBaseLang"] = "如果您使用派系的基本语言（通用/兽人语分别为联盟/部落），请勿使用前缀。"
	L["LanguagePreset"] = "学习语言预设"
	L["ImportGameplay"] = "游戏玩法"
	L["ImportGameplayTT"] = "学习您的种族在正常游戏机制中会使用的预设默认语言。\n这将覆盖您当前学习的语言。"
	L["ImportRecommended"] = "受到推崇的"
	L["ImportRecommendedTT"] = "学习您的种族/阶级在其可能的历史中可能会学习的预设语言。\n这将覆盖您当前学习的语言。"
	L["ThisLangHasRunesTT"] = "这种语言在未学习时可以显示符文。"
	L["ToggleLanguageLearnedTT"] = "单击可切换您在自己和他人所说的语言时理解该语言的能力。"
	L["ToggleLanguageSpokenTT"] = "单击将此语言设置为您的前缀。"
	L["UseAutoShapeshiftOff"] = "该角色禁用自动变形语言。"
	L["UseAutoShapeshiftOn"] = "为此角色启用自动变形语言。"
	L["UseAutoShapeshift"] = "自动变形语言"
	L["UseAutoShapeshiftTT"] = "变形为某种形态会自动改变你的语言与其关联。\n需要：暗影形态、变形。"
	L["LoadingProfile"] = "加载配置文件"
	L["HelpCMD"] = "您可以使用 "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/语言"..colorThingE..", 或 "..colorThingS.."/lang"..colorThingE.." t来访问斜杠命令。可用的斜杠命令子选项列表:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - 打开/关闭 [Language] 前缀。"..
	"\n"..colorThingS.."open"..colorThingE.." - 打开选项框架。"..
	"\n"..colorThingS.."minimap"..colorThingE.." - 打开/关闭小地图按钮。"..
	"\n此外，您还可以设置语言，例如 "..colorThingS.."/达纳苏斯语"..colorThingE.."。"
	L["OnlyInCharacter"] = "仅角色状态"
	L["OnlyInCharacterTT"] = "仅在“角色状态”下启用前缀 / 方言。\n需要 Total RP 3 插件"
	L["RuneSize"] = "雕文大小"
	L["DisablePrefix"] = "禁用前缀"
	L["EnablePrefix"] = "启用前缀"
	L["ShowSelectionButton"] = "显示语言迷你按钮"
	L["ShowSelectionButtonTT"] = "在屏幕上显示一个小按钮，用于访问已学习语言的选择。"
	L["SelectLanguage"] = "选择语言"
	L["OpenMenu"] = "打开菜单"
	L["DragFrame"] = "拖动框体"
	L["LeftClick"] = "左键点击"
	L["RightClick"] = "右键点击"
	L["ShiftDrag"] = "SHIFT + 拖动"



	L["Common"] = 		"通用语"			--7
	L["Darnassian"] = 	"达纳苏斯语"		--2
	L["Dwarvish"] = 	"矮人语"			--6
	L["Gnomish"] = 		"侏儒语"			--13
	L["Draenei"] = 		"德莱尼语"		--35
	L["Orcish"] = 		"兽人语"			--1
	L["Zandali"] = 		"赞达拉语"		--14
	L["Taurahe"] = 		"牛头人语"		--3
	L["Forsaken"] = 	"亡灵语"			--33
	L["Thalassian"] = 	"萨拉斯语"		--10
	L["Goblin"] = 		"地精语"			--40
	L["Shalassian"] = 	"夏拉斯语"		--181
	L["Vulpera"] = 		"狐人语"			--285
	L["Pandaren"] = 	"熊猫人语"		--42
	L["Draconic"] = 	"龙语"			--11
	L["Demonic"] = 		"恶魔语"			--8
	L["Titan"] = 		"泰坦语"			--9
	L["Kalimag"] = 		"卡利麦格语"		--12
	L["Shath'Yar"] = 	"沙斯亚尔语"		--178
	L["Nerubian"] = 	"蛛魔语"			--307
	L["Sprite"] = 		"林精语"			--168
	L["Nerglish"] = 	"水生语"			--179
	L["Moonkin"] = 		"枭兽语"			--180
	L["Furbolg"] = 		"熊怪语"			--303
	L["Earthen"] = 		"土灵语"			--304
	L["Hara'ni"] = 		"哈籁尼语"		--309

	L["Gutterspeak"] = 			"亡灵语"
	L["Ancient Pandaren"] = 	"古代熊猫人"
	L["Broker"] = 				"掮灵"
	L["Cypher"] = 				"密文"
	L["Arathi"] = 				"阿拉希"
	L["Mogu"] = 				"魔古族"
	L["Ethereal"] = 			"虚灵"
	L["K'areshi"] = 			"卡雷什"

return end

if LOCALE == "zhTW" then
-- Traditional Chinese translations go here
	L["Languages"] = "語言"
	L["Language"] = "語言"
	L["SLASH_1"] = "/語言"
	L["SLASH_2"] = "/語言"
	L["SLASH_3"] = "/語言"
	L["SLASH_4"] = "/languages" -- non-localized slash
	L["SLASH_5"] = "/language"
	L["SLASH_6"] = "/lang"
	L["Understand"] = "理解"
	L["TogglePrefixOff"] = "語言前綴：關閉"
	L["TogglePrefixOn"] = "語言前綴：開"
	L["TogglePrefixTextOff"] = "關閉自動語言前綴。"
	L["TogglePrefixTextOn"] = "“關閉自動語言前綴。”"
	L["TogglePrefixTT"] = "控制目前選擇的語言是否自動為使用者訊息添加前綴。"
	L["Diction"] = "措辭"
	L["Settings"] = SETTINGS
	L["Profiles"] = "型材"
	L["ResetAccSettings"] = "重置特定於帳戶部分的所有設定。 這不會重置特定於角色的設定。"
	L["ResetCharSettings"] = "重置特定於字元部分的所有設定。 這不會重置帳戶特定的設定。"
	L["ResetAccSettingsConfirm"] = "您確定要重設帳戶特定的語言設定嗎？"
	L["ResetCharSettingsConfirm"] = "您確定要重置該角色的語言特定設定嗎？"
	L["ApplyPresetConfirm"] = "您確定要涵蓋您目前學習的語言嗎？"
	L["AddonPrefixColor"] = "語言前綴顏色"
	L["AccountSettings"] = "帳號設定"
	L["CharacterSettings"] = "角色設定"
	L["MinimapTooltip"] = "語言\n點選可切換語言選單。"
	L["GlyphsOff"] ="關閉字形。"
	L["GlyphsOn"] = "打開字形。"
	L["UseGlyphs"] = "未學過的語言使用字形"
	L["UseGlyphsTT"] = "控制未學習的語言是否使用可用的字形來替換單一字元。 有些語言可能還沒有可用的字形。"
	L["SpeechBubblesOff"] = "關閉語音氣泡翻譯。"
	L["SpeechBubblesOn"] = "開啟語音氣泡翻譯。"
	L["SpeechBubbles"] = "在氣泡中顯示"
	L["SpeechBubblesTT"] = "控制未翻譯的語言是否會顯示在對話氣泡中。\n暴雪 API 限制此功能在實例化內容中運作。"
	L["CombatOptionOn"] = "在戰鬥中打開翻譯。"
	L["CombatOptionOff"] = "戰鬥期間關閉翻譯。"
	L["CombatOption"] = "戰鬥時的功能"
	L["CombatOptionTT"] = "控制插件是否在戰鬥中起作用"
	L["FactionOptionOn"] = "忽略派系語言。"
	L["FactionOptionOff"] = "忽略派系語言。"
	L["FactionOption"] = "忽略自己派系的語言"
	L["FactionOptionTT"] = "控制外掛程式是否會忽略聯盟角色的\"Common\"前綴選項或部落角色的\"Orcish\"前綴選項。"
	L["LinkToTotalRP3Off"] = "該角色總共停用 RP 3 連結。"
	L["LinkToTotalRP3On"] = "為此角色啟用的總 RP 3 連結。"
	L["LinkToTotalRP3"] = "連結至 Total RP 3 設定文件"
	L["LinkToTotalRP3TT"] = "根據 Total RP 3 個人資料自動變更角色的個人資料。 如果多個角色使用相同的配置文件，這應該保留這些角色的設定。\n需要插件 Total RP 3"
	L["SettingLanguageTo"] = "將語言設定為："
	L["EnableUnderstand"] = "啟用理解"
	L["DisableUnderstand"] = "禁用理解"
	L["Dialect"] = "方言"
	L["DialectOff"] = "方言：關閉"
	L["DialectOn"] = "方言：開"
	L["UseDialectTT"] = "控制使用者目前說話時是否使用方言，例如方言。 「你想要什麼」變成「Waschu wan'？」。"
	L["SettingDialectTo"] = "“將方言設定為：”"
	L["CurrentlySpeaking"] = "目前正在講："
	L["NoPrefixBaseLang"] = "如果您使用派系的基本語言（通用/獸人語分別為聯盟/部落），請勿使用前綴。"
	L["LanguagePreset"] = "學習語言預設"
	L["ImportGameplay"] = "遊戲玩法"
	L["ImportGameplayTT"] = "學習您的種族在正常遊戲機制中會使用的預設預設語言。\n這將覆蓋您目前學習的語言。"
	L["ImportRecommended"] = "受到推崇的"
	L["ImportRecommendedTT"] = "學習您的種族/階級在其可能的歷史中可能會學習的預設語言。\n這將涵蓋您當前學習的語言。"
	L["ThisLangHasRunesTT"] = "這種語言在未學習時可以顯示符文。"
	L["ToggleLanguageLearnedTT"] = "點擊可切換您在自己和他人所說的語言時理解該語言的能力。"
	L["ToggleLanguageSpokenTT"] = "點擊將此語言設定為您的前綴。"
	L["UseAutoShapeshiftOff"] = "該角色會停用自動變形語言。"
	L["UseAutoShapeshiftOn"] = "為此角色啟用自動變形語言。"
	L["UseAutoShapeshift"] = "自動變形語言"
	L["UseAutoShapeshiftTT"] = "變形為某種形態會自動改變你的語言與其關聯。\n需要：暗影形態、變形。"
	L["LoadingProfile"] = "載入設定檔"
	L["HelpCMD"] = "您可以使用 "..colorThingS.."/languages"..colorThingE..", "..colorThingS.."/語言"..colorThingE..", 或 "..colorThingS.."/lang"..colorThingE.." 來存取斜杠命令。可用的斜杠命令子選項清單:"..
	"\n"..colorThingS.."prefix"..colorThingE.." - 開啟/關閉 [Language] 前綴。"..
	"\n"..colorThingS.."open"..colorThingE.." - 開啟選項框架。"..
	"\n"..colorThingS.."minimap"..colorThingE.." - 開啟/關閉小地圖按鈕。"..
	"\n此外，您還可以設定語言，例如 "..colorThingS.."/達納蘇斯語"..colorThingE.."。"
	L["OnlyInCharacter"] = "僅角色狀態"
	L["OnlyInCharacterTT"] = "僅在「角色狀態」下啟用前綴 / 方言。\n需要 Total RP 3 外掛"
	L["RuneSize"] = "雕文大小"
	L["DisablePrefix"] = "停用前綴"
	L["EnablePrefix"] = "啟用前綴"
	L["ShowSelectionButton"] = "顯示語言迷你按鈕"
	L["ShowSelectionButtonTT"] = "在畫面上顯示一個小按鈕，用於存取已學會的語言選擇。"
	L["SelectLanguage"] = "選擇語言"
	L["OpenMenu"] = "開啟選單"
	L["DragFrame"] = "拖曳框架"
	L["LeftClick"] = "左鍵點擊"
	L["RightClick"] = "右鍵點擊"
	L["ShiftDrag"] = "SHIFT + 拖曳"


	L["Common"] = 		"通用語"			--7
	L["Darnassian"] = 	"達納蘇斯語"		--2
	L["Dwarvish"] = 	"矮人語"			--6
	L["Gnomish"] = 		"地精語"			--13
	L["Draenei"] = 		"德萊尼語"		--35
	L["Orcish"] = 		"獸人語"			--1
	L["Zandali"] = 		"食人妖語"		--14
	L["Taurahe"] = 		"牛頭人語"		--3
	L["Forsaken"] = 	"不死族語"		--33
	L["Thalassian"] = 	"薩拉斯語"		--10
	L["Goblin"] = 		"哥布林語"		--40
	L["Shalassian"] = 	"夏拉斯語"		--181
	L["Vulpera"] = 		"狐狸人語"		--285
	L["Pandaren"] = 	"熊貓人語"		--42
	L["Draconic"] = 	"龍語"			--11
	L["Demonic"] = 		"惡魔語"			--8
	L["Titan"] = 		"泰坦語"			--9
	L["Kalimag"] = 		"元素語"			--12
	L["Shath'Yar"] = 	"古神語"			--178
	L["Nerubian"] = 	"奈幽語"			--307
	L["Sprite"] = 		"妖精語"			--168
	L["Nerglish"] = 	"魚人語"			--179
	L["Moonkin"] = 		"梟獸語"			--180
	L["Furbolg"] = 		"熊怪語"			--303
	L["Earthen"] = 		"土靈"			--304
	L["Hara'ni"] = 		"哈拉尼"			--309
	
	L["Gutterspeak"] = 			"不死族語"
	L["Ancient Pandaren"] = 	"古代熊貓人"
	L["Broker"] = 				"仲介者"
	L["Cypher"] = 				"暗語"
	L["Arathi"] = 				"阿拉希"
	L["Mogu"] = 				"魔古"
	L["Ethereal"] = 			"以太"
	L["K'areshi"] = 			"凱瑞西"

return end
