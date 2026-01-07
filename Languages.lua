local _, Lang = ...;

local L = Lang.L;
local Dialects = Lang.Dialects;
local LANGUAGE_REPLACEMENTS = Lang.LANGUAGE_REPLACEMENTS
local Dictionaries = Lang.Dictionaries
local AlphabetKerning = Lang.AlphabetKerning

local defaultsTableAcc = {
	
	glyphs = true, glyphSizeX = 15, glyphSizeY = 15,
	runeScale = 1.0,
	characterSpecific = true,
	debug = false,

	colors = {
		prefix = {r = 28/255, g = 230/255, b = 81/255},
		text = {r = 1, g = 1, b = 1},
	},

	speechBubbles = true,
	combat = false,
	faction = true,

};

local defaultsTableChar = {
	minimap = {
		hide = false,
	},
	TRP3 = true;
	translation = false,
	understandAll = false,
	shapeshift = false,
	onlyInCharacter = true,
	understandLanguage = {
	},
	dialect = nil,
	dialectWordToggles = {},
	favoriteLanguages = {},
	selectionButton = {
		shown = true,
		point = "CENTER",
		relativePoint = "CENTER",
		x = 0,
		y = 0,
	},
};

local lang = CreateFrame("Frame");
local chatTypeBingus = ChatTypeInfo["SAY"];

local realmKey = GetRealmName()
local charKey = UnitName("player") .. " - " .. realmKey
local MatchCasing

local function GetPlayerRaceID()
	return select(3, UnitRace("player"))
end

local function GetPlayerClassID()
	return select(3, UnitClass("player"))
end

local function GetLanguageNameByID(langID) -- default languages
	for i = 1, GetNumLanguages() do
		local name, id = GetLanguageByIndex(i)
		if id == langID then
			return name
		end
	end
	return nil
end

local function Print(text)
	local textColor = CreateColor(Languages_DB.settings.colors.prefix.r, Languages_DB.settings.colors.prefix.g, Languages_DB.settings.colors.prefix.b):GenerateHexColor()
	text = "|c" .. textColor .. L["Languages"] .. "|r" .. ": " .. text
	
	return DEFAULT_CHAT_FRAME:AddMessage(text, 1, 1, 1)
end

local function GetActiveProfile()
	if C_AddOns.IsAddOnLoaded("totalRP3") and TRP3_API then
		local trpProfile = TRP3_API.profile.getPlayerCurrentProfile()
		if trpProfile and trpProfile.profileName then
			local key = "TRP3_" .. trpProfile.profileName
			
			if not Languages_DB.profiles[key] then
				Languages_DB.profiles[key] = CopyTable(defaultsTableChar)
			end
			
			if Languages_DB.profiles[charKey].TRP3 then
				return Languages_DB.profiles[key]
			end
		end
	end
	if not Languages_DB then
		Languages_DB = {}
	end
	if Languages_DB and charKey and Languages_DB.profiles and not Languages_DB.profiles[charKey] then
		Languages_DB.profiles[charKey] = CopyTable(defaultsTableChar)
	end
	if Languages_DB and charKey and Languages_DB.profiles and Languages_DB.profiles[charKey] then
		return Languages_DB.profiles[charKey]
	end
end

local mainFrame = CreateFrame("Frame", "LanguagesMainFrame", UIParent, "PortraitFrameTemplateMinimizable")
mainFrame:SetPortraitTextureRaw("Interface\\AddOns\\Languages\\Languages_Icon_Small")
--mainFrame.PortraitContainer.portrait:SetTexture("Interface\\AddOns\\Languages\\Languages_Icon_Small")
mainFrame:SetTitle("Languages")
mainFrame:SetSize(438,524)
mainFrame:SetPoint("CENTER", UIParent, "CENTER")
mainFrame:SetMovable(true)
mainFrame:SetClampedToScreen(true)
mainFrame:Hide()
mainFrame.minMax = true;

function mainFrame.minMaxFunc()
	if mainFrame.minMax == true then
		mainFrame:SetSize(338,100)
		mainFrame.minMax = false
	elseif mainFrame.minMax == false then
		mainFrame:SetSize(438,524)
		mainFrame.minMax = true
	end
end

function mainFrame:ShowColorPickerText(r, g, b, callbackFunc)
	if ColorPickerFrame.SetupColorPickerAndShow then
		local options = {
			swatchFunc = callbackFunc,
			opacityFunc = callbackFunc,
			cancelFunc = callbackFunc,
			hasOpacity = false,
			r = r,
			g = g,
			b = b,
		};

		ColorPickerFrame:SetupColorPickerAndShow(options);
	else
		ColorPickerFrame.hasOpacity, ColorPickerFrame.opacity = false, a;
		ColorPickerFrame.previousValues = {r,g,b};
		ColorPickerFrame.func, ColorPickerFrame.opacityFunc, ColorPickerFrame.cancelFunc = callbackFunc, callbackFunc, callbackFunc;
		ColorPickerFrame:SetColorRGB(r,g,b);
		ColorPickerFrame:Hide();
		ColorPickerFrame:Show();
	end
end

function mainFrame.PrefixColor(restore)
	local newR, newG, newB; -- I forgot what to do with the alpha value but it's needed to not swap RGB values
	if restore then
	 -- The user bailed, we extract the old color from the table created by ShowColorPicker.
		newR = restore["r"]
		newG = restore["g"]
		newB = restore["b"]
	else
	 -- Something changed
		newR, newG, newB = ColorPickerFrame:GetColorRGB();
	end
	 -- Update our internal storage.
	r, g, b = newR, newG, newB
	 -- And update any UI elements that use this color...
	Languages_DB.settings.colors.prefix.r, Languages_DB.settings.colors.prefix.g, Languages_DB.settings.colors.prefix.b = newR, newG, newB;
end

mainFrame.MinimizeButton = CreateFrame("Button", "LanguagesMainFrameMinMaxButton", mainFrame, "MaximizeMinimizeButtonFrameTemplate")
mainFrame.MinimizeButton:SetPoint("TOPRIGHT", mainFrame, "TOPRIGHT", -24,0)
mainFrame.MinimizeButton:SetSize(24,24)
mainFrame.MinimizeButton:Enable()
mainFrame.MinimizeButton.MinimizeButton:SetScript("OnClick", mainFrame.minMaxFunc);
mainFrame.MinimizeButton.MaximizeButton:SetScript("OnClick", mainFrame.minMaxFunc);

mainFrame.ScrollFrame = CreateFrame("ScrollFrame", nil, mainFrame, "ScrollFrameTemplate")
mainFrame.ScrollFrame:SetPoint("TOPLEFT", mainFrame, "TOPLEFT", 4, -8)
mainFrame.ScrollFrame:SetPoint("BOTTOMRIGHT", mainFrame, "BOTTOMRIGHT", -3, 4)
mainFrame.ScrollFrame.ScrollBar:ClearAllPoints()
mainFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", mainFrame.ScrollFrame, "TOPRIGHT", -12, -18)
mainFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", mainFrame.ScrollFrame, "BOTTOMRIGHT", -7, 0)


mainFrame.ScrollFrame.child = CreateFrame("Frame", nil, mainFrame.ScrollFrame)
mainFrame.ScrollFrame:SetScrollChild(mainFrame.ScrollFrame.child)
mainFrame.ScrollFrame.child:SetWidth(mainFrame:GetWidth()-18)
mainFrame.ScrollFrame.child:SetHeight(1)

function mainFrame.Tab_OnClick(self)

	PanelTemplates_SetTab(self:GetParent(), self:GetID())

	local scrollChild = mainFrame.ScrollFrame:GetScrollChild()
	if (scrollChild) then
		scrollChild:Hide();
	end

	mainFrame.ScrollFrame:SetScrollChild(self.content)
	self.content:Show()
	PlaySound(841)

end

function mainFrame.SetTabs(frame,numTabs, ...)
	frame.numTabs = numTabs

	local contents = {};
	local frameName = frame:GetName()

	for i = 1, numTabs do

		mainFrame.TabButtonTest = CreateFrame("Button", frameName .. "Tab" .. i, frame, "PanelTabButtonTemplate")
		mainFrame.TabButtonTest:SetID(i)
		mainFrame.TabButtonTest:SetText(select(i, ...))
		mainFrame.TabButtonTest:SetScript("OnClick", mainFrame.Tab_OnClick)

		mainFrame.TabButtonTest.content = CreateFrame("Frame", nil, mainFrame.ScrollFrame)
		mainFrame.TabButtonTest.content:SetSize(frame:GetWidth(), 10)
		mainFrame.TabButtonTest.content:Hide()

		--mainFrame.TabButtonTest.content.bg = mainFrame.TabButtonTest.content:CreateTexture(nil, "BACKGROUND")
		--mainFrame.TabButtonTest.content.bg:SetAllPoints(true)
		--mainFrame.TabButtonTest.content.bg:SetColorTexture(math.random(), math.random(), math.random(), .6)

		table.insert(contents, mainFrame.TabButtonTest.content)

		if (i == 1) then
			mainFrame.TabButtonTest:SetPoint("TOPLEFT", mainFrame, "BOTTOMLEFT", 11,2);
		else
			mainFrame.TabButtonTest:SetPoint("TOPLEFT", _G[frameName .. "Tab" .. (i-1)] , "TOPRIGHT", 3, 0);
		end

		--[[
		mainFrame.TabButtonTest:SetPoint("TOPLEFT", mainFrame, "BOTTOMLEFT", 20,0)
		mainFrame.TabButtonTest:SetSize(100,30)
		mainFrame.TabButtonTest:Enable()
		mainFrame.TabButtonTest:SetScript("OnClick", function(self, button)
			print("bingus")

		end);

		]]

		
	end


	mainFrame.Tab_OnClick(_G[frameName .. "Tab1"])

	return unpack(contents);

end

local currentLanguage = {};
local preserveLanguage = {};
local content1, contentDialect, content2, content3 = mainFrame.SetTabs(mainFrame, 4, L["Diction"], L["Dialect"], L["Settings"], L["Profiles"])

mainFrame.DialectWordList_Frame = CreateFrame("Frame", nil, contentDialect, "BackdropTemplate")
mainFrame.DialectWordList_Frame:SetPoint("TOPLEFT", contentDialect, "TOPLEFT", 10, -50)
mainFrame.DialectWordList_Frame:SetPoint("TOPRIGHT", contentDialect, "TOPRIGHT", -25, -50)
mainFrame.DialectWordList_Frame:SetHeight(435)
mainFrame.DialectWordList_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.DialectWordList_Frame:SetBackdropColor(0,0,0,.5)

local DialectScrollBox = CreateFrame("Frame", nil, mainFrame.DialectWordList_Frame, "WowScrollBoxList")
DialectScrollBox:SetPoint("TOPLEFT", 5, -35)
DialectScrollBox:SetPoint("BOTTOMRIGHT", -25, 5)

local DialectScrollBar = CreateFrame("EventFrame", nil, mainFrame.DialectWordList_Frame, "MinimalScrollBar")
DialectScrollBar:SetPoint("TOPLEFT", DialectScrollBox, "TOPRIGHT", 5, 0)
DialectScrollBar:SetPoint("BOTTOMLEFT", DialectScrollBox, "BOTTOMRIGHT", 5, 0)

local DialectScrollView = CreateScrollBoxListLinearView()
ScrollUtil.InitScrollBoxListWithScrollBar(DialectScrollBox, DialectScrollBar, DialectScrollView)

local function DialectRowInitializer(button, data)
	if not button.bg then
		button.bg = button:CreateTexture(nil, "BACKGROUND")
		button.bg:SetAllPoints()
		button.bg:SetAtlas("ClickCastList-ButtonBackground")
		button.bg:SetAlpha(0.3)
	end

	if not button.checkbox then
		button.checkbox = CreateFrame("CheckButton", nil, button, "UICheckButtonTemplate")
		button.checkbox:SetSize(24, 24)
		button.checkbox:SetPoint("LEFT", button, "LEFT", 5, 0)
	end

	if not button.text then
		button.text = button:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		button.text:SetPoint("LEFT", button.checkbox, "RIGHT", 5, 0)
		button.text:SetPoint("RIGHT", -5, 0)
		button.text:SetJustifyH("LEFT")
	end
	
	button.text:SetText(string.format("%s |cFF888888->|r %s", data.word, data.replacement))
	
	local profile = GetActiveProfile()
	local isEnabled = true
	if profile.dialectWordToggles and profile.dialectWordToggles[profile.dialect] then
		local val = profile.dialectWordToggles[profile.dialect][data.word]
		if val == false then isEnabled = false end
	end
	
	button.checkbox:SetChecked(isEnabled)

	button.checkbox:SetScript("OnClick", function(self)
		local isChecked = self:GetChecked()
		local profile = GetActiveProfile()
		local dialect = profile.dialect
		
		if not profile.dialectWordToggles then profile.dialectWordToggles = {} end
		if not profile.dialectWordToggles[dialect] then profile.dialectWordToggles[dialect] = {} end
		
		profile.dialectWordToggles[dialect][data.word] = isChecked
		
		if isChecked then PlaySound(856) else PlaySound(857) end
	end)
end

DialectScrollView:SetElementInitializer("Button", DialectRowInitializer)
DialectScrollView:SetElementExtent(30)
DialectScrollView:SetPadding(5, 5, 5, 5, 2)

