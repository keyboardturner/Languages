local Languages, L = ...; -- Let's use the private table passed to every .lua 

local function defaultFunc(L, key)
 -- If this function was called, we have no localization for this key.
 -- We could complain loudly to allow localizers to see the error of their ways, 
 -- but, for now, just return the key as its own localization. This allows you to—avoid writing the default localization out explicitly.
 return key;
end
setmetatable(L, {__index=defaultFunc});

local LOCALE = GetLocale()

if LOCALE == "enUS" then
	-- The EU English game client also
	-- uses the US English locale code.
	L["Languages"] = "Languages"
	L["Language"] = "Language"
	L["Understand"] = "Understand"
	L["TogglePrefixOff"] = "Language Prefix: Off"
	L["TogglePrefixOn"] = "Language Prefix: On"
	L["TogglePrefixTextOff"] = "Toggling off automated language prefix."
	L["TogglePrefixTextOn"] = "Toggling off automated language prefix."
	L["TogglePrefixTT"] = "Controls if the currently selected language automatically prefixes the user's message."
	L["Diction"] = "Diction"
	L["Settings"] = "Settings"
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
	L["Dialect"] = "Dialect (Coming Soon)"
	L["DialectOff"] = "Dialect: Off"
	L["DialectOn"] = "Dialect: On"
	L["UseDialectTT"] = "Controls if the user currently speaks with a dialect while speaking, e.g. \"What do you want\" becomes \"Waschu wan'?\"."
	L["SettingDialectTo"] = "Setting dialect to:"
	L["Dwarvish"] = "Dwarvish"
	L["Draenic"] = "Draenic"
	L["Zandali"] = "Zandali"
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

return end

if LOCALE == "esES" or LOCALE == "esMX" then
	-- Spanish translations go here

return end

if LOCALE == "deDE" then
	-- German translations go here

return end

if LOCALE == "frFR" then
	-- French translations go here

return end

if LOCALE == "itIT" then
	-- French translations go here

return end

if LOCALE == "ptBR" then
	-- Brazilian Portuguese translations go here

-- Note that the EU Portuguese WoW client also
-- uses the Brazilian Portuguese locale code.
return end

if LOCALE == "ruRU" then
	-- Russian translations go here

return end

if LOCALE == "koKR" then
	-- Korean translations go here

return end

if LOCALE == "zhCN" then
	-- Simplified Chinese translations go here

return end

if LOCALE == "zhTW" then
	-- Traditional Chinese translations go here

return end