function mainFrame.RefreshDialectWordList()
	local dataProvider = CreateDataProvider()
	local profile = GetActiveProfile()
	local currentDialect = profile.dialect

	if currentDialect and Dialects and Dialects[currentDialect] then
		local sortedWords = {}
		for word, replacement in pairs(Dialects[currentDialect]) do
			table.insert(sortedWords, {word = word, replacement = replacement})
		end
		
		table.sort(sortedWords, function(a,b) return a.word < b.word end)
		
		for _, data in ipairs(sortedWords) do
			dataProvider:Insert(data)
		end
	end
	
	DialectScrollView:SetDataProvider(dataProvider)
end

function lang.combatCheck()
	if UnitAffectingCombat("player") == true and Languages_DB.settings.combat == false then
		return true
	end
end

mainFrame.prefix = false
function mainFrame.TogglePrefix()
	if mainFrame.prefix == true then
		mainFrame.prefix = false;
		mainFrame.ButtonTest:SetText(L["TogglePrefixOff"]);
		--Print(L["TogglePrefixTextOff"]);

		if lang.SelectionButton then
			lang.SelectionButton:SetBackdropBorderColor(0.6, 0.0, 0.0, 1)
		end
	else
		mainFrame.prefix = true;
		if currentLanguage.lang then
			mainFrame.ButtonTest:SetText(L["TogglePrefixOn"] .. "\n" .. L["CurrentlySpeaking"] .. " " .. (L[currentLanguage.lang] or currentLanguage.lang));
		else
			mainFrame.ButtonTest:SetText(L["TogglePrefixOn"] .. "\n" .. L["CurrentlySpeaking"] .. " " .. "");
		end
		--Print(L["TogglePrefixTextOn"]);

		if lang.SelectionButton then
			lang.SelectionButton:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)
		end
	end
end


---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Prefix Handling
---------------------------------------------------------------------------------------------------------------------------------------------------------

local function ShouldProcessLanguage()
	local profile = GetActiveProfile()

	if C_AddOns.IsAddOnLoaded("totalrp3") and profile.onlyInCharacter then
		if TRP3_API and AddOn_TotalRP3 then
			local user = AddOn_TotalRP3.Player.GetCurrentUser()
			if user and user.IsInCharacter and not user:IsInCharacter() then
				return false
			end
		end
	end

	return true
end


local textBeforeParse, parsedEditBox;
local gopherPadding;

local function ApplyDialectToText(text)
	if not ShouldProcessLanguage() or not mainFrame.prefix then
		return text
	end
	
	local profile = GetActiveProfile()
	local dialectName = profile.dialect
	
	if not dialectName or not Dialects or not Dialects[dialectName] then
		return text
	end
	
	local dictionary = Dialects[dialectName]
	local toggles = profile.dialectWordToggles and profile.dialectWordToggles[dialectName]

	local keys = {}
	for targetWord in pairs(dictionary) do
		if not (toggles and toggles[targetWord] == false) then
			table.insert(keys, targetWord)
		end
	end
	table.sort(keys, function(a, b) return #a > #b end)

	local protectedMap = {}
	local protectedCount = 0
	
	local textLower = string.lower(text)

	for _, targetWord in ipairs(keys) do
		local targetLower = string.lower(targetWord)
		local replacementWord = dictionary[targetWord]
		
		local startPos, endPos = string.find(textLower, targetLower, 1, true)
		
		while startPos do
			local isStartBoundary = (startPos == 1) or not string.match(string.sub(text, startPos - 1, startPos - 1), "%a")
			local isEndBoundary = (endPos == #text) or not string.match(string.sub(text, endPos + 1, endPos + 1), "%a")
			
			if isStartBoundary and isEndBoundary then
				local originalSegment = string.sub(text, startPos, endPos)
				
				protectedCount = protectedCount + 1
				local token = "###LANG_P" .. protectedCount .. "###"
				
				local translated = MatchCasing(originalSegment, replacementWord)
				
				protectedMap[token] = translated
				
				text = string.sub(text, 1, startPos - 1) .. token .. string.sub(text, endPos + 1)
				
				textLower = string.lower(text)
				
				startPos, endPos = string.find(textLower, targetLower, 1, true)
			else
				startPos, endPos = string.find(textLower, targetLower, endPos + 1, true)
			end
		end
	end

	if protectedCount > 0 then
		text = text:gsub("###LANG_P%d+###", function(token)
			return protectedMap[token] or token
		end)
	end

	return text
end

function mainFrame.setMaxLetters()
	if currentLanguage.lang == nil then
		return
	else
		if ACTIVE_CHAT_EDIT_BOX ~= nil then
			local editBox = _G[ACTIVE_CHAT_EDIT_BOX:GetName()]
			local header = _G[ACTIVE_CHAT_EDIT_BOX:GetName().."Header"]
			if C_AddOns.IsAddOnLoaded("EmoteSplitter") == true then
				return
			else
				local maxLetters = 255
				local langName = L[currentLanguage.lang] or currentLanguage.lang
				local subtractLetters = string.len("[" .. langName .. "]" .. " ")

				if mainFrame.prefix ~= true or not ShouldProcessLanguage() then
					subtractLetters = 0
				end

				editBox:SetVisibleTextByteLimit(maxLetters - subtractLetters)
				subtractLetters = 0
			end
		end
	end
end

function mainFrame.enablePrefix()

	-- Hook function that is called when the user SHIFT-Click a player name
	-- in the chat frame to insert it into a text field.
	-- We can replace the name inserted by the complete RP name of the player if we have it.

	local function ParseTokens(editBox, send)
		if lang.combatCheck() then
			return
		else
			-- if not speaking default language, do not apply addon logic
			local _, defaultLangID = GetDefaultLanguage("player")
			if editBox.languageID ~= defaultLangID then
				return
			end

			local text = editBox:GetText();
			if text and send == 1 then
				if text ~= "" and text ~= nil then
					textBeforeParse = text;
					parsedEditBox = editBox;
					if ACTIVE_CHAT_EDIT_BOX == nil then -- required for things like macros, where active edit box is nil
						return
					end
					
					local chatType = _G[ACTIVE_CHAT_EDIT_BOX:GetName()]:GetAttribute("chatType")

					if chatType == "SAY" or chatType == "YELL" then
						text = ApplyDialectToText(text) 
					end
					
					if lang.factionCheck() == true and ShouldProcessLanguage() then
						if mainFrame.prefix == true
							and currentLanguage.lang ~= ""
							and currentLanguage.lang ~= nil
							and (chatType == "SAY" or chatType == "YELL")
						then
							local langName = L[currentLanguage.lang] or currentLanguage.lang
							local prefix = string.format("[%s]", langName)

							if editBox:GetMaxBytes() ~= 1280 then
								if C_AddOns.IsAddOnLoaded("EmoteSplitter") == true then
									gopherPadding = LibGopher.GetPadding()
									LibGopher.SetPadding(prefix)
									text = string.format(" %s", text)
								else
									text = string.format("%s %s", prefix, text)
								end
							else
								text = string.format("%s %s", prefix, text)
								editBox:SetVisibleTextByteLimit(255)
							end
						end
					end

					editBox:SetText(text);
				end
			end
		end
	end;

	for i = 1, Constants.ChatFrameConstants.MaxChatWindows do
		hooksecurefunc(_G["ChatFrame" .. i .. "EditBox"], "ParseText", ParseTokens);
	end

	-- Restore the text without substitution before it's stored in the chat history
	hooksecurefunc(ChatFrameUtil, "SubstituteChatMessageBeforeSend", function()
		if parsedEditBox and textBeforeParse then
			parsedEditBox:SetText(textBeforeParse);
			parsedEditBox = nil;
			textBeforeParse = nil;
		end
	end);
end

mainFrame.enablePrefix()

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ace Addon Minimap Button
---------------------------------------------------------------------------------------------------------------------------------------------------------

local addon = LibStub("AceAddon-3.0"):NewAddon("Languages", "AceConsole-3.0")
local languagesLDB = LibStub("LibDataBroker-1.1"):NewDataObject("Languages", {
	type = "data source",
	text = "Languages",
	icon = "Interface\\AddOns\\Languages\\Languages_Icon_Small.blp",
	OnClick = function()
		if mainFrame:IsShown() then
			mainFrame:Hide();
		else
			mainFrame:Show();
		end
	end,
	OnTooltipShow = function(tt)
		tt:AddLine(L["MinimapTooltip"]);
	end,
})
local icon = LibStub("LibDBIcon-1.0")


function addon:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("Languages_DB", {
		profile = CopyTable(defaultsTableChar);
	});
	icon:Register("Languages", languagesLDB, self.db.profile.minimap);
	--self:RegisterChatCommand("languageshide", "ToggleMinimapButton");
end

function addon:ToggleMinimapButton()
	self.db.profile.minimap.hide = not
	self.db.profile.minimap.hide
	if self.db.profile.minimap.hide then
		icon:Hide("Languages");
	else
		icon:Show("Languages");
	end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Slash commands
---------------------------------------------------------------------------------------------------------------------------------------------------------


mainFrame.commands = {
	["prefix"] = function()
		mainFrame.TogglePrefix();
		if mainFrame.prefix == true then
			Print(L["CurrentlySpeaking"] .. (L[currentLanguage.lang] or currentLanguage.lang))
		else
			Print(L["TogglePrefixOff"])
		end
	end,

	["help"] = function()
		Print(L["HelpCMD"])
	end,

	["open"] = function()
		if mainFrame:IsShown() then
			mainFrame:Hide();
		else
			mainFrame:Show();
		end
	end,

	["minimap"] = function()
		addon:ToggleMinimapButton()
	end,

};


function mainFrame.HandleSlashCommands(str)
	if (#str == 0) then
		mainFrame.commands.help();
		return;
	end

	local args = {};
	for _dummy, arg in ipairs({ string.split(' ', str) }) do
		if (#arg > 0) then
			table.insert(args, arg);
		end
	end

	local path = mainFrame.commands; 

	for id, arg in ipairs(args) do
		if (#arg > 0) then
			local lowerArg = arg:lower();
			
			if (path[lowerArg]) then
				if (type(path[lowerArg]) == "function") then
					path[lowerArg](select(id + 1, unpack(args))); 
					return;                 
				elseif (type(path[lowerArg]) == "table") then
					path = path[lowerArg];
				end
			else
				mainFrame.commands.help();
				return;
			end
		end
	end
end

----------------------------------------
-- Tables
----------------------------------------

--[[ -- this could be used to calculate the atlas coords
local function CalculateSides(number)
	local xN = (1/256)*((34*number)+1)
	local yN = xN + 0.125
	return xN, yN
end
]]

local atlas = {
	--character = {L = 0, R = 0, T = 0, B = 0}, -- L = (1/256)*((34*N1)+1), R = L + 0.125, T = (1/256)*((34*N2)+1), B = T + 0.125;
	["a"] = {L = 2,		R = 66,		T = 2,			B = 66},
	["b"] = {L = 70,	R = 134,	T = 2,			B = 66},
	["c"] = {L = 138,	R = 202,	T = 2,			B = 66},
	["d"] = {L = 206,	R = 270,	T = 2,			B = 66},
	["e"] = {L = 274,	R = 338,	T = 2,			B = 66},
	["f"] = {L = 342,	R = 406,	T = 2,			B = 66},
	["g"] = {L = 410,	R = 474,	T = 2,			B = 66},
	["h"] = {L = 2,		R = 66,		T = 70,			B = 134},
	["i"] = {L = 70,	R = 134,	T = 70,			B = 134},
	["j"] = {L = 138,	R = 202,	T = 70,			B = 134},
	["k"] = {L = 206,	R = 270,	T = 70,			B = 134},
	["l"] = {L = 274,	R = 338,	T = 70,			B = 134},
	["m"] = {L = 342,	R = 406,	T = 70,			B = 134},
	["n"] = {L = 410,	R = 474,	T = 70,			B = 134},
	["o"] = {L = 2,		R = 66,		T = 138,		B = 202},
	["p"] = {L = 70,	R = 134,	T = 138,		B = 202},
	["q"] = {L = 138,	R = 202,	T = 138,		B = 202},
	["r"] = {L = 206,	R = 270,	T = 138,		B = 202},
	["s"] = {L = 274,	R = 338,	T = 138,		B = 202},
	["t"] = {L = 342,	R = 406,	T = 138,		B = 202},
	["u"] = {L = 410,	R = 474,	T = 138,		B = 202},
	["v"] = {L = 2,		R = 66,		T = 206,		B = 270},
	["w"] = {L = 70,	R = 134,	T = 206,		B = 270},
	["x"] = {L = 138,	R = 202,	T = 206,		B = 270},
	["y"] = {L = 206,	R = 270,	T = 206,		B = 270},
	["z"] = {L = 274,	R = 338,	T = 206,		B = 270},

	["A"] = {L = 2,		R = 66,		T = 2,			B = 66},
	["B"] = {L = 70,	R = 134,	T = 2,			B = 66},
	["C"] = {L = 138,	R = 202,	T = 2,			B = 66},
	["D"] = {L = 206,	R = 270,	T = 2,			B = 66},
	["E"] = {L = 274,	R = 338,	T = 2,			B = 66},
	["F"] = {L = 342,	R = 406,	T = 2,			B = 66},
	["G"] = {L = 410,	R = 474,	T = 2,			B = 66},
	["H"] = {L = 2,		R = 66,		T = 70,			B = 134},
	["I"] = {L = 70,	R = 134,	T = 70,			B = 134},
	["J"] = {L = 138,	R = 202,	T = 70,			B = 134},
	["K"] = {L = 206,	R = 270,	T = 70,			B = 134},
	["L"] = {L = 274,	R = 338,	T = 70,			B = 134},	
	["M"] = {L = 342,	R = 406,	T = 70,			B = 134},
	["N"] = {L = 410,	R = 474,	T = 70,			B = 134},
	["O"] = {L = 2,		R = 66,		T = 138,		B = 202},
	["P"] = {L = 70,	R = 134,	T = 138,		B = 202},
	["Q"] = {L = 138,	R = 202,	T = 138,		B = 202},
	["R"] = {L = 206,	R = 270,	T = 138,		B = 202},
	["S"] = {L = 274,	R = 338,	T = 138,		B = 202},
	["T"] = {L = 342,	R = 406,	T = 138,		B = 202},
	["U"] = {L = 410,	R = 474,	T = 138,		B = 202},
	["V"] = {L = 2,		R = 66,		T = 206,		B = 270},
	["W"] = {L = 70,	R = 134,	T = 206,		B = 270},
	["X"] = {L = 138,	R = 202,	T = 206,		B = 270},
	["Y"] = {L = 206,	R = 270,	T = 206,		B = 270},
	["Z"] = {L = 274,	R = 338,	T = 206,		B = 270},

	["'"] = {L = 342,	R = 406,	T = 206,		B = 270}, -- apostrophes
	["-"] = {L = 410,	R = 474,	T = 206,		B = 270}, -- hyphens

};


---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Randomized words available per language
---------------------------------------------------------------------------------------------------------------------------------------------------------



-- Table of characters to keep as they are
local doNotTranslate = { ".", ",", "-", "¤", "0", "1", };

local languageBasicList = {
	"Common",
	"Darnassian",
	"Dwarvish",
	"Gnomish",
	"Draenei",
	"Orcish",
	"Zandali",
	"Taurahe",
	"Forsaken", 
	"Gutterspeak",
	"Thalassian",
	"Goblin",
	"Shalassian",
	"Vulpera",
	"Pandaren",
	"Draconic",
	
	"Demonic",
	"Titan",
	"Kalimag",
	"Shath'Yar",
	"Nerubian",
	"Sprite",
	"Nerglish",
	"Moonkin",
	"Furbolg",
	
	--"Hara'ni",

	"Cypher",
	
	-- [fanmade]
	"Arathi",

	"Broker",
	--"Ethereal",
	--"K'areshi",

	--[NYI]
	--"Mogu",
	--"Ancient Pandaren",
	--"Earthen", -- in DB2, is not used
};

local thingsToHide = {};
local languagelist = {};
local languageNoBrackets = {};

local function RegisterLanguageTag(langKey, localizedName)
	if not localizedName then return end
	
	local safeName = localizedName:gsub("([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
	local bracketPattern = "^%[" .. safeName .. "%]"
	local bracketName = "[" .. localizedName .. "]"

	if not languageNoBrackets[bracketPattern] then
		table.insert(thingsToHide, bracketPattern)
		languagelist[bracketPattern] = bracketName
		languageNoBrackets[bracketPattern] = langKey 
	end
end

if L.AllLanguages then
	for locale, translations in pairs(L.AllLanguages) do
		for _, langKey in ipairs(languageBasicList) do
			local localizedName = translations[langKey] or L[langKey] or langKey
			RegisterLanguageTag(langKey, localizedName)
		end
	end
else
	for _, langKey in ipairs(languageBasicList) do
		local localizedName = L[langKey] or langKey
		RegisterLanguageTag(langKey, localizedName)
	end
end

local understandLanguage = {
};


local LANGPRESET_CLASS_LANGUAGE_DEFAULT = {
	gameplay = {
		[12] = { L["Demonic"] },			-- Demon Hunter
	},
	recommended = {
		[12] = { L["Demonic"] },			-- Demon Hunter
		[5]  = { L["Shath'Yar"] },			-- Priest
		[9]  = { L["Demonic"] },			-- Warlock
		[4]  = { L["Gutterspeak"] },		-- Rogue
		[7]  = { L["Kalimag"] },			-- Shaman
		[8]  = { L["Titan"] },				-- Mage
		[10] = { L["Pandaren"] },			-- Monk
		[13] = { L["Draconic"] },			-- Evoker
	},
};

local LANGPRESET_RACE_LANGUAGE_DEFAULT = {
	gameplay = {
		[1] = {[L["Common"]] = true}, -- 1 human 
		[3] = {[L["Common"]] = true, [L["Dwarvish"]] = true}, -- 3 dwarf
		[4] = {[L["Common"]] = true, [L["Darnassian"]] = true}, -- 4 night elf
		[7] = {[L["Common"]] = true, [L["Gnomish"]] = true}, -- 7 gnome
		[11] = {[L["Common"]] = true, [L["Draenei"]] = true}, -- 11 draenei
		[22] = {[L["Common"]] = true}, -- 22 worgen
		[29] = {[L["Common"]] = true, [L["Thalassian"]] = true}, -- 29 void elf
		[30] = {[L["Common"]] = true, [L["Draenei"]] = true}, -- 30 lightforged
		[34] = {[L["Common"]] = true, [L["Dwarvish"]] = true}, -- 34 dark iron
		[32] = {[L["Common"]] = true}, -- 32 kul tiran
		[37] = {[L["Common"]] = true, [L["Gnomish"]] = true}, -- 37 mechagnome
		[24] = {[L["Pandaren"]] = true}, -- 24 pandaren neutral
		[25] = {[L["Common"]] = true, [L["Pandaren"]] = true}, -- 25 pandaren alliance
		[26] = {[L["Orcish"]] = true, [L["Pandaren"]] = true}, -- 26 pandaren horde
		[2] = {[L["Orcish"]] = true}, -- 2 orc
		[5] = {[L["Orcish"]] = true, [L["Forsaken"]] = true}, -- 5 forsaken
		[6] = {[L["Orcish"]] = true, [L["Taurahe"]] = true}, -- 6 tauren
		[8] = {[L["Orcish"]] = true, [L["Zandali"]] = true}, -- 8 troll
		[10] = {[L["Orcish"]] = true, [L["Thalassian"]] = true}, -- 10 blood elf
		[9] = {[L["Orcish"]] = true, [L["Goblin"]] = true}, -- 9 goblin
		[27] = {[L["Orcish"]] = true, [L["Shalassian"]] = true}, -- 27 nightborne
		[28] = {[L["Orcish"]] = true, [L["Taurahe"]] = true}, -- 28 highmountain
		[36] = {[L["Orcish"]] = true}, -- 36 mag'har
		[31] = {[L["Orcish"]] = true, [L["Zandali"]] = true}, -- 31 zandalari
		[35] = {[L["Orcish"]] = true, [L["Vulpera"]] = true}, -- 35 vulpera
		--dracthyrN = {L["Draconic"]}, -- 
		[52] = {[L["Common"]] = true, [L["Draconic"]] = true}, -- 52 dracthyr alliance
		[70] = {[L["Orcish"]] = true, [L["Draconic"]] = true}, -- 70 dracthyr horde
		[84] = {[L["Common"]] = true, [L["Titan"]] = true}, -- 84 earthen alliance
		[85] = {[L["Orcish"]] = true, [L["Titan"]] = true}, -- 85 earthen horde
	},
	recommended = {
		[1] = {[L["Common"]] = true}, -- 1 human
		[3] = {[L["Common"]] = true, [L["Dwarvish"]] = true, [L["Gnomish"]] = true}, -- 3 dwarf
		[4] = {[L["Common"]] = true, [L["Darnassian"]] = true}, -- 4 night elf
		[7] = {[L["Common"]] = true, [L["Gnomish"]] = true, [L["Dwarvish"]] = true}, -- 7 dwarf
		[11] = {[L["Common"]] = true, [L["Draenei"]] = true, [L["Orcish"]] = true}, -- 11 draenei
		[22] = {[L["Common"]] = true}, -- 22 worgen
		[29] = {[L["Common"]] = true, [L["Thalassian"]] = true}, -- 29 void elf
		[30] = {[L["Common"]] = true, [L["Draenei"]] = true}, -- 30 lightforged
		[34] = {[L["Common"]] = true, [L["Dwarvish"]] = true}, -- 34 dark iron
		[32] = {[L["Common"]] = true}, -- 32 kul tiran 
		[37] = {[L["Common"]] = true, [L["Gnomish"]] = true}, -- 37 mechagnome
		[24] = {[L["Pandaren"]] = true}, -- 24 pandaren neutral
		[25] = {[L["Common"]] = true, [L["Pandaren"]] = true}, -- 25 pandaren alliance
		[26] = {[L["Orcish"]] = true, [L["Pandaren"]] = true}, -- 26 pandaren horde
		[2] = {[L["Orcish"]] = true, [L["Common"]] = true}, -- 2 orc
		[5] = {[L["Orcish"]] = true, [L["Gutterspeak"]] = true, [L["Common"]] = true, [L["Forsaken"]] = true}, -- 5 forsaken
		[6] = {[L["Orcish"]] = true, [L["Taurahe"]] = true}, -- 6 tauren
		[8] = {[L["Orcish"]] = true, [L["Zandali"]] = true}, -- 8 troll
		[10] = {[L["Orcish"]] = true, [L["Thalassian"]] = true, [L["Common"]] = true}, -- 10 blood elf
		[9] = {[L["Orcish"]] = true, [L["Goblin"]] = true, [L["Common"]] = true}, -- 9 goblin
		[27] = {[L["Orcish"]] = true, [L["Shalassian"]] = true}, -- 27 nightborne
		[28] = {[L["Orcish"]] = true, [L["Taurahe"]] = true}, -- 28 highmountain
		[36] = {[L["Orcish"]] = true}, --36 mag'har
		[31] = {[L["Orcish"]] = true, [L["Zandali"]] = true}, -- 31 zandalari
		[35] = {[L["Orcish"]] = true, [L["Vulpera"]] = true}, -- 35 vulpera
		--dracthyrN = {L["Draconic"], L["Common"], L["Orcish"]}, -- 
		[52] = {[L["Common"]] = true, [L["Draconic"]] = true, [L["Orcish"]] = true}, -- 52 dracthyr alliance
		[70] = {[L["Orcish"]] = true, [L["Draconic"]] = true, [L["Common"]] = true}, -- 70 dracthyr horde
		[84] = {[L["Common"]] = true, [L["Dwarvish"]] = true, [L["Titan"]] = true}, -- 84 earthen alliance
		[85] = {[L["Orcish"]] = true, [L["Dwarvish"]] = true, [L["Titan"]] = true}, -- 85 earthen horde
	},
};


----------------------------------------
--
----------------------------------------



function lang.SaveButtonPosition(self)
	local point, _, relativePoint, x, y = self:GetPoint()
	local profile = GetActiveProfile()
	
	if not profile.selectionButton then profile.selectionButton = {} end
	profile.selectionButton.point = point
	profile.selectionButton.relativePoint = relativePoint
	profile.selectionButton.x = x
	profile.selectionButton.y = y
end

function lang.SelectionButtonGenerator(owner, rootDescription)
	local prefixToggleText = mainFrame.prefix and L["DisablePrefix"] or L["EnablePrefix"]
	local prefixToggle = rootDescription:CreateButton(prefixToggleText, function()
		mainFrame.TogglePrefix()

		local factionText
		if UnitFactionGroup("player") == "Alliance" then
			factionText = L["Common"]
		elseif UnitFactionGroup("player") == "Horde" then
			factionText = L["Orcish"]
		elseif UnitFactionGroup("player") == "Neutral" then
			factionText = L["Pandaren"]
		end
		
		if lang.SelectionButton and currentLanguage.lang then
			local langName = L[currentLanguage.lang] or currentLanguage.lang
			lang.SelectionButton.Text:SetText(langName)
		else
			lang.SelectionButton.Text:SetText(factionText)
		end
	end)
	
	rootDescription:CreateDivider()

	rootDescription:CreateTitle(L["SelectLanguage"])

	local function IsSelected(langKey)
		return currentLanguage.lang == langKey
	end

	local function SetSelected(langKey)
		mainFrame.SetLanguage(langKey)
	end

	local profile = GetActiveProfile()

	local availableLanguages = {}
	
	for _, langKey in ipairs(languageBasicList) do
		local isLearned = false
		if profile.understandLanguage then
			isLearned = profile.understandLanguage[langKey]
		end
		
		if isLearned then
			table.insert(availableLanguages, { key = langKey, name = L[langKey] or langKey })
		end
	end

	table.sort(availableLanguages, function(a, b) return a.name < b.name end)

	for _, langData in ipairs(availableLanguages) do
		rootDescription:CreateRadio(langData.name, IsSelected, SetSelected, langData.key)
	end
end

function lang.CreateSelectionButton()
	local f = CreateFrame("Button", "LanguagesSelectionButton", UIParent, "BackdropTemplate")
	f:SetSize(140, 32)
	f:SetMovable(true)
	f:EnableMouse(true)
	
	f:RegisterForClicks("AnyUp")
	f:RegisterForDrag("LeftButton")
	f:SetClampedToScreen(true)
	
	f:SetBackdrop({
		bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
		edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
		tile = true, tileSize = 16, edgeSize = 16,
		insets = { left = 4, right = 4, top = 4, bottom = 4 }
	})
	f:SetBackdropColor(0, 0, 0, 0.8)
	f:SetBackdropBorderColor(0.6, 0.0, 0.0, 1)

	local factionText
	if UnitFactionGroup("player") == "Alliance" then
		factionText = L["Common"]
	elseif UnitFactionGroup("player") == "Horde" then
		factionText = L["Orcish"]
	elseif UnitFactionGroup("player") == "Neutral" then
		factionText = L["Pandaren"]
	end

	f.Text = f:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
	f.Text:SetPoint("CENTER", 0, 0)
	f.Text:SetText(factionText)
	
	f:SetScript("OnDragStart", function(self)
		if IsShiftKeyDown() then
			self:StartMoving()
		end
	end)
	
	f:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		lang.SaveButtonPosition(self)
	end)

	f:SetScript("OnClick", function(self, button)
		if button == "RightButton" then
			if mainFrame:IsShown() then
				mainFrame:Hide()
			else
				mainFrame:Show()
			end
		else
			MenuUtil.CreateContextMenu(self, lang.SelectionButtonGenerator)
		end
	end)
	
	f:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOP")
		GameTooltip:AddLine(L["SelectLanguage"])
		GameTooltip:AddDoubleLine(L["LeftClick"]..":", L["SelectLanguage"], 1, 1, 1, 1, 1, 1)
		GameTooltip:AddDoubleLine(L["RightClick"]..":", L["OpenMenu"], 1, 1, 1, 1, 1, 1)
		GameTooltip:AddDoubleLine(L["ShiftDrag"]..":", L["DragFrame"], 1, 1, 1, 1, 1, 1)
		GameTooltip:Show()
	end)
	
	f:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
	
	f:Hide()
	
	lang.SelectionButton = f
end


---------------------------------------------------------------------------------------------------------------------------------------------------------
-- GUI Buttons
---------------------------------------------------------------------------------------------------------------------------------------------------------

mainFrame.backgroundTex = mainFrame.ScrollFrame:CreateTexture()
mainFrame.backgroundTex:SetAllPoints(mainFrame.ScrollFrame)
mainFrame.backgroundTex:SetAtlas("dragonriding-talents-background")

--some test text
mainFrame.PHText1 = content1:CreateFontString()
mainFrame.PHText1:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.PHText1:SetPoint("CENTER", content1, "CENTER", 0, -500)
mainFrame.PHText1:SetText(L["Diction"])
mainFrame.PHText1:Hide()

mainFrame.PHText2 = content2:CreateFontString()
mainFrame.PHText2:SetFont(STANDARD_TEXT_FONT, 20)
mainFrame.PHText2:SetPoint("TOPLEFT", content2, "TOPLEFT", 55, -25)
mainFrame.PHText2:SetText(L["Settings"])

mainFrame.PHText3 = content3:CreateFontString()
mainFrame.PHText3:SetFont(STANDARD_TEXT_FONT, 20)
mainFrame.PHText3:SetPoint("TOPLEFT", content3, "TOPLEFT", 55, -25)
mainFrame.PHText3:SetText(L["Profiles"])

mainFrame.ButtonTest = CreateFrame("Button", nil, content1, "SharedGoldRedButtonSmallTemplate")
mainFrame.ButtonTest:SetPoint("TOPLEFT", content1, "TOPLEFT", 55,-25)
mainFrame.ButtonTest:SetSize(230,50)
mainFrame.ButtonTest:SetText(L["TogglePrefixOff"])
mainFrame.ButtonTest:SetScript("OnClick", function(self, button)
	mainFrame.TogglePrefix();
	PlaySound(857);
end);


mainFrame.backdropInfo = {
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileEdge = true,
	tileSize = 8,
	edgeSize = 8,
	insets = { left = 1, right = 1, top = 1, bottom = 1 },
};

StaticPopupDialogs["LANGUAGES_ACC_RESET_SETTINGS"] = {
	text = L["ResetAccSettingsConfirm"],
	button1 = YES,
	button2 = NO,
	OnAccept = function()
		Languages_DB.settings = nil;
		Languages_DB.settings = CopyTable(defaultsTableAcc);
		lang.checkSettings();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
};

StaticPopupDialogs["LANGUAGES_CHAR_RESET_SETTINGS"] = {
	text = L["ResetCharSettingsConfirm"],
	button1 = YES,
	button2 = NO,
	OnAccept = function()
		if C_AddOns.IsAddOnLoaded("totalRP3") == true and Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
			Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName] = nil;
			Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName] = CopyTable(defaultsTableChar);
		else
			Languages_DB.profiles[charKey] = nil;
			Languages_DB.profiles[charKey] = CopyTable(defaultsTableChar);
		end
		lang.checkSettings();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
};


local function ApplyLanguagePreset(targetProfile, presetKey)
	local raceID  = GetPlayerRaceID()
	local classID = GetPlayerClassID()

	local raceDefaults  = LANGPRESET_RACE_LANGUAGE_DEFAULT[presetKey]
	local classDefaults = LANGPRESET_CLASS_LANGUAGE_DEFAULT[presetKey]

	targetProfile.understandLanguage = CopyTable((raceDefaults and raceDefaults[raceID]) or {})

	local bonuses = classDefaults and classDefaults[classID]
	if bonuses then
		for _, language in ipairs(bonuses) do
			targetProfile.understandLanguage[language] = true
		end
	end
end

local function GetTRP3Profile()
	if not (Languages_DB.profiles[charKey].TRP3 and TRP3_API) then
		return nil
	end

	local profileName = TRP3_API.profile.getPlayerCurrentProfile().profileName
	return Languages_DB.profiles["TRP3_" .. profileName]
end

local function CreatePresetPopup(presetKey)
	return {
		text = L["ApplyPresetConfirm"],
		button1 = YES,
		button2 = NO,
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,

		OnAccept = function()
			local trp3Profile = GetTRP3Profile()
			if trp3Profile then
				ApplyLanguagePreset(trp3Profile, presetKey)
			end

			ApplyLanguagePreset(Languages_DB.profiles[charKey], presetKey)
			lang.checkSettings()
		end,
	}
end

StaticPopupDialogs["LANGUAGES_CHAR_PRESET_RECOMMENDED"] = CreatePresetPopup("recommended")

StaticPopupDialogs["LANGUAGES_CHAR_PRESET_GAMEPLAY"] = CreatePresetPopup("gameplay")



mainFrame.LangList_Frame = CreateFrame("Frame", nil, content1, "BackdropTemplate")
mainFrame.LangList_Frame:SetPoint("TOPLEFT", content1, "TOPLEFT", 0, -115)
mainFrame.LangList_Frame:SetPoint("TOPRIGHT", content1, "TOPRIGHT", -25, -115)
mainFrame.LangList_Frame:SetHeight(367)
mainFrame.LangList_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.LangList_Frame:SetBackdropColor(0,0,0,.5)

mainFrame.DialectList_Frame = CreateFrame("Frame", nil, contentDialect, "BackdropTemplate")
mainFrame.DialectList_Frame:SetPoint("TOP", contentDialect, "BOTTOM", 0, -20) 
mainFrame.DialectList_Frame:SetSize(300, 45)
mainFrame.DialectList_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.DialectList_Frame:SetBackdropColor(0,0,0,.5)

mainFrame.DialectList_Backdrop = CreateFrame("Frame", nil, contentDialect, "BackdropTemplate")
mainFrame.DialectList_Backdrop:SetPoint("TOPLEFT", contentDialect, "TOPLEFT", 0, -82.5)
mainFrame.DialectList_Backdrop:SetPoint("TOPRIGHT", contentDialect, "TOPRIGHT", -25, -82.5)
mainFrame.DialectList_Backdrop:SetHeight(400)
mainFrame.DialectList_Backdrop:SetBackdrop(mainFrame.backdropInfo)
mainFrame.DialectList_Backdrop:SetBackdropColor(0,0,0,.5)

local LangSearchBox = CreateFrame("EditBox", nil, mainFrame.LangList_Frame, "SearchBoxTemplate")
LangSearchBox:SetPoint("BOTTOMLEFT", mainFrame.LangList_Frame, "TOPLEFT", 10, 5)
LangSearchBox:SetPoint("BOTTOMRIGHT", mainFrame.LangList_Frame, "TOPRIGHT", -25, 5)
LangSearchBox:SetHeight(20)
LangSearchBox:SetAutoFocus(false)

local function CleanSearchString(str)
	if not str then return "" end
	str = str:lower()
	str = str:gsub("[_%s]+", " ")
	str = str:match("^%s*(.-)%s*$")
	return str
end

local function LangSearchBox_OnUpdate(self, elapsed)
	self.t = self.t + elapsed
	if self.t >= 0.2 then
		self.t = 0
		self:SetScript("OnUpdate", nil)
		mainFrame.RefreshLanguageList()
	end
end

local function LangSearchBox_OnTextChanged(self)
	self.t = 0
	self:SetScript("OnUpdate", LangSearchBox_OnUpdate)
end

LangSearchBox:HookScript("OnTextChanged", LangSearchBox_OnTextChanged)

local LangScrollBox = CreateFrame("Frame", nil, mainFrame.LangList_Frame, "WowScrollBoxList")
LangScrollBox:SetPoint("TOPLEFT", 5, -5)
LangScrollBox:SetPoint("BOTTOMRIGHT", -25, 5)

local LangScrollBar = CreateFrame("EventFrame", nil, mainFrame.LangList_Frame, "MinimalScrollBar")
LangScrollBar:SetPoint("TOPLEFT", LangScrollBox, "TOPRIGHT", 5, 0)
LangScrollBar:SetPoint("BOTTOMLEFT", LangScrollBox, "BOTTOMRIGHT", 5, 0)

local LangScrollView = CreateScrollBoxListLinearView()
ScrollUtil.InitScrollBoxListWithScrollBar(LangScrollBox, LangScrollBar, LangScrollView)

local function UpdateLanguageHighlights()
	LangScrollBox:ForEachFrame(function(button)
		local data = button:GetElementData()
		if data and button.selectedTex then
			button.selectedTex:SetShown(currentLanguage.lang == data.key)
		end
	end)
end

function mainFrame.SetLanguage(langKey)
	if langKey then
		local displayName = L[langKey] or langKey
		
		currentLanguage.lang = langKey
		preserveLanguage.lang = langKey
		
		Print(L["SettingLanguageTo"] .. " " .. displayName)

		if lang.SelectionButton then
			lang.SelectionButton.Text:SetText(displayName)
		end
		
		mainFrame.prefix = false 
		mainFrame.TogglePrefix()
		
		PlaySound(857)
		
		if mainFrame:IsShown() then
			UpdateLanguageHighlights()
		end
	end
end

local function LanguageRowInitializer(button, data)
	if not button.bg then
		button.bg = button:CreateTexture(nil, "BACKGROUND")
		button.bg:SetAllPoints()
		button.bg:SetAtlas("ClickCastList-ButtonBackground")
		button.bg:SetAlpha(0.5)
	end

	if not button.highlight then
		button.highlight = button:CreateTexture(nil, "HIGHLIGHT")
		button.highlight:SetAllPoints()
		button.highlight:SetAtlas("ClickCastList-ButtonHighlight")
		button.highlight:SetVertexColor(0.42, 0.54, 1.00, 0.5)
		button.highlight:SetBlendMode("ADD")
	end

	if not button.selectedTex then
		button.selectedTex = button:CreateTexture(nil, "ARTWORK")
		button.selectedTex:SetAllPoints()
		button.selectedTex:SetAtlas("ReportList-ButtonSelect")
		button.selectedTex:SetAlpha(0.6)
	end
	button.selectedTex:SetShown(currentLanguage.lang == data.key)

	if not button.text then
		button.text = button:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
		button.text:SetPoint("LEFT", 30, 0)
		button.text:SetPoint("RIGHT", -50, 0)
		button.text:SetJustifyH("LEFT")
	end
	button.text:SetText(data.name)

	if not button.favoriteButton then
		button.favoriteButton = CreateFrame("Button", nil, button)
		button.favoriteButton:SetSize(20, 20)
		button.favoriteButton:SetPoint("LEFT", button, "LEFT", 5, 0)
		
		button.favoriteButton.icon = button.favoriteButton:CreateTexture(nil, "ARTWORK")
		button.favoriteButton.icon:SetAllPoints()
		
		button.favoriteButton:SetScript("OnClick", function(self)
			local langKey = button:GetElementData().key
			local profile = GetActiveProfile()
			
			if not profile.favoriteLanguages then
				profile.favoriteLanguages = {}
			end
			
			profile.favoriteLanguages[langKey] = not profile.favoriteLanguages[langKey]
			
			if profile.favoriteLanguages[langKey] then
				PlaySound(SOUNDKIT.UI_70_ARTIFACT_FORGE_APPEARANCE_APPEARANCE_CHANGE, "SFX");
			else
				PlaySound(SOUNDKIT.UI_70_ARTIFACT_FORGE_APPEARANCE_LOCKED, "SFX");
			end
			
			mainFrame.RefreshLanguageList()
		end)
	end

	if data.isFavorite then
		button.favoriteButton.icon:SetAtlas("auctionhouse-icon-favorite")
	else
		button.favoriteButton.icon:SetAtlas("auctionhouse-icon-favorite-off")
	end

	if not button.runeIcon then
		button.runeIcon = button:CreateTexture(nil, "OVERLAY")
		button.runeIcon:SetSize(18, 18)
		button.runeIcon:SetPoint("RIGHT", button.text, "RIGHT", 15, 0)
		button.runeIcon:SetAtlas("Rune-01-light")
		
		button.runeFrame = CreateFrame("Frame", nil, button)
		button.runeFrame:SetAllPoints(button.runeIcon)

		button.runeIcon:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOP")
			GameTooltip:AddLine(L["ThisLangHasRunesTT"], 1, 1, 1, true)
			GameTooltip:Show()
		end)
		button.runeIcon:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
	end
	button.runeIcon:SetShown(data.hasRunes)
	button.runeFrame:SetShown(data.hasRunes)

	if not button.checkbox then
		button.checkbox = CreateFrame("CheckButton", nil, button, "UICheckButtonTemplate")
		button.checkbox:SetSize(24, 24)
		button.checkbox:SetPoint("RIGHT", button, "RIGHT", -10, 0)
		
		button.checkbox:SetScript("OnClick", function(self)
			local isChecked = self:GetChecked()
			local langKey = button:GetElementData().key
			
			understandLanguage[langKey] = isChecked
			
			if isChecked then
				Print(L["EnableUnderstand"] .. " " .. (L[langKey] or langKey))
				PlaySound(856)
			else
				Print(L["DisableUnderstand"] .. " " .. (L[langKey] or langKey))
				PlaySound(857)
			end

			GetActiveProfile().understandLanguage[langKey] = isChecked
			
			lang.checkSettings()
		end)

		button.checkbox:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOP")
			GameTooltip:AddLine(L["ToggleLanguageLearnedTT"], 1, 1, 1, true)
			GameTooltip:Show()
		end)
		button.checkbox:SetScript("OnLeave", function()
			GameTooltip:Hide()
		end)
	end
	
	button.checkbox:SetChecked(data.isLearned)

	button:SetScript("OnClick", function(self)
		currentLanguage.lang = data.key
		preserveLanguage.lang = data.key
		mainFrame.SetLanguage(currentLanguage.lang)
		
		mainFrame.prefix = false
		mainFrame.TogglePrefix()
		PlaySound(857)
		
		UpdateLanguageHighlights()
	end)

	button:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_TOP")
		GameTooltip:AddLine(L["ToggleLanguageSpokenTT"], 1, 1, 1, true)
		GameTooltip:Show()
	end)
	button:SetScript("OnLeave", function()
		GameTooltip:Hide()
	end)
end

LangScrollView:SetElementInitializer("Button", LanguageRowInitializer)
LangScrollView:SetElementExtent(30)
LangScrollView:SetPadding(5, 5, 5, 5, 2)

function mainFrame.RefreshLanguageList()
	local dataProvider = CreateDataProvider()
	local profile = GetActiveProfile()
	
	if not profile.favoriteLanguages then
		profile.favoriteLanguages = {}
	end
	
	local favorites = {}
	local nonFavorites = {}

	local searchText = CleanSearchString(LangSearchBox:GetText())
	
	for _, langKey in ipairs(languageBasicList) do
		local name = L[langKey] or langKey

		if searchText == "" or string.find(string.lower(name), searchText, 1, true) then

			local isLearned = false
			if profile.understandLanguage then
				isLearned = profile.understandLanguage[langKey]
			end
	
			local hasRunes = false
			if LANGUAGE_REPLACEMENTS[langKey] and LANGUAGE_REPLACEMENTS[langKey]["hasRunes"] then
				hasRunes = true
			end
			
			local isFavorite = profile.favoriteLanguages[langKey] or false
	
			local langData = {
				key = langKey,
				name = name,
				hasRunes = hasRunes,
				isLearned = isLearned,
				isFavorite = isFavorite
			}
			
			if isFavorite then
				table.insert(favorites, langData)
			else
				table.insert(nonFavorites, langData)
			end
		end
	end
	
	table.sort(favorites, function(a, b) return a.name < b.name end)
	table.sort(nonFavorites, function(a, b) return a.name < b.name end)
	
	for _, langData in ipairs(favorites) do
		dataProvider:Insert(langData)
	end
	
	for _, langData in ipairs(nonFavorites) do
		dataProvider:Insert(langData)
	end
	
	LangScrollView:SetDataProvider(dataProvider)
	UpdateLanguageHighlights()
end


mainFrame.Acc_Frame = CreateFrame("Frame", nil, content2, "BackdropTemplate")
mainFrame.Acc_Frame:SetPoint("TOP", content2, "TOP", 0, -75)
mainFrame.Acc_Frame:SetSize(300,220)
mainFrame.Acc_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.Acc_Frame:SetBackdropColor(0,0,0,.5)

mainFrame.header1 = content2:CreateFontString()
mainFrame.header1:SetFont(STANDARD_TEXT_FONT, 15)
mainFrame.header1:SetPoint("BOTTOMLEFT", mainFrame.Acc_Frame, "TOPLEFT", 0, 0)
mainFrame.header1:SetText(L["AccountSettings"])

mainFrame.resetAccSettings = CreateFrame("Button", nil, mainFrame.Acc_Frame, "SharedButtonSmallTemplate")
mainFrame.resetAccSettings:SetPoint("BOTTOMRIGHT", mainFrame.Acc_Frame, "TOPRIGHT", -15, 5)
mainFrame.resetAccSettings:SetSize(110,25)
mainFrame.resetAccSettings:SetText(DEFAULTS)
mainFrame.resetAccSettings:SetScript("OnClick", function(self, button)
	StaticPopup_Show("LANGUAGES_ACC_RESET_SETTINGS");
end);
mainFrame.resetAccSettings:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["ResetAccSettings"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.resetAccSettings:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);


mainFrame.Char_Frame = CreateFrame("Frame", nil, mainFrame.Acc_Frame, "BackdropTemplate")
mainFrame.Char_Frame:SetPoint("TOP", mainFrame.Acc_Frame, "BOTTOM", 0, -55)
mainFrame.Char_Frame:SetSize(300,140)
mainFrame.Char_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.Char_Frame:SetBackdropColor(0,0,0,.5)

mainFrame.header2 = content2:CreateFontString()
mainFrame.header2:SetFont(STANDARD_TEXT_FONT, 15)
mainFrame.header2:SetPoint("BOTTOMLEFT", mainFrame.Char_Frame, "TOPLEFT", 0, 0)
mainFrame.header2:SetText(L["CharacterSettings"])

mainFrame.resetCharSettings = CreateFrame("Button", nil, mainFrame.Char_Frame, "SharedButtonSmallTemplate")
mainFrame.resetCharSettings:SetPoint("BOTTOMRIGHT", mainFrame.Char_Frame, "TOPRIGHT", -15, 5)
mainFrame.resetCharSettings:SetSize(110,25)
mainFrame.resetCharSettings:SetText(DEFAULTS)
mainFrame.resetCharSettings:SetScript("OnClick", function(self, button)
	StaticPopup_Show("LANGUAGES_CHAR_RESET_SETTINGS");
end);
mainFrame.resetCharSettings:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["ResetCharSettings"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.resetCharSettings:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

mainFrame.glyphsCB = CreateFrame("CheckButton", nil, mainFrame.Acc_Frame, "UICheckButtonTemplate");
mainFrame.glyphsCB:SetPoint("TOPRIGHT", mainFrame.Acc_Frame, "TOPRIGHT", -15, -15);
mainFrame.glyphsCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Languages_DB.settings.glyphs = true;
		PlaySound(856);
	else
		Languages_DB.settings.glyphs = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.glyphsCB.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.glyphsCB.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.glyphsCB.text:SetPoint("RIGHT", mainFrame.glyphsCB, "LEFT", -5, 0)
mainFrame.glyphsCB.text:SetText(L["UseGlyphs"])
mainFrame.glyphsCB:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["UseGlyphs"]);
	GameTooltip:AddLine(L["UseGlyphsTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.glyphsCB:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

mainFrame.prefixColorPickerButton = CreateFrame("Button", nil, mainFrame.glyphsCB, "SharedButtonSmallTemplate")
mainFrame.prefixColorPickerButton:SetPoint("TOPRIGHT", mainFrame.glyphsCB, "TOPRIGHT", 0, -60)
mainFrame.prefixColorPickerButton:SetSize(110,25)
mainFrame.prefixColorPickerButton:SetText(COLOR_PICKER)
mainFrame.prefixColorPickerButton.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.prefixColorPickerButton.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.prefixColorPickerButton.text:SetPoint("RIGHT", mainFrame.prefixColorPickerButton, "LEFT", -5, 0)
mainFrame.prefixColorPickerButton.text:SetText(L["AddonPrefixColor"])
mainFrame.prefixColorPickerButton:SetScript("OnClick", function(self, button)
	mainFrame:ShowColorPickerText(Languages_DB.settings.colors.prefix.r, Languages_DB.settings.colors.prefix.g, Languages_DB.settings.colors.prefix.b, mainFrame.PrefixColor);
end);

mainFrame.speechbubCB = CreateFrame("CheckButton", nil, mainFrame.prefixColorPickerButton, "UICheckButtonTemplate");
mainFrame.speechbubCB:SetPoint("TOPRIGHT", mainFrame.prefixColorPickerButton, "TOPRIGHT", 0, -30);
mainFrame.speechbubCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Languages_DB.settings.speechBubbles = true;
		PlaySound(856);
	else
		Languages_DB.settings.speechBubbles = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.speechbubCB.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.speechbubCB.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.speechbubCB.text:SetPoint("RIGHT", mainFrame.speechbubCB, "LEFT", -5, 0)
mainFrame.speechbubCB.text:SetText(L["SpeechBubbles"])
mainFrame.speechbubCB:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["SpeechBubbles"]);
	GameTooltip:AddLine(L["SpeechBubblesTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.speechbubCB:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

mainFrame.combatCB = CreateFrame("CheckButton", nil, mainFrame.speechbubCB, "UICheckButtonTemplate");
mainFrame.combatCB:SetPoint("TOPRIGHT", mainFrame.speechbubCB, "TOPRIGHT", 0, -30);
mainFrame.combatCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Languages_DB.settings.combat = true;
		PlaySound(856);
	else
		Languages_DB.settings.combat = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.combatCB.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.combatCB.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.combatCB.text:SetPoint("RIGHT", mainFrame.combatCB, "LEFT", -5, 0)
mainFrame.combatCB.text:SetText(L["CombatOption"])
mainFrame.combatCB:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["CombatOption"]);
	GameTooltip:AddLine(L["CombatOptionTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.combatCB:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

mainFrame.factionLangCB = CreateFrame("CheckButton", nil, mainFrame.combatCB, "UICheckButtonTemplate");
mainFrame.factionLangCB:SetPoint("TOPRIGHT", mainFrame.combatCB, "TOPRIGHT", 0, -30);
mainFrame.factionLangCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Languages_DB.settings.faction = true;
		PlaySound(856);
	else
		Languages_DB.settings.faction = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.factionLangCB.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.factionLangCB.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.factionLangCB.text:SetPoint("RIGHT", mainFrame.factionLangCB, "LEFT", -5, 0)
mainFrame.factionLangCB.text:SetText(L["FactionOption"])
mainFrame.factionLangCB:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["FactionOption"]);
	GameTooltip:AddLine(L["FactionOptionTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.factionLangCB:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

mainFrame.runeScaleSlider = CreateFrame("Frame", nil, mainFrame.Acc_Frame, "MinimalSliderWithSteppersTemplate")
mainFrame.runeScaleSlider:SetPoint("TOPRIGHT", mainFrame.Acc_Frame, "TOPRIGHT", -40, -40)
mainFrame.runeScaleSlider:SetWidth(160)

mainFrame.runeScaleSlider.Title = mainFrame.runeScaleSlider:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
mainFrame.runeScaleSlider.Title:SetPoint("RIGHT", mainFrame.runeScaleSlider, "LEFT", 0, 0)
mainFrame.runeScaleSlider.Title:SetText(L["RuneSize"])

local sliderOptions = Settings.CreateSliderOptions(0.1, 1.5, 0.05)
sliderOptions:SetLabelFormatter(MinimalSliderWithSteppersMixin.Label.Right, function(value) 
	return string.format("%d%%", value * 100);
end)

mainFrame.runeScaleSlider:Init(1.0, sliderOptions.minValue, sliderOptions.maxValue, sliderOptions.steps, sliderOptions.formatters)

mainFrame.runeScaleSlider:RegisterCallback("OnValueChanged", function(self, value)
	Languages_DB.settings.runeScale = value
end)

mainFrame.trp3ProfileCB = CreateFrame("CheckButton", nil, mainFrame.Char_Frame, "UICheckButtonTemplate");
mainFrame.trp3ProfileCB:SetPoint("TOPRIGHT", mainFrame.Char_Frame, "TOPRIGHT", -15, -15);
mainFrame.trp3ProfileCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		if C_AddOns.IsAddOnLoaded("totalRP3") and TRP3_API then
			Print(L["LoadingProfile"] .. ": " .. "TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName);
		else
			Print(L["LoadingProfile"] .. ": " .. charKey);
		end
		Languages_DB.profiles[charKey].TRP3 = true;
		PlaySound(856);
	else
		Print(L["LoadingProfile"] .. ": " .. charKey);
		Languages_DB.profiles[charKey].TRP3 = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.trp3ProfileCB:Disable();
mainFrame.trp3ProfileCB.text = mainFrame.Char_Frame:CreateFontString()
mainFrame.trp3ProfileCB.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.trp3ProfileCB.text:SetPoint("RIGHT", mainFrame.trp3ProfileCB, "LEFT", -5, 0)
mainFrame.trp3ProfileCB.text:SetText(L["LinkToTotalRP3"])
mainFrame.trp3ProfileCB.text:SetTextColor(.5,.5,.5)
mainFrame.trp3ProfileCB:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["LinkToTotalRP3"]);
	GameTooltip:AddLine(L["LinkToTotalRP3TT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.trp3ProfileCB:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);


mainFrame.shapeshiftFormsCB = CreateFrame("CheckButton", nil, mainFrame.trp3ProfileCB, "UICheckButtonTemplate");
mainFrame.shapeshiftFormsCB:SetPoint("TOPRIGHT", mainFrame.trp3ProfileCB, "TOPRIGHT", 0, -30);
mainFrame.shapeshiftFormsCB:SetScript("OnClick", function(self)
	local isChecked = self:GetChecked()
	GetActiveProfile().shapeshift = isChecked

	if isChecked then PlaySound(856) else PlaySound(857) end
	lang.checkSettings()
end)
mainFrame.shapeshiftFormsCB.text = mainFrame.Char_Frame:CreateFontString()
mainFrame.shapeshiftFormsCB.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.shapeshiftFormsCB.text:SetPoint("RIGHT", mainFrame.shapeshiftFormsCB, "LEFT", -5, 0)
mainFrame.shapeshiftFormsCB.text:SetText(L["UseAutoShapeshift"])
mainFrame.shapeshiftFormsCB:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["UseAutoShapeshift"]);
	GameTooltip:AddLine(L["UseAutoShapeshiftTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.shapeshiftFormsCB:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

mainFrame.onlyInCharacterCB = CreateFrame("CheckButton", nil, mainFrame.shapeshiftFormsCB, "UICheckButtonTemplate");
mainFrame.onlyInCharacterCB:SetPoint("TOPRIGHT", mainFrame.shapeshiftFormsCB, "TOPRIGHT", 0, -30);
mainFrame.onlyInCharacterCB:SetScript("OnClick", function(self)
	local isChecked = self:GetChecked()
	GetActiveProfile().onlyInCharacter = isChecked

	if isChecked then PlaySound(856) else PlaySound(857) end
	lang.checkSettings()
end)

mainFrame.onlyInCharacterCB.text = mainFrame.Char_Frame:CreateFontString()
mainFrame.onlyInCharacterCB.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.onlyInCharacterCB.text:SetPoint("RIGHT", mainFrame.onlyInCharacterCB, "LEFT", -5, 0)
mainFrame.onlyInCharacterCB.text:SetText(L["OnlyInCharacter"])
mainFrame.onlyInCharacterCB:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["OnlyInCharacter"]);
	GameTooltip:AddLine(L["OnlyInCharacterTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.onlyInCharacterCB:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

mainFrame.selectionButtonCB = CreateFrame("CheckButton", nil, mainFrame.onlyInCharacterCB, "UICheckButtonTemplate");
mainFrame.selectionButtonCB:SetPoint("TOPRIGHT", mainFrame.onlyInCharacterCB, "TOPRIGHT", 0, -30);
mainFrame.selectionButtonCB:SetScript("OnClick", function(self)
	local isChecked = self:GetChecked()
	
	local profile = GetActiveProfile()
	
	if not profile.selectionButton then profile.selectionButton = {} end
	profile.selectionButton.shown = isChecked
	
	if isChecked then
		PlaySound(856);
	else
		PlaySound(857);
	end
	lang.checkSettings();
end);

mainFrame.selectionButtonCB.text = mainFrame.Char_Frame:CreateFontString()
mainFrame.selectionButtonCB.text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.selectionButtonCB.text:SetPoint("RIGHT", mainFrame.selectionButtonCB, "LEFT", -5, 0)
mainFrame.selectionButtonCB.text:SetText(L["ShowSelectionButton"])
mainFrame.selectionButtonCB:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["ShowSelectionButton"]);
	GameTooltip:AddLine(L["ShowSelectionButtonTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.selectionButtonCB:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

----------------------------------------
-- content 3 - Profiles
----------------------------------------

mainFrame.preset_recommended = CreateFrame("Button", nil, content3, "SharedButtonSmallTemplate")
mainFrame.preset_recommended:SetPoint("TOP", content3, "TOP", 0, -150)
mainFrame.preset_recommended:SetSize(110,25)
mainFrame.preset_recommended:SetText(L["ImportRecommended"])
mainFrame.preset_recommended:SetScript("OnClick", function(self, button)
	StaticPopup_Show("LANGUAGES_CHAR_PRESET_RECOMMENDED");
end);
mainFrame.preset_recommended:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["ImportRecommended"]);
	GameTooltip:AddLine(L["ImportRecommendedTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.preset_recommended:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);

mainFrame.preset_gameplay = CreateFrame("Button", nil, content3, "SharedButtonSmallTemplate")
mainFrame.preset_gameplay:SetPoint("TOPRIGHT", mainFrame.preset_recommended, "TOPRIGHT", 0, -30)
mainFrame.preset_gameplay:SetSize(110,25)
mainFrame.preset_gameplay:SetText(L["ImportGameplay"])
mainFrame.preset_gameplay:SetScript("OnClick", function(self, button)
	StaticPopup_Show("LANGUAGES_CHAR_PRESET_GAMEPLAY");
end);
mainFrame.preset_gameplay:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["ImportGameplay"]);
	GameTooltip:AddLine(L["ImportGameplayTT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.preset_gameplay:SetScript("OnLeave", function()
	GameTooltip:Hide();
end);


----------------------------------------
--
----------------------------------------

mainFrame.Dialect = mainFrame.DialectList_Frame:CreateFontString()
mainFrame.Dialect:SetFont(STANDARD_TEXT_FONT, 15)
mainFrame.Dialect:SetPoint("TOPLEFT", mainFrame.DialectList_Frame, "TOPLEFT", 10, -10)
mainFrame.Dialect:SetText(L["Dialect"])

mainFrame.DialectDropdown = CreateFrame("DropdownButton", nil, mainFrame.DialectList_Frame, "WowStyle1DropdownTemplate")
mainFrame.DialectDropdown:SetPoint("TOP", mainFrame.DialectList_Frame, "TOP", 10, -5)
mainFrame.DialectDropdown:SetWidth(150)
mainFrame.DialectDropdown:SetDefaultText(L["Dialect"])

mainFrame.DialectDropdown:HookScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_TOP");
	GameTooltip:AddLine(L["Dialects"]);
	GameTooltip:AddLine(L["DialectsTT"], 1, 1, 1, true);
	GameTooltip:AddLine(" ", 1, 1, 1, true);
	GameTooltip:AddLine(L["Dialects2TT"], 1, 1, 1, true);
	GameTooltip:Show();
end);
mainFrame.DialectDropdown:HookScript("OnLeave", function()
	GameTooltip:Hide();
end);

local function IsDialectSelected(dialectName)
	local profile = GetActiveProfile()
	if profile then
		return profile.dialect == dialectName
	end
end

local function SetDialect(dialectName)
	local profile = GetActiveProfile()
	profile.dialect = dialectName
	mainFrame.DialectDropdown:GenerateMenu() 
	
	if mainFrame.RefreshDialectWordList then
		mainFrame.RefreshDialectWordList()
	end
end

local function DialectMenuGenerator(owner, rootDescription)
	rootDescription:CreateRadio(NONE, IsDialectSelected, SetDialect, nil)
	
	local sortedDialects = {}
	if Dialects then
		for name, _ in pairs(Dialects) do
			table.insert(sortedDialects, name)
		end
		table.sort(sortedDialects)
	end

	for _, dialectName in ipairs(sortedDialects) do
		rootDescription:CreateRadio(dialectName, IsDialectSelected, SetDialect, dialectName)
	end
end

mainFrame.DialectDropdown:SetupMenu(DialectMenuGenerator)



---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Language Functionality
---------------------------------------------------------------------------------------------------------------------------------------------------------


local function TranslateWord(word, language)

	return translatedWord
end

-- Function to translate a full sentence
local function TranslateText(text, language)
	text = text:lower()

	-- Replace words and word sequences from dictionary
	local dictionarySequences = {}
	for word, translatedWord in Dictionaries[language] do
		text = text:gsub(word, "¤");
		tinsert(dictionarySequences, translatedWord);
	end

	local sequenceIndex = 1
	local translatedText = ""
	local currentWord = ""
	-- Go over every character (Unicode compliant)
	for character in string.gmatch(text, "([%z\1-\127\194-\244][\128-\191]*)") do
		-- Character shouldn't be translated
		if tContains(doNotTranslate, character) then
			-- Translate and add the word that just finished
			translatedText = translatedText .. TranslateWord(currentWord, language);
			if character == "¤" then
				-- If special character, replace by the appropriate translated sequence
				translatedText = translatedText .. dictionarySequences[sequenceIndex];
				sequenceIndex = sequenceIndex + 1;
			else
				-- Not special character, just add it as is
				translatedText = translatedText .. character;
			end
			-- Reset current word since we translated and added it
			currentWord = "";
		else
			-- Regular character, just add to the current word
			currentWord = currentWord .. character;
		end
	end
	-- Add the last word if the sentence doesn't end with punctuation
	translatedText = translatedText .. TranslateWord(currentWord, language);

	return translatedText
end

---------------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------------------

local AddonPath = "Interface\\AddOns\\Languages\\Textures\\"
local spacePath = "Interface\\AddOns\\Languages\\Textures\\All\\space.blp"

MatchCasing = function(original, translated)
	if string.find(original, "%u") and not string.find(original, "%l") then
		return string.upper(translated)
	end
	
	if not string.find(original, "%u") then
		return string.lower(translated)
	end

	local casingMap = {}
	for char in string.gmatch(original, "[%a]") do
		table.insert(casingMap, string.match(char, "%u") ~= nil)
	end
	
	if #casingMap == 0 then
		return translated
	end

	local result = ""
	local lenTrans = string.len(translated)
	
	for i = 1, lenTrans do
		local charTrans = string.sub(translated, i, i)
		
		local useUpperCase = casingMap[math.min(i, #casingMap)]
		
		if useUpperCase then
			result = result .. string.upper(charTrans)
		else
			result = result .. string.lower(charTrans)
		end
	end
	
	return result
end

local function GetRuneString(text, language)
	local langData = LANGUAGE_REPLACEMENTS[language]
	if not langData or not langData.hasRunes or not Languages_DB.settings.glyphs then
		return text
	end

	local langDisplay = L[language] or language
	local kerningTable = AlphabetKerning and AlphabetKerning[langDisplay]

	local runeString = ""
	local scale = Languages_DB.settings.runeScale or 1.0
	local fontSize = select(2, ChatFrame1:GetFont()) * scale 
	local atlasPath = AddonPath .. language .. "\\"

	local lowerCaseScale = 1 -- .75 would be a nice lowercase height if offset didn't lag
	
	for character in string.gmatch(text, "([%z\1-\127\194-\244][\128-\191]*)") do
		if character == " " then
			local spaceWidth = fontSize
			local spaceHeight = fontSize

			if kerningTable and kerningTable[" "] then
				if kerningTable[" "].width then
					spaceWidth = fontSize * kerningTable[" "].width
				end
				if kerningTable[" "].height then
					spaceHeight = fontSize * kerningTable[" "].height
				end
			end

			local tex = "|T" .. spacePath .. ":" .. spaceHeight .. ":" .. spaceWidth .. "|t"
			runeString = runeString .. tex

		elseif character == "\t" or character == "\n" or character == "\r" then
			runeString = runeString .. character
		else
			local width = fontSize
			local height = fontSize
			local yOffset = 0
			
			local isLowercase = (character == string.lower(character) and character ~= string.upper(character))
			local usingFallback = false

			if kerningTable then
				local kerningData = kerningTable[character]
				
				if not kerningData then
					kerningData = kerningTable[string.upper(character)]
					if kerningData then
						usingFallback = true
					end
				end

				if kerningData then
					if kerningData.width then
						width = fontSize * kerningData.width
					end
					if kerningData.height then
						height = fontSize * kerningData.height
					end
				end
			end

			-- this would have been to make lowercase + move the letters down
			--[[
			if isLowercase and usingFallback then
				local originalHeight = height
				
				width = width * lowerCaseScale
				height = height * lowerCaseScale
				
				yOffset = -(originalHeight - height) / 2
			end
			]]

			--local tex = "|T" .. atlasPath .. character .. ":" .. height .. ":" .. width .. ":0:" .. yOffset .. "|t"
			local tex = "|T" .. atlasPath .. character .. ":" .. height .. ":" .. width .. "|t" -- can't use offset, lags badly :(
			runeString = runeString .. tex
		end
	end
	
	return runeString
end

local reverseDictionaries = {}

local function GetReverseDictionary(language)
	if reverseDictionaries[language] then return reverseDictionaries[language] end
	
	local rev = {}
	if Dictionaries[language] then
		for _, translation in pairs(Dictionaries[language]) do
			for word in string.gmatch(translation, "[%a']+") do
				rev[string.lower(word)] = true
			end
		end
	end
	reverseDictionaries[language] = rev
	return rev
end

local function ReplaceLanguage(text, language)
	if not text or text == "" then return "" end
	
	local protectedPhrases = {}
	local pIndex = 0

	if Dictionaries[language] then
		local keys = {}
		for k in pairs(Dictionaries[language]) do
			table.insert(keys, k)
		end
		table.sort(keys, function(a, b) return #a > #b end)

		local textLower = string.lower(text)
		
		for _, phrase in ipairs(keys) do
			local startPos, endPos = string.find(textLower, phrase, 1, true)
			
			while startPos do
				pIndex = pIndex + 1
				local token = "###" .. pIndex .. "###"
				
				local originalSegment = string.sub(text, startPos, endPos)
				local translation = Dictionaries[language][phrase]
				
				local casedTranslation
				if string.find(originalSegment, " ") then
					if string.match(string.sub(originalSegment, 1, 1), "%u") then
						casedTranslation = translation:gsub("^%l", string.upper)
					else
						casedTranslation = translation
					end
					if string.upper(originalSegment) == originalSegment then
						casedTranslation = string.upper(translation)
					end
				else
					casedTranslation = MatchCasing(originalSegment, translation)
				end

				protectedPhrases[token] = GetRuneString(casedTranslation, language)
				
				text = string.sub(text, 1, startPos - 1) .. token .. string.sub(text, endPos + 1)
				textLower = string.lower(text) 
				
				startPos, endPos = string.find(textLower, phrase, 1, true)
			end
		end
	end
	
	local replacements = LANGUAGE_REPLACEMENTS[language]
	if not replacements then return text end 
	
	local protectedWords = GetReverseDictionary(language)

	text = string.gsub(text, "([%a']+)", function(word)
		local lowerWord = string.lower(word)
		
		if protectedWords[lowerWord] then
			local finalWord = MatchCasing(word, word)
			return GetRuneString(finalWord, language)
		end
		
		local hash = 5381
		for i = 1, #word do
			hash = bit.bxor((hash * 33), string.byte(word, i, i));
		end

		local choices = replacements[#word];
		if not choices then
			-- Long words should just use the longest word-length set.
			choices = replacements[#replacements];
		end

		local rawTranslation = choices[(hash % #choices) + 1]
		local finalWord = MatchCasing(word, rawTranslation)

		return GetRuneString(finalWord, language)
	end)

	if Languages_DB.settings.glyphs then
		local spaceRune = GetRuneString(" ", language)

		text = text:gsub(" ", spaceRune)
	end

	for token, translation in pairs(protectedPhrases) do
		token = string.gsub(token, "([%(%)%.%%%+%-%*%?%[%^%$])", "%%%1")
		text = string.gsub(text, token, translation)
	end

	return text
end

local function StripTags(text)
	local count = 1
	while count > 0 do
		text, count = string.gsub(text, "|H.-|h(.-)|h", "%1")
	end
	
	text = string.gsub(text, "|T.-|t", "")
	
	text = string.gsub(text, "|cn.-:(.-)|r", "%1")
	
	text = string.gsub(text, "|c%x%x%x%x%x%x%x%x", "")
	
	-- item links will often use colorname
	text = string.gsub(text, "|cn.-|r", "")
	text = string.gsub(text, "|cn", "")
	text = string.gsub(text, "|A.-|a", "")
	text = string.gsub(text, "|A", "")
	text = string.gsub(text, "|a", "")
	
	text = string.gsub(text, "|r", "")
	
	text = string.gsub(text, "|H.-|h", "") 
	
	-- breaks other stuff just as a "catch-all"
	text = string.gsub(text, "|", "")
	
	return text
end

local function eventFilterStuff(frame, event, message, sender, ...)
	for i, v in ipairs(thingsToHide) do
		if lang.combatCheck() then
			return
		else
			if message:find(v) then
				message = message:gsub(v, "")
				
				local cleanMessage = StripTags(message)

				local textColor = CreateColor(Languages_DB.settings.colors.prefix.r, Languages_DB.settings.colors.prefix.g, Languages_DB.settings.colors.prefix.b):GenerateHexColor()
				
				local internalKey = languageNoBrackets[v]
				local displayLanguageName = L[internalKey] or internalKey
				local bracketName = "[" .. displayLanguageName .. "]"

				if Languages_DB.profiles[charKey].TRP3 and TRP3_API then
					local profile = GetActiveProfile()
					if profile.understandLanguage[internalKey] then
						return false, "|c" .. textColor .. bracketName .. "|r " .. message, sender, ...
					else
						if event == "CHAT_MSG_SAY" then
							chatTypeBingus = ChatTypeInfo["SAY"];
						elseif event == "CHAT_MSG_YELL" then
							chatTypeBingus = ChatTypeInfo["YELL"];
						end

						local linkData = "languages:" .. internalKey .. ":" .. cleanMessage .. ":" .. sender
						
						local hyperLinkPrefix = "|H" .. linkData .. "|h" .. bracketName .. "|h"

						return false, "|c" .. textColor .. hyperLinkPrefix .. "|r " .. ReplaceLanguage(cleanMessage, internalKey), sender, ...
					end

				else
					if Languages_DB.profiles[charKey].understandLanguage[internalKey] then
						return false, "|c" .. textColor .. bracketName .. "|r " .. message, sender, ...
					else
						if event == "CHAT_MSG_SAY" then
							chatTypeBingus = ChatTypeInfo["SAY"];
						elseif event == "CHAT_MSG_YELL" then
							chatTypeBingus = ChatTypeInfo["YELL"];
						end
						
						local linkData = "languages:" .. internalKey .. ":" .. cleanMessage .. ":" .. sender
						
						local hyperLinkPrefix = "|H" .. linkData .. "|h" .. bracketName .. "|h"

						return false, "|c" .. textColor .. hyperLinkPrefix .. "|r " .. ReplaceLanguage(cleanMessage, internalKey), sender, ...
					end
				end
			end
		end
	end

end

ChatFrameUtil.AddMessageEventFilter("CHAT_MSG_SAY", eventFilterStuff);
ChatFrameUtil.AddMessageEventFilter("CHAT_MSG_YELL", eventFilterStuff);

local function testScriptHeader()
	mainFrame.setMaxLetters()

	if not ACTIVE_CHAT_EDIT_BOX then return end

	local editBox = _G[ACTIVE_CHAT_EDIT_BOX:GetName()]
	local header = _G[ACTIVE_CHAT_EDIT_BOX:GetName().."Header"]
	
	if not editBox:IsShown() then return end
	if lang.combatCheck() then return end
	
	local chatType = editBox:GetAttribute("chatType")
	if chatType ~= "SAY" and chatType ~= "YELL" then return end

	local defaultLang, defaultLangID = GetDefaultLanguage("player")
	local currentLangID = editBox.languageID

	local suffixText = ""
	local useAddonColor = false

	if currentLangID ~= defaultLangID then
		local langName = GetLanguageNameByID(currentLangID)
		if langName then
			suffixText = "[" .. langName .. "]"
			useAddonColor = false
		end
	elseif mainFrame.prefix == true and currentLanguage.lang ~= "" and currentLanguage.lang ~= nil then
		if lang.factionCheck() == true and ShouldProcessLanguage() then
			local langName = L[currentLanguage.lang] or currentLanguage.lang
			suffixText = "[" .. langName .. "]"
			useAddonColor = true
		end
	end

	if suffixText == "" then return end

	local cleanHeader = header:GetText():gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", "")
	if string.find(cleanHeader, suffixText, 1, true) then return end

	if useAddonColor then
		local color = Languages_DB.settings.colors.prefix
		local hex = CreateColor(color.r, color.g, color.b):GenerateHexColor()
		suffixText = "|c" .. hex .. suffixText .. "|r"
	end

	local left, right, top, bottom = editBox:GetTextInsets()
	
	header:SetText(header:GetText() .. suffixText)
	editBox:SetTextInsets(left + (header:GetStringWidth()/1.3), right, top, bottom)
end

mainFrame.PHTRP3Text = content3:CreateFontString()
mainFrame.PHTRP3Text:SetFont(STANDARD_TEXT_FONT, 11)
mainFrame.PHTRP3Text:SetPoint("CENTER", content3, "CENTER", 0, -70)
mainFrame.PHTRP3Text:SetText("Placeholder TRP3 Profile Name")


function lang.trp3ProfileName()
	if C_AddOns.IsAddOnLoaded("totalRP3") == true then

		mainFrame.PHTRP3Text:Show()
		if TRP3_API.profile.getPlayerCurrentProfile() then
			if Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName] == nil then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName] = CopyTable(defaultsTableChar);
			end

			if Languages_DB.profiles[charKey].TRP3 == true then
				mainFrame.PHTRP3Text:SetText("TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName);
				mainFrame.RefreshLanguageList()
				mainFrame.shapeshiftFormsCB:SetChecked(Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].shapeshift);
			else
				mainFrame.PHTRP3Text:SetText(charKey);
				--mainFrame.PHTRP3Text:Hide();
			end

			mainFrame.trp3ProfileCB:Enable();
			mainFrame.trp3ProfileCB.text:SetTextColor(1,1,1);

			local profile = GetActiveProfile()

			local shouldShow = profile.selectionButton.shown
	
			if shouldShow and profile.onlyInCharacter and C_AddOns.IsAddOnLoaded("totalRP3") and TRP3_API then
				if not AddOn_TotalRP3.Player.GetCurrentUser():IsInCharacter() then
					lang.SelectionButton:Hide()
				end
			end
		end
	end
end

function lang.factionCheck()
	if Languages_DB.settings.faction ~= true then
		return true
	else
		if UnitFactionGroup("player") == "Alliance" then
			if currentLanguage.lang == L["Common"] then
				return false
			else
				return true
			end
		elseif UnitFactionGroup("player") == "Horde" then
			if currentLanguage.lang == L["Orcish"] then
				return false
			else
				return true
			end
		elseif UnitFactionGroup("player") == "Neutral" then
			if currentLanguage.lang == L["Pandaren"] then
				return false
			else
				return true
			end
		else
			return true
		end
	end
end

lang.prefixRevert = false;

function lang.shapeshiftForm()
	if mainFrame.prefix == false then
		lang.prefixRevert = false;
	else
		lang.prefixRevert = true;
	end
	if C_UnitAuras.GetPlayerAuraBySpellID(232698) then -- shadowform
		currentLanguage.lang = "Shath'Yar";
		mainFrame.prefix = false;
		mainFrame.TogglePrefix();
		lang.checkSettings();
	elseif C_UnitAuras.GetPlayerAuraBySpellID(162264) or C_UnitAuras.GetPlayerAuraBySpellID(187827) then -- metamorphosis
		currentLanguage.lang = "Demonic";
		mainFrame.prefix = false;
		mainFrame.TogglePrefix();
		lang.checkSettings();
	else
		if lang.prefixRevert == false then
			mainFrame.prefix = true;
			mainFrame.TogglePrefix();
			lang.checkSettings();
		else
			mainFrame.prefix = false;
			mainFrame.TogglePrefix();
			lang.checkSettings();
		end
		currentLanguage = CopyTable(preserveLanguage);
	end

end


function lang.shapeshiftProfileCheck()
	if GetActiveProfile().shapeshift == true then
		lang.shapeshiftForm()
	end
end

function lang.checkSettings()
	local profile = GetActiveProfile()

	mainFrame.glyphsCB:SetChecked(Languages_DB.settings.glyphs);
	mainFrame.speechbubCB:SetChecked(Languages_DB.settings.speechBubbles);
	mainFrame.combatCB:SetChecked(Languages_DB.settings.combat);
	mainFrame.factionLangCB:SetChecked(Languages_DB.settings.faction);

	mainFrame.combatCB:SetChecked(Languages_DB.settings.combat);
	mainFrame.factionLangCB:SetChecked(Languages_DB.settings.faction);

	if mainFrame.runeScaleSlider then
		mainFrame.runeScaleSlider:SetValue(Languages_DB.settings.runeScale or 0.5);
	end

	mainFrame.trp3ProfileCB:SetChecked(profile.TRP3);
	mainFrame.shapeshiftFormsCB:SetChecked(profile.shapeshift);
	mainFrame.onlyInCharacterCB:SetChecked(profile.onlyInCharacter)

	if not lang.SelectionButton then
		lang.CreateSelectionButton()
	end
	
	if not profile.selectionButton then 
		profile.selectionButton = CopyTable(defaultsTableChar.selectionButton) 
	end

	mainFrame.selectionButtonCB:SetChecked(profile.selectionButton.shown)
	
	lang.SelectionButton:ClearAllPoints()
	if profile.selectionButton.point then
		lang.SelectionButton:SetPoint(profile.selectionButton.point, UIParent, profile.selectionButton.relativePoint, profile.selectionButton.x, profile.selectionButton.y)
	else
		lang.SelectionButton:SetPoint("CENTER", UIParent, "CENTER", 0, 0)
	end
	
	local shouldShow = profile.selectionButton.shown
	
	if shouldShow then
		lang.SelectionButton:Show()
		local factionText
		if UnitFactionGroup("player") == "Alliance" then
			factionText = L["Common"]
		elseif UnitFactionGroup("player") == "Horde" then
			factionText = L["Orcish"]
		elseif UnitFactionGroup("player") == "Neutral" then
			factionText = L["Pandaren"]
		end
		if currentLanguage.lang then
			local langName = L[currentLanguage.lang] or currentLanguage.lang
			lang.SelectionButton.Text:SetText(langName)
		else
			lang.SelectionButton.Text:SetText(factionText)
		end
	else
		lang.SelectionButton:Hide()
	end

	if C_AddOns.IsAddOnLoaded("totalRP3") then
		mainFrame.trp3ProfileCB:Enable()
		mainFrame.trp3ProfileCB.text:SetTextColor(1, 1, 1)
		mainFrame.onlyInCharacterCB:Enable()
		mainFrame.onlyInCharacterCB.text:SetTextColor(1, 1, 1)
	else
		mainFrame.trp3ProfileCB:Disable()
		mainFrame.trp3ProfileCB.text:SetTextColor(0.5, 0.5, 0.5)
		mainFrame.onlyInCharacterCB:Disable()
		mainFrame.onlyInCharacterCB.text:SetTextColor(0.5, 0.5, 0.5)
	end

	mainFrame.RefreshLanguageList()
	if mainFrame.RefreshDialectWordList then
		mainFrame.RefreshDialectWordList()
		
		if profile.dialect then
			mainFrame.DialectDropdown:SetText(profile.dialect)
		else
			mainFrame.DialectDropdown:SetText(L["Dialect"])
		end
	end

	mainFrame.PHTRP3Text:SetText(charKey);
	lang.trp3ProfileName();
end

function lang.trp3Check()
	if C_AddOns.IsAddOnLoaded("totalRP3") then
		TRP3_API.RegisterCallback(TRP3_Addon, "REGISTER_DATA_UPDATED", function() lang.checkSettings(); end);
	end
end

local function ChatBubble_OnUpdate(eventFrame, elapsed)
	if Languages_DB.settings.speechBubbles ~= true then
		return
	else
		eventFrame.lastupdate = (eventFrame.lastupdate or -2) + elapsed
		if eventFrame.lastupdate < 0.1 then return end
		eventFrame.lastupdate = 0

		for _, frame in pairs(C_ChatBubbles.GetAllChatBubbles()) do
			local holder = frame:GetChildren()
			if holder and not holder:IsForbidden() then
				local SomeTranslatedText;
				if holder.String:GetText() ~= nil then
					for i, v in ipairs(thingsToHide) do
						if holder.String:GetText():find(v) ~= nil then
							local badabingus = holder.String:GetText():gsub(v, "")
							local textColor = CreateColor(Languages_DB.settings.colors.prefix.r, Languages_DB.settings.colors.prefix.g, Languages_DB.settings.colors.prefix.b):GenerateHexColor()
							
							local internalKey = languageNoBrackets[v]
							local displayLanguageName = L[internalKey] or internalKey
							local bracketName = "[" .. displayLanguageName .. "]"
							
							if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
								local profile = GetActiveProfile()
								if profile.understandLanguage[internalKey] == true then
									return
								else
									SomeTranslatedText = "|c" .. textColor .. bracketName .. "|r " .. ReplaceLanguage(badabingus, internalKey)
									holder.String:SetText(SomeTranslatedText)
								end
							else
								if Languages_DB.profiles[charKey].understandLanguage[internalKey] == true then
									return
								else
									SomeTranslatedText = "|c" .. textColor .. bracketName .. "|r " .. ReplaceLanguage(badabingus, internalKey)
									holder.String:SetText(SomeTranslatedText)
								end
							end
						end
					end
				end
			end
		end
	end
end

function lang:LoadChatBubbles()

	local BubbleFrame = CreateFrame("Frame")

	if Languages_DB.settings.speechBubbles ~= false then
		BubbleFrame:SetScript('OnUpdate', ChatBubble_OnUpdate)
	else
		BubbleFrame:SetScript('OnUpdate', nil)
	end
end

lang:RegisterEvent("ADDON_LOADED")
lang:RegisterEvent("PLAYER_ENTERING_WORLD")
lang:RegisterEvent("UNIT_AURA")
--lang:RegisterEvent("PLAYER_ENTERING_WORLD")


function mainFrame.init()
	mainFrame.RefreshLanguageList()
	mainFrame.RefreshDialectWordList()
end

function lang.InitializeDB()
	if not Languages_DB then Languages_DB = {} end

	if not Languages_DB.settings then 
		Languages_DB.settings = CopyTable(defaultsTableAcc) 
	else
		for key, value in pairs(defaultsTableAcc) do
			if Languages_DB.settings[key] == nil then
				Languages_DB.settings[key] = value
			elseif type(value) == "table" and type(Languages_DB.settings[key]) == "table" then
				for subKey, subValue in pairs(value) do
					if Languages_DB.settings[key][subKey] == nil then
						Languages_DB.settings[key][subKey] = subValue
					end
				end
			end
		end
	end

	if not Languages_DB.profiles then Languages_DB.profiles = {} end
	
	if not Languages_DB.profiles[charKey] then 
		Languages_DB.profiles[charKey] = CopyTable(defaultsTableChar) 
	end

	for profileName, profileData in pairs(Languages_DB.profiles) do
		for key, value in pairs(defaultsTableChar) do
			if profileData[key] == nil then
				if type(value) == "table" then
					profileData[key] = CopyTable(value)
				else
					profileData[key] = value
				end
			end
		end
	end
end


local TranslationTooltip = CreateFrame("Frame", "LanguagesTranslationTooltip", UIParent, "BackdropTemplate")
TranslationTooltip:SetSize(300, 150)
TranslationTooltip:SetPoint("CENTER", UIParent, "CENTER")
TranslationTooltip:SetMovable(true)
TranslationTooltip:SetClampedToScreen(true)
TranslationTooltip:EnableMouse(true)
TranslationTooltip:SetFrameStrata("TOOLTIP")
TranslationTooltip:Hide()
TranslationTooltip:RegisterForDrag("LeftButton")

TranslationTooltip:SetBackdrop({
	bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
	edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
	tile = true,
	tileSize = 16,
	edgeSize = 16,
	insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
TranslationTooltip:SetBackdropColor(0, 0, 0, 0.9)
TranslationTooltip:SetBackdropBorderColor(0.6, 0.6, 0.6, 1)

TranslationTooltip.titleBar = CreateFrame("Frame", nil, TranslationTooltip)
TranslationTooltip.titleBar:SetPoint("TOPLEFT", 8, -8)
TranslationTooltip.titleBar:SetPoint("TOPRIGHT", -8, -8)
TranslationTooltip.titleBar:SetHeight(20)

TranslationTooltip:SetScript("OnDragStart", function(self)
	TranslationTooltip:StartMoving()
end)
TranslationTooltip:SetScript("OnDragStop", function(self)
	TranslationTooltip:StopMovingOrSizing()
end)

TranslationTooltip.closeButton = CreateFrame("Button", nil, TranslationTooltip, "UIPanelCloseButton")
TranslationTooltip.closeButton:SetPoint("TOPRIGHT", -2, -2)
TranslationTooltip.closeButton:SetSize(20, 20)
TranslationTooltip.closeButton:SetScript("OnClick", function()
	TranslationTooltip:Hide()
end)

TranslationTooltip.title = TranslationTooltip.titleBar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
TranslationTooltip.title:SetPoint("LEFT", 2, 0)
TranslationTooltip.title:SetText(L["Translation"])

TranslationTooltip.languageLabel = TranslationTooltip:CreateFontString(nil, "OVERLAY", "GameFontNormal")
TranslationTooltip.languageLabel:SetPoint("TOPLEFT", 15, -35)
TranslationTooltip.languageLabel:SetPoint("TOPRIGHT", -15, -35)
TranslationTooltip.languageLabel:SetJustifyH("LEFT")

TranslationTooltip.textarea = CreateFrame("Frame", nil, TranslationTooltip)
TranslationTooltip.textarea:SetPoint("TOPLEFT", 15, -60)
TranslationTooltip.textarea:SetPoint("BOTTOMRIGHT", -30, 15)

TranslationTooltip.translationText = TranslationTooltip.textarea:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
TranslationTooltip.translationText:SetPoint("TOPLEFT")
TranslationTooltip.translationText:SetWidth(TranslationTooltip.textarea:GetWidth() - 10)
TranslationTooltip.translationText:SetJustifyH("LEFT")
TranslationTooltip.translationText:SetWordWrap(true)


function TranslationTooltip:ShowTranslation(langKey, translation, sender)
	local displayName = L[langKey] or langKey
	self.title:SetText(L["Translation"] .. " - " .. sender)
	self.languageLabel:SetText(L["Language"] .. ": " .. displayName)
	self.translationText:SetText(translation)
	
	local textHeight = self.translationText:GetStringHeight()
	local newHeight = math.min(math.max(textHeight + 100, 150), 400)
	self:SetHeight(newHeight)
	
	self:Show()
end

tinsert(UISpecialFrames, "LanguagesTranslationTooltip")


local function OnHyperlinkClick(self, link, text, button)
	local linkType, linkData = link:match("^([^:]+):(.+)$")
	
	if linkType == "languages" then
		local langKey, translation, sender = linkData:match("^([^:]+):([^:]+):(.+)$")
		
		if langKey and translation and sender then
			TranslationTooltip:ShowTranslation(langKey, translation, sender)
		end
	end
end

local function OnHyperlinkEnter(self, link, text, region, left, bottom, width, height)
	local linkType, linkData = link:match("^([^:]+):(.+)$")

	if linkType == "languages" then
		local langKey, translation, sender = linkData:match("^([^:]+):([^:]+):(.+)$")

		if langKey and translation then
			local tooltip = GameTooltip
			tooltip:SetOwner(self, "ANCHOR_CURSOR")
			tooltip:ClearLines()
			
			local displayName = L[langKey] or langKey
			tooltip:AddLine(L["Language"] .. ": " .. WrapTextInColorCode(displayName, "ffffffff"))

			tooltip:AddLine(L["Translation"] .. ": " .. WrapTextInColorCode(translation, "ffffffff"), nil, nil, nil, true)
			
			tooltip:Show()
		end
	end
end

function lang.HyperLinks()

	ChatFrame1:HookScript("OnHyperlinkEnter", OnHyperlinkEnter)

	ChatFrame1:HookScript("OnHyperlinkLeave", function(self)
		GameTooltip:Hide()
	end)
	
	ChatFrame1:SetHyperlinksEnabled(true)
	ChatFrame1:HookScript("OnHyperlinkClick", OnHyperlinkClick)
end

function lang.addonLoaded(self, event, arg1) -- table, event, addonName
	if event == "ADDON_LOADED" and arg1 == "Languages" then

		hooksecurefunc(ChatFrame1EditBox, "ParseText", function() RunNextFrame(testScriptHeader); end)

		lang.InitializeDB()

		if Languages_DB.settings == nil then
			Languages_DB.settings = CopyTable(defaultsTableAcc);
		end

		if Languages_DB.profiles[charKey] == nil then
			Languages_DB.profiles[charKey] = CopyTable(defaultsTableChar);
		end
		
		if not lang.SelectionButton then
			lang.CreateSelectionButton()
		end

		lang:LoadChatBubbles()

		lang.checkSettings();
		lang.trp3Check();

		SLASH_LANG1 = L["SLASH_1"]
		SLASH_LANG2 = L["SLASH_2"]
		SLASH_LANG3 = L["SLASH_3"]
		SLASH_LANG4 = L["SLASH_4"] -- non-localized slash
		SLASH_LANG3 = L["SLASH_5"] -- non-localized slash
		SLASH_LANG4 = L["SLASH_6"] -- non-localized slash

		for _, langKey in ipairs(languageBasicList) do
			local cleanCommand = langKey:gsub("[%s%p]", ""):upper()
			_G["SLASH_LANG_" .. cleanCommand .. "1"] = "/" .. langKey:lower()
			SlashCmdList["LANG_" .. cleanCommand] = function()
				mainFrame.SetLanguage(langKey)
			end
		end
		
		SlashCmdList.LANG = mainFrame.HandleSlashCommands;

		mainFrame.init();

		tinsert(UISpecialFrames, mainFrame:GetName())

		mainFrame:SetScript("OnMouseDown", function(self, button)
			self:SetToplevel(true);
			self:StartMoving();
		end);
		mainFrame:SetScript("OnMouseUp", function(self, button)
			mainFrame:StopMovingOrSizing()
		end);

		mainFrame:SetScript("OnShow", function()
			lang.checkSettings()
			PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN, "SFX");
		end);
		mainFrame:SetScript("OnHide", function()
			lang.checkSettings()
			PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE, "SFX");
		end);

	end
	if event == "PLAYER_ENTERING_WORLD" then -- load some stuff late, generally so we don't get overwritten
		lang.HyperLinks()
	end
	if event == "UNIT_AURA" and arg1 == "player" then
		lang.shapeshiftProfileCheck()
	end
end

lang:SetScript("OnEvent", lang.addonLoaded)

local function OnAddonLoaded()
	local ChattynatorHyperlinkHandler = Chattynator.API.GetHyperlinkHandler() -- chattynator explodes OnHyperlinkEnter with SetScript, so hookscript onto chattynator's setscript
	
	ChattynatorHyperlinkHandler:HookScript("OnHyperlinkClick", OnHyperlinkClick)
	ChattynatorHyperlinkHandler:HookScript("OnHyperlinkEnter", OnHyperlinkEnter)
end

EventUtil.ContinueOnAddOnLoaded("Chattynator", OnAddonLoaded);