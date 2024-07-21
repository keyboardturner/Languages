local _, L = ...

local defaultsTableAcc = {
	
	glyphs = true, glyphSizeX = 15, glyphSizeY = 15,
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
	understandLanguage = {
	},
};

local lang = CreateFrame("Frame");
local chatTypeBingus = ChatTypeInfo["SAY"];

local function Print(text)
	local textColor = CreateColor(Languages_DB.settings.colors.prefix.r, Languages_DB.settings.colors.prefix.g, Languages_DB.settings.colors.prefix.b):GenerateHexColor()
	text = "|c" .. textColor .. L["Languages"] .. "|r" .. ": " .. text
	
	return DEFAULT_CHAT_FRAME:AddMessage(text, 1, 1, 1)
end

local mainFrame = CreateFrame("Frame", "LanguagesMainFrame", UIParent, "PortraitFrameTemplateMinimizable")
mainFrame:SetPortraitTextureRaw("Interface\\AddOns\\Languages\\Languages_Icon_Small")
--mainFrame.PortraitContainer.portrait:SetTexture("Interface\\AddOns\\Languages\\Languages_Icon_Small")
mainFrame:SetTitle("Languages")
mainFrame:SetSize(338,424)
mainFrame:SetPoint("CENTER", UIParent, "CENTER")
mainFrame:SetMovable(true)
mainFrame:SetClampedToScreen(true)
mainFrame:SetScript("OnMouseDown", function(self, button)
	self:StartMoving()
end);
mainFrame:SetScript("OnMouseUp", function(self, button)
	mainFrame:StopMovingOrSizing()
end);
mainFrame:Hide()
mainFrame:SetScript("OnShow", function()
	PlaySound(74421)
end);
mainFrame:SetScript("OnHide", function()
	PlaySound(74423)
end);
mainFrame.minMax = true;

function mainFrame.minMaxFunc()
	if mainFrame.minMax == true then
		mainFrame:SetSize(338,100)
		mainFrame.minMax = false
	elseif mainFrame.minMax == false then
		mainFrame:SetSize(338,424)
		mainFrame.minMax = true
	end
end

function mainFrame:tooltip_OnEnter(frame, text)
	if GameTooltip:IsShown() == false then
		GameTooltip_SetDefaultAnchor(GameTooltip, frame);
	end
	GameTooltip:ClearAllPoints();
	GameTooltip:SetText(text, 1, 1, 1, 1, true);
	GameTooltip:SetPoint("BOTTOMLEFT", frame, "TOPRIGHT", 0, 0);
	GameTooltip:Show();
end
function mainFrame.tooltip_OnLeave()
	GameTooltip:Hide();
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
		mainFrame.TabButtonTest.content:SetSize(334, 10)
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
local content1, content2, content3 = mainFrame.SetTabs(mainFrame, 3, "Diction", "Settings", "Profiles")

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
	elseif mainFrame.prefix == false then
		mainFrame.prefix = true;
		if currentLanguage.lang == nil then
			currentLanguage.lang = ""
		end
		mainFrame.ButtonTest:SetText(L["TogglePrefixOn"] .. "\n" .. L["CurrentlySpeaking"] .. " " .. currentLanguage.lang);
		--Print(L["TogglePrefixTextOn"]);
	end
end




---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Prefix Handling
---------------------------------------------------------------------------------------------------------------------------------------------------------

local textBeforeParse, parsedEditBox;
local gopherPadding;

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
				local subtractLetters = string.len("[" .. currentLanguage.lang .. "]" .. " ")
				if mainFrame.prefix ~= true then
					subtractLetters = 0
				end
				editBox:SetVisibleTextByteLimit(maxLetters - subtractLetters)
				subtractLetters = 0
			end
		end
	end
end

function mainFrame.enablePrefix()

	-- Hook the ChatEdit_InsertLink() function that is called when the user SHIFT-Click a player name
	-- in the chat frame to insert it into a text field.
	-- We can replace the name inserted by the complete RP name of the player if we have it.

	hooksecurefunc("ChatEdit_ParseText", function(editBox, send)
		if lang.combatCheck() then
			return
		else
			if lang.factionCheck() == true then
				local text = editBox:GetText();
				if text and send == 1 then
					if text ~= "" and text ~= nil then
						textBeforeParse = text;
						parsedEditBox = editBox;
						if ACTIVE_CHAT_EDIT_BOX == nil then -- required for things like macros, where active edit box is nil
							return
						end
						if mainFrame.prefix == true and currentLanguage.lang ~= "" and currentLanguage.lang ~= nil and (_G[ACTIVE_CHAT_EDIT_BOX:GetName()]:GetAttribute("chatType") == "SAY" or _G[ACTIVE_CHAT_EDIT_BOX:GetName()]:GetAttribute("chatType") == "YELL") then

							if editBox:GetMaxBytes() ~= 1280 then
								if C_AddOns.IsAddOnLoaded("EmoteSplitter") == true then
									gopherPadding = LibGopher.GetPadding()
									LibGopher.SetPadding( "[" .. currentLanguage.lang .. "]" )
									text = " " .. text
								else
									text = "[" .. currentLanguage.lang .. "]" .. " " .. text;
								end
							else
								text = "[" .. currentLanguage.lang .. "]" .. " " .. text;
								editBox:SetVisibleTextByteLimit(255)
							end
						end
						editBox:SetText(text);
					end
				end
			end
		end
	end);

	-- Restore the text without substitution before it's stored in the chat history
	hooksecurefunc("SubstituteChatMessageBeforeSend", function()
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

local realmKey = GetRealmName()
local charKey = UnitName("player") .. " - " .. realmKey

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
			Print(L["CurrentlySpeaking"] .. currentLanguage.lang)
		else
			Print(L["TogglePrefixOff"])
		end
	end,

	["help"] = function()
		Print(L["Help"])
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

			local path = mainFrame.commands; -- required for updating found table.

			for id, arg in ipairs(args) do

			if (#arg > 0) then --if string length is greater than 0
			arg = arg:lower();          
			if (path[arg]) then
				if (type(path[arg]) == "function") then
					-- all remaining args passed to our function!
					path[arg](select(id + 1, unpack(args))); 
					return;                 
				elseif (type(path[arg]) == "table") then
					path = path[arg]; -- another sub-table found!
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

local thingsToHide = {
	"^%[Common%]",
	"^%[Darnassian%]",
	"^%[Dwarven%]",
	"^%[Gnomish%]",
	"^%[Draenei%]",
	"^%[Orcish%]",
	"^%[Zandali%]",
	"^%[Taurahe%]",
	"^%[Gutterspeak%]",
	"^%[Thalassian%]",
	"^%[Goblin%]",
	"^%[Shalassian%]",
	"^%[Vulpera%]",
	"^%[Pandaren%]",
	--"^%[Ancient Pandaren%]",
	"^%[Draconic%]",

	"^%[Demonic%]",
	"^%[Titan%]",
	"^%[Kalimag%]",
	"^%[Shath'Yar%]",
	"^%[Broker%]",
	"^%[Cypher%]",

	"^%[Sprite%]",
	"^%[Nerglish%]",
	"^%[Moonkin%]",
	"^%[Furbolg%]",
};

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

local LANGUAGE_REPLACEMENTS = {
	["Common"] = {
		[1] = {"a", "e", "i", "o", "u", "y"},
		[2] = {"an", "ko", "lo", "lu", "me", "ne", "re", "ru", "se", "ti", "va", "ve"},
		[3] = {"ash", "bor", "bur", "far", "gol", "hir", "lon", "mod", "nud", "ras", "ver", "vil", "vos"},
		[4] = {"ador", "agol", "dana", "goth", "lars", "noth", "nuff", "odes", "ruff", "thor", "uden", "veld", "vohl", "vrum"},
		[5] = {"algos", "barad", "borne", "melka", "ergin", "eynes", "garde", "gloin", "majis", "nagan", "novas", "regen", "tiras", "wirsh"},
		[6] = {"aesire", "aziris", "daegil", "danieb", "ealdor", "engoth", "goibon", "mandos", "nevren", "rogesh", "rothas", "ruftos", "skilde", "valesh", "vandar", "waldir"},
		[7] = {"andovis", "ewiddan", "faergas", "forthis", "kaelsig", "koshvel", "lithtos", "nandige", "nostyec", "novaedi", "sturume", "vassild"},
		[8] = {"aldonoth", "cynegold", "endirvis", "hamerung", "landowar", "lordaere", "methrine", "ruftvess", "thorniss"},
		[9] = {"aetwinter", "danagarde", "eloderung", "firalaine", "gloinador", "gothalgos", "regenthor", "udenmajis", "vandarwos", "veldbarad"},
		[10] = {"aelgestron", "cynewalden", "danavandar", "dyrstigost", "falhedring", "vastrungen"},
		[11] = {"agolandovis", "bornvalesh", "dornevalesh", "farlandowar", "forthasador", "thorlithtos", "vassildador", "wershaesire"},
		[12] = {"gorveldbarad", "mandosdaegil", "nevrenrothas", "waldirskilde"},
		["hasRunes"] = true,
	},

	["Darnassian"] = {
		[1] = {"a", "d", "e", "i", "n", "o"},
		[2] = {"al", "an", "da", "do", "lo", "ni", "no", "ri", "su"},
		[3] = {"ala", "ano", "anu", "ash", "dor", "dur", "fal", "nei", "nor", "osa", "tal", "tur"},
		[4] = {"alah", "aman", "anar", "andu", "dath", "dieb", "diel", "fulo", "mush", "rini", "shar", "thus"},
		[5] = {"adore", "balah", "bandu", "eburi", "fandu", "ishnu", "shano", "shari", "talah", "terro", "thera", "turus"},
		[6] = {"ast'ore", "belore", "do'rah", "dorini", "ethala", "falla", "ishura", "man'ar", "neph'o", "shando", "t'as'e", "u'phol"},
		[7] = {"al'shar", "alah'ni", "aman'ni", "anoduna", "dor'ano", "mush'al", "shan're"},
		[8] = {"d'ana'no", "dal'dieb", "dorithur", "eraburis", "il'amare", "mandalas", "thoribas"},
		[9] = {"banthalos", "dath'anar", "dune'adah", "fala'andu", "neph'anis", "shari'fal", "thori'dal"},
		[10] = {"ash'therod", "dorados'no", "isera'duna", "shar'adore", "thero'shan"},
		[11] = {"fandu'talah", "shari'adune"},
		[12] = {"dor'ana'badu", "t'ase'mushal"},
		[13] = {"u'phol'belore"},
		[14] = {"anu'dorannador", "turus'il'amare"},
		[15] = {"asto're'dunadah", "shindu'falla'na"},
		[16] = {"ando'meth'derador", "anu'dorinni'talah", "esh'thero'mannash", "thoribas'no'thera"},
		["hasRunes"] = true,
	},

	["Dwarven"] = {
		[1] = {"a"},
		[2] = {"am", "ga", "go", "ke", "lo", "ok", "ta", "um", "we", "zu"},
		[3] = {"ahz", "dum", "dun", "eft", "gar", "gor", "hor", "kha", "mok", "mos", "red", "ruk"},
		[4] = {"gear", "gosh", "grum", "guma", "helm", "hine", "hoga", "hrim", "khaz", "kost", "loch", "modr", "rand", "rune", "thon"},
		[5] = {"algaz", "angor", "dagum", "frean", "gimil", "goten", "havar", "havas", "mitta", "modan", "modor", "scyld", "skalf", "thros", "weard"},
		[6] = {"bergum", "drugan", "farode", "haldir", "haldji", "modgud", "modoss", "mogoth", "robush", "rugosh", "skolde", "syddan"},
		[7] = {"dun-fel", "ganrokh", "geardum", "godkend", "haldren", "havagun", "kaelsag", "kost-um", "mok-kha", "thorneb", "zu-modr"},
		[8] = {"azregahn", "gefrunon", "golganar", "khaz-dum", "khazrega", "misfaran", "mogodune", "moth-tur", "ok-hoga", "thulmane"},
		[9] = {"ahz-dagum", "angor-dum", "arad-khaz", "gor-skalf", "grum-mana", "khaz-rand", "kost-guma", "mund-helm"},
		[10] = {"angor-magi", "gar-mogoth", "hoga-modan", "midd-havas", "nagga-roth", "thros-gare"},
		[11] = {"azgol-haman", "dun-haldren", "ge'ar-anvil", "guma-syddan"},
		[12] = {"robush-mogan", "thros-am-kha"},
		[13] = {"gimil-thumane", "gol'gethrunon", "haldji-drugan"},
		[14] = {"gosh-algaz-dun", "scyld-modor-ok"},
		[15] = {"haldren-lo-modoss"},
		["hasRunes"] = false,
	},

	["Gnomish"] = {
		[1] = {"a", "c", "d", "e", "f", "g", "i", "o", "t"},
		[2] = {"am", "ga", "ke", "lo", "ok", "so", "ti", "um", "va", "we"},
		[3] = {"bur", "dun", "fez", "giz", "gal", "gar", "her", "mik", "mor", "mos", "nid", "rod", "zah"},
		[4] = {"buma", "cost", "dani", "gear", "gosh", "grum", "helm", "hine", "huge", "lock", "kahs", "rand", "riff", "rune"},
		[5] = {"algos", "angor", "dagem", "frend", "goten", "haven", "havis", "mitta", "modan", "modor", "nagin", "tiras", "thros", "weird"},
		[6] = {"danieb", "drugan", "dumssi", "gizber", "haldir", "helmok", "mergud", "protos", "revosh", "rugosh", "shermt", "waldor"},
		[7] = {"bergrim", "costirm", "ferdosr", "ganrokh", "geardum", "godling", "haidren", "havagun", "noxtyec", "scrutin", "sturome", "thorneb"},
		[8] = {"aldanoth", "azregorn", "bolthelm", "botlikin", "dimligar", "gefrunon", "godunmug", "grumgizr", "kahsgear", "kahzregi", "landivar", "methrine", "mikthros", "misfaran", "nandiger", "thulmane"},
		[9] = {"angordame", "elodergim", "elodmodor", "naggirath", "nockhavis"},
		[10] = {"ahzodaugum", "alegaskron", "algosgoten", "danavandar", "dyrstagist", "falhadrink", "frendgalva", "mosgodunan", "mundgizber", "naginbumat", "sihnvulden", "throsigear", "vustrangin"},
		[11] = {"ferdosmodan", "gizbarlodun", "haldjinagin", "helmokheram", "kahzhaldren", "lockrevoshi", "robuswaldir", "skalfgizgar", "thrunon'gol", "thumanerand"},
		["hasRunes"] = false,
	},

	["Draenei"] = {
		[1] = {"e", "g", "o", "x", "y"},
		[2] = {"az", "il", "me", "no", "re", "te", "ul", "ur", "xi", "za", "ze"},
		[3] = {"daz", "gul", "kar", "laz", "lek", "lok", "maz", "ril", "ruk", "shi", "tor", "zar"},
		[4] = {"alar", "aman", "amir", "ante", "ashj", "kiel", "maev", "maez", "orah", "parn", "raka", "rikk", "veni", "zenn", "zila"},
		[5] = {"adare", "belan", "buras", "enkil", "golad", "gular", "kamil", "melar", "modas", "nagas", "refir", "revos", "soran", "tiros", "zekil", "zekul"},
		[6] = {"arakal", "azgala", "kazile", "mannor", "mishun", "rakkan", "rakkas", "rethul", "revola", "thorje", "tichar"},
		[7] = {"amanare", "belaros", "danashj", "faralos", "faramos", "gulamir", "karaman", "kieldaz", "rethule", "tiriosh", "toralar", "zennshi"},
		[8] = {"amanalar", "ashjraka", "azgalada", "azrathud", "belankar", "enkilzar", "kirasath", "maladath", "mordanas", "theramas"},
		[9] = {"arakalada", "kanrethad", "melamagas", "melarorah", "nagasraka", "naztheros", "soranaman", "teamanare", "zilthuras"},
		[10] = {"amanemodas", "ashjrethul", "benthadoom", "kamilgolad", "matheredor", "pathrebosh", "ticharamir", "zennrakkan"},
		[11] = {"archimtiros", "ashjrakamas", "mannorgulan", "mishunadare", "zekulrakkas"},
		[12] = {"zennshinagas"},
		["hasRunes"] = true,
	},

	["Orcish"] = {
		[1] = {"a", "n", "g", "o", "l"},
		[2] = {"ha", "ko", "no", "mu", "ag", "ka", "gi", "il"},
		[3] = {"lok", "tar", "kaz", "ruk", "kek", "mog", "zug", "gul", "nuk", "aaz", "kil", "ogg"},
		[4] = {"rega", "nogu", "tago", "uruk", "kagg", "zaga", "grom", "ogar", "gesh", "thok", "dogg", "maka", "maza"},
		[5] = {"regas", "nogah", "kazum", "magan", "no'bu", "golar", "throm", "zugas", "re'ka", "no'ku", "ro'th"},
		[6] = {"thrakk", "revash", "makazz", "moguna", "no'gor", "goth'a", "raznos", "ogerin", "gezzno", "thukad", "makogg", "aaz'no"},
		[7] = {"lok'tar", "gul'rok", "kazreth", "tov'osh", "zil'nok", "rath'is", "kil'azi"},
		[8] = {"throm'ka", "osh'Kava", "gul'nath", "kog'zela", "ragath'a", "zuggossh", "moth'aga"},
		[9] = {"tov'nokaz", "osh'kazil", "no'throma", "gesh'nuka", "lok'mogul", "lok'bolar", "ruk'ka'ha"},
		[10] = {"regasnogah", "kazum'nobu", "throm'bola", "gesh'zugas", "maza'rotha", "ogerin'naz"},
		[11] = {"thrakk'reva", "kaz'goth'no", "no'gor'goth", "kil'azi'aga", "zug-zug'ama", "maza'thrakk"},
		[12] = {"lokando'nash", "ul'gammathar", "golgonnashar", "dalggo'mazah"},
		[13] = {"khaz'rogg'ahn", "moth'kazoroth"},
		["hasRunes"] = true,
	},

	["Zandali"] = {
		[1] = {"a", "e", "h", "j", "m", "n", "o", "s", "u"},
		[2] = {"di", "fi", "fu", "im", "ir", "is", "ju", "so", "wi", "yu"},
		[3] = {"deh", "dim", "fus", "han", "mek", "noh", "sca", "tor", "weh", "wha"},
		[4] = {"cyaa", "duti", "iman", "iyaz", "riva", "skam", "ting", "worl", "yudo"},
		[5] = {"ackee", "atuad", "caang", "difus", "nehjo", "t'ief", "wassa"},
		[6] = {"bwoyar", "deh'yo", "fidong", "honnah", "icense", "italaf", "saakes", "smadda", "stoosh", "wi'mek", "yuutee"},
		[7] = {"chakari", "craaweh", "flimeff", "godehsi", "lok'dim", "reespek", "rivasuf", "tanponi", "uptfeel", "yahsoda", "ziondeh"},
		[8] = {"ginnalka", "machette", "nyamanpo", "oondasta", "wehnehjo", "whutless", "yeyewata", "zutopong"},
		[9] = {"fus'obeah", "or'manley"},
		["hasRunes"] = true,
	},

	["Taurahe"] = {
		[1] = {"a", "e", "i", "n", "o"},
		[2] = {"ba", "ki", "lo", "ne", "ni", "no", "po", "ta", "te", "tu", "wa"},
		[3] = {"aki", "alo", "awa", "chi", "ich", "ish", "kee", "owa", "paw", "rah", "uku", "zhi"},
		[4] = {"a'ke", "awak", "balo", "eche", "isha", "hale", "halo", "mani", "nahe", "shne", "shte", "tawa", "towa"},
		[5] = {"a'hok", "a'iah", "abalo", "ahmen", "anohe", "ishte", "kashu", "nechi", "nokee", "pawni", "poalo", "porah", "shush", "ti'ha", "tanka", "yakee"},
		[6] = {"aloaki", "hetawa", "ichnee", "kichalo", "lakota", "lomani", "neahok", "nitawa", "owachi", "pawene", "sho'wa", "taisha", "tatanka", "washte"},
		[7] = {"ishnelo", "owakeri", "pikialo", "sechalo", "shtealo", "shteawa", "tihikea"},
		[8] = {"akiticha", "awaihilo", "ishnialo", "o'ba'chi", "orahpajo", "ovaktalo", "owatanka", "porahalo", "shtumani", "tatahalo", "towateke"},
		[9] = {"echeyakee", "haloyakee", "ishne'alo", "tawaporah"},
		[10] = {"awaka'nahe", "ichnee'awa", "ishamuhale", "shteowachi"},
		[11] = {"aloaki'shne", "awakeekielo", "lakota'mani", "shtumanialo"},
		[12] = {"awakeekielo", "aloaki'shne"},
		[13] = {"ishne'awahalo", "neashushahmen"},
		[14] = {"awakeeahmenalo"},
		[15] = {"ishne'alo'porah"},
		["hasRunes"] = false,
	},

	["Gutterspeak"] = {
		[1] = {"a", "e", "i", "o", "u", "y"},
		[2] = {"an", "ko", "lo", "lu", "me", "ne", "re", "ru", "se", "ti", "va", "ve"},
		[3] = {"ash", "bor", "bur", "far", "gol", "hir", "lon", "mos", "nud", "ras", "ver", "vil", "wos"},
		[4] = {"ador", "agol", "dana", "goth", "lars", "noth", "nuff", "odes", "ruff", "thor", "uden", "veld", "vohl", "vrum"},
		[5] = {"algos", "barad", "borne", "eynes", "ergin", "garde", "gloin", "majis", "melka", "nagan", "novas", "regen", "tiras", "wirsh"},
		[6] = {"aesire", "aziris", "daegil", "danieb", "ealdor", "engoth", "goibon", "mandos", "nevren", "rogesh", "rothas", "ruftos", "skilde", "valesh", "vandar", "waldir"},
		[7] = {"andovis", "ewiddan", "faergas", "forthis", "kaelsig", "koshvel", "lithtos", "nandige", "nostyec", "novaedi", "sturume", "vassild"},
		[8] = {"aldonoth", "cynegold", "endirvis", "hamerung", "landowar", "lordaere", "methrine", "ruftvess", "thorniss"},
		[9] = {"aetwinter", "danagarde", "eloderung", "firalaine", "gloinador", "gothalgos", "regenthor", "udenmajis", "vandarwos", "veldbarad"},
		[10] = {"aelgestron", "cynewalden", "danavandar", "dyrstigost", "falhedring", "vastrungen"},
		[11] = {"agolandovis", "bornevalesh", "farlandowar", "forthasador", "thorlithtos", "vassildador", "wershaesire"},
		[12] = {"adorstaerume", "golveldbarad", "mandosdaegil", "nevrenrothas", "waldirskilde"},
		["hasRunes"] = false,
	},

	["Thalassian"] = {
		[1] = {"a", "n", "i", "o", "e", "d"},
		[2] = {"da", "lo", "an", "ni", "al", "do", "ri", "su", "no"},
		[3] = {"ano", "dur", "tal", "nei", "ash", "dor", "anu", "fal", "tur", "ala", "nor", "osa"},
		[4] = {"alah", "andu", "dath", "mush", "shar", "thus", "fulo", "aman", "diel", "dieb", "rini", "anar"},
		[5] = {"talah", "adore", "ishnu", "bandu", "balah", "fandu", "thera", "turus", "shari", "shano", "terro", "eburi"},
		[6] = {"dorini", "shando", "ethala", "fallah", "belore", "do'rah", "neph'o", "man'ar", "ishura", "u'phol", "t'as'e"},
		[7] = {"asto're", "anoduna", "alah'ni", "dor'ano", "al'shar", "mush'al", "aman'ni", "shan're"},
		[8] = {"mandalas", "eraburis", "dorithur", "dal'dieb", "thoribas", "d'ana'no", "il'amare"},
		[9] = {"neph'anis", "dune'adah", "banthalos", "fala'andu", "dath'anar", "shari'fal", "thori'dal"},
		[10] = {"thero'shan", "isera'duna", "ash'therod", "dorados'no", "shar'adore"},
		[11] = {"fandu'talah", "shari'adune"},
		[12] = {"dor'ana'badu", "t'ase'mushal"},
		[13] = {"u'phol'belore"},
		[14] = {"turus'il'amare", "anu'dorannador"},
		[15] = {"asto're'dunadah"},
		[16] = {"shindu'fallah'na"},
		[17] = {"thoribas'no'thera", "ando'meth'derador", "anu'dorinni'talah", "esh'thero'mannash"},
		["hasRunes"] = true,
	},

	["Goblin"] = { -- languageID 40
		[1] = {"z"},
		[2] = {"ak", "rt", "ik", "um", "fr", "bl", "zz", "ap", "un", "ek"},
		[3] = {"eet", "paf", "gak", "erk", "gip", "nap", "kik", "bap", "ikk", "grk"},
		[4] = {"tiga", "moof", "bitz", "akak", "ripl", "foop", "keek", "errk", "apap", "rakr"},
		[5] = {"fibit", "shibl", "nebit", "ababl", "iklik", "nubop", "krikl", "zibit"},
		[6] = {"amama", "apfap", "ripdip", "skoopl", "bapalu", "oggnog", "yipyip", "kaklak", "ikripl", "bipfiz", "kiklix", "nufazl"},
		[7] = {"bakfazl", "rapnukl", "fizbikl", "lapadap", "biglkip", "nibbipl", "fuzlpop", "gipfizy", "babbada"},
		[8] = {"igglepop", "ibbityip", "etiggara", "saklpapp", "ukklnukl", "bendippl", "ikerfafl", "ikspindl", "baksnazl", "kerpoppl", "hopskopl"},
		[9] = {"hapkranky", "skippykik"},
		[10] = {"nogglefrap"},
		[11] = {"rapnakskappypappl", "rripdipskiplip", "napfazzyboggin", "kikklpipkikkl", "nibbityfuzhips", "bubnobblepapkap", "hikkitybippl"},
		["hasRunes"] = false,
	},

	["Shalassian"] = { -- languageID 181
		[1] = {"a", "e", "n", "i", "o", "d"},
		[2] = {"an", "do", "da", "lo", "ni", "al", "ri", "su", "no", "in"},
		[3] = {"nei", "anu", "ala", "ano", "dur", "tal", "ash", "dor", "fal", "tur", "nor", "osa", "vas", "anu", "tel"},
		[4] = {"alah", "mush", "diel", "anar", "thus", "andu", "dath", "shar", "fulo", "aman", "dieb", "rini", "rath"},
		[5] = {"adore", "thera", "shari", "eburi", "falla", "balah", "talah", "ishnu", "bandu", "fandu", "turus", "shano", "terro", "omnas", "an'ah", "tanos", "telar", "denil", "falar", "n'eth"},
		[6] = {"neph'o", "man'ar", "u'phol", "shando", "dorini", "ethala", "belore", "do'rah", "ishura", "t'as'e", "ith'el", "kanesh", "e'rath", "manari", "domaas", "ishnal", "maldin"},
		[7] = {"dor'ano", "aman'ni", "anoduna", "asto're", "alah'ni", "al'shar", "mush'al", "shan're", "in'alah", "arkhana", "to'reth", "vallath", "dorithur", "thoribas", "il'amare", "mandalas", "eraburis"},
		[8] = {"dal'dieb", "d'ana'no", "ith'nala", "an'ratha", "fala'andu", "shari'fal", "dune'adah", "thori'dal"},
		[9] = {"neph'anis", "banthalos", "dath'anar", "nar'thala", "sin'dorei", "tel'vasha"},
		[10] = {"isera'duna", "dorados'no", "thero'shan", "ash'therod", "shar'adore", "ru-shannah", "shal'dorei", "ash'thoras", "tenu'balah", "kal'theros", "nor'bethos", "tor'theras", "shal'assan"},
		[11] = {"shari'adune", "fandu'talah", "rath-domaas"},
		[12] = {"dor'ana'badu", "t'ase'mushal", "anar-ammenos"},
		[13] = {"u'phol'belore"},
		[14] = {"turus'il'amare", "anu'dorannador", "rath-anu'tanos", "rath-anu'telar"},
		[15] = {"shindu'falla'na", "asto're'dunadah"},
		[16] = {"anu'dorinni'talah", "ando'meth'derador", "esh'thero'mannash", "thoribas'no'thera"},
		["hasRunes"] = true,
	},

	["Vulpera"] = { -- languageID 285
		[1] = {"u", "i", "o", "y"},
		[2] = {"wa", "pa", "ho", "yi", "oo", "da", "aw", "au", "ii", "yy", "ak", "ik", "uk"},
		[3] = {"pow", "aoo", "woo", "wan", "bau", "gav", "arf", "yip", "yap", "bow", "hau", "haf", "vuf", "iiy", "iyw"},
		[4] = {"ring", "joff", "ahee", "wooo", "guau", "bork", "woof", "yiip", "yaap", "blaf", "woef", "keff", "gheu", "vuuf", "ghav", "bhuh"},
		[5] = {"hatti", "woooo", "waouh", "lally", "ouahn", "meong", "youwn", "wauwn", "yiuwn", "hittu", "hytou"},
		[6] = {"geding", "tchoff", "hattii", "wanwan", "baubau", "hauhau", "caicai", "yipyip"},
		[7] = {"frakaka", "bhuhbuh", "aheeaha", "wooowoo", "grrbork"},
		[8] = {"guauguau", "wuffwoef", "borkbork", "blafblaf", "gheugheu", "vuufwuff", "wuffvuwn"},
		[9] = {"ghavyouwn", "woefyouwn", "bhuhwauwn", "joffwauwn", "aheeowown", "ghavyouwn"},
		[10] = {"keffgeding", "woofhauhau", "vuufhattii", "borkwanwan", "blafhauhau"},
		["hasRunes"] = false,

	},

	["Pandaren"] = { -- reworked entirely, a truncated list of random names
		[1] = {"a", "i", "u", "e", "o", "n"},
		[2] = {"bu", "ji", "yu", "bo", "ji", "le", "lu", "li", "he", "qi", "tu", "fu", "an", "wu", "nu", "xi", "da", "yi", "qu", "za"},
		[3] = {"zhu", "jin", "chi", "shi", "zen", "bei", "ren", "zhu", "wei", "hao", "zai", "gao", "mei", "dao", "yun", "xin", "wen", "jue", "zan"},
		[4] = {"chen", "xing", "yuan", "chun", "xiao", "feng", "shan", "quan", "feng", "shen", "ling", "yong", "tian", "zhen", "zhao", "ming"},
		[5] = {"zhong", "binan", "xiang", "sheng", "zheng", "guang", "liang", "bo'lu", "ji'an", "xi-ji", "wu-la", "da'le", "nu-he", "bomei", "huian", "wuzen", "yumei"},
		[6] = {"sri-la", "hei-ji", "zhi'lu", "jie-he", "xiu-tu", "hua'an", "jia-nu", "mei-da", "hui'le", "bu'yun", "yu-mei", "ji-zai", "bo-wei", "le-zhu", "li-ren", "qi'zen", "fu-jin", "daquan"},
		[7] = {"wen-bao", "gao-ran", "mandori", "gan-tao", "zai-yan", "zen-lei", "yin'lao", "quxiang", "qitian", "zhuquan", "chenxin", "wuzheng", "xiaoyun"},
		[8] = {"fengshan", "xiaofeng", "jingchun", "bomeiren", "meirenhe"},
		[9] = {"fengzhong", "zhengming", "chenliang", "zhongyuan", "yuquanren", "huiqufeng", "yinlaomei"},
		[10] = {"wuzhengzen", "jingyuanan"},
		[11] = {"fengshanren"},
		[12] = {"chen-xinfeng", "xinjing-chun"},
		[13] = {"fengshanliang", "zhengmingquan"},
		["hasRunes"] = true,
	},

	["Ancient Pandaren"] = { -- extended/expanded list of truncated NameGen, reformatted. Complete: 1,2
		[1] = {"a", "i", "u", "e", "o", "n"},
		[2] = {"ai", "an", "bo", "bu", "di", "fu", "go", "gu", "gi", "ho", "hu", "ji", "ke", "ko", "ku", "li", "lo", "lu", "ma", "mi", "mu", "ni", "pa", "pu", "qi", "ri", "ru", "so", "si", "su", "ta", "to", "ti", "tu", "um", "wi", "wu", "xi", "xu", "ye", "yi", "yu", "zi"},
		[3] = {"zhu", "jin", "chi", "shi", "zen", "bei", "ren", "zhu", "wei", "hao", "zai", "gao", "mei", "dao", "yun", "xin", "wen", "jue", "zan"},
		[4] = {"chen", "xing", "yuan", "chun", "xiao", "feng", "shan", "quan", "feng", "shen", "ling", "yong", "tian", "zhen", "zhao", "ming"},
		[5] = {"zhong", "binan", "xiang", "sheng", "zheng", "guang", "liang", "bo'lu", "ji'an", "xi-ji", "wu-la", "da'le", "nu-he", "bomei", "huian", "wuzen", "yumei"},
		[6] = {"sri-la", "hei-ji", "zhi'lu", "jie-he", "xiu-tu", "hua'an", "jia-nu", "mei-da", "hui'le", "bu'yun", "yu-mei", "ji-zai", "bo-wei", "le-zhu", "li-ren", "qi'zen", "fu-jin", "daquan"},
		[7] = {"wen-bao", "gao-ran", "mandori", "gan-tao", "zai-yan", "zen-lei", "yin'lao", "quxiang", "qitian", "zhuquan", "chenxin", "wuzheng", "xiaoyun"},
		[8] = {"fengshan", "xiaofeng", "jingchun", "bomeiren", "meirenhe"},
		[9] = {"fengzhong", "zhengming", "chenliang", "zhongyuan", "yuquanren", "huiqufeng", "yinlaomei"},
		[10] = {"wuzhengzen", "jingyuanan"},
		[11] = {"fengshanren"},
		[12] = {"chen-xinfeng", "xinjing-chun"},
		[13] = {"fengshanliang", "zhengmingquan"},
		["hasRunes"] = true,
	},

	["Draconic"] = { -- languageID 11
		[1] = {"a", "e", "i", "o", "u", "y", "g", "x"},
		[2] = {"il", "no", "az", "te", "ur", "za", "ze", "re", "ul", "me", "xi"},
		[3] = {"tor", "gul", "lok", "asj", "kar", "lek", "daz", "maz", "ril", "ruk", "laz", "shi", "zar"},
		[4] = {"ashj", "alar", "orah", "amir", "aman", "ante", "kiel", "maez", "maev", "veni", "raka", "zila", "zenn", "parn", "rikk"},
		[5] = {"melar", "rakir", "tiros", "modas", "belan", "zekul", "soran", "gular", "enkil", "adare", "golad", "buras", "nagas", "revos", "refir", "kamil"},
		[6] = {"rethul", "rakkan", "rakkas", "tichar", "mannor", "archim", "azgala", "karkun", "revola", "mishun", "arakal", "kazile", "thorje"},
		[7] = {"belaros", "tiriosh", "faramos", "danashj", "amanare", "faralos", "kieldaz", "karaman", "gulamir", "toralar", "rethule", "zennshi", "amanare"},
		[8] = {"maladath", "kirasath", "romathis", "theramas", "azrathud", "mordanas", "amanalar", "ashjraka", "azgalada", "rukadare", "sorankar", "enkilzar", "belankar"},
		[9] = {"naztheros", "zilthuras", "kanrethad", "melarorah", "arakalada", "soranaman", "nagasraka", "teamanare"},
		[10] = {"matheredor", "ticharamir", "pathrebosh", "benthadoom", "amanemodas", "enkilgular", "burasadare", "melarnagas", "zennrakkan", "ashjrethul", "kamilgolad"},
		[11] = {"zekulrakkas", "archimtiros", "mannorgulan", "mishunadare", "ashjrakamas"},
		[12] = {"zennshinagas"},
		["hasRunes"] = false,
	},


	--NPC-based languages

	["Demonic"] = { -- languageID 8
		[1] = {"a", "e", "i", "o", "u", "y", "g", "x"},
		[2] = {"il", "no", "az", "te", "ur", "za", "ze", "re", "ul", "me", "xi"},
		[3] = {"tor", "gul", "lok", "asj", "kar", "lek", "daz", "maz", "ril", "ruk", "laz", "shi", "zar"},
		[4] = {"ashj", "alar", "orah", "amir", "aman", "ante", "kiel", "maez", "maev", "veni", "raka", "zila", "zenn", "parn", "rikk"},
		[5] = {"melar", "rakir", "tiros", "modas", "belan", "zekul", "soran", "gular", "enkil", "adare", "golad", "buras", "nagas", "revos", "refir", "kamil"},
		[6] = {"rethul", "rakkan", "rakkas", "tichar", "mannor", "archim", "azgala", "karkun", "revola", "mishun", "arakal", "kazile", "thorje"},
		[7] = {"belaros", "tiriosh", "faramos", "danashj", "amanare", "kieldaz", "karaman", "gulamir", "toralar", "rethule", "zennshi", "amanare"},
		[8] = {"maladath", "kirasath", "romathis", "theramas", "azrathud", "mordanas", "amanalar", "ashjraka", "azgalada", "rukadare", "sorankar", "enkilzar", "belankar"},
		[9] = {"naztheros", "zilthuras", "kanrethad", "melarorah", "arakalada", "soranaman", "nagasraka", "teamanare"},
		[10] = {"matheredor", "ticharamir", "pathrebosh", "benthadoom", "amanemodas", "enkilgular", "burasadare", "melarnagas", "zennrakkan", "ashjrethul", "kamilgolad"},
		[11] = {"zekulrakkas", "archimtiros", "mannorgulan", "mishunadare", "ashjrakamas"},
		[12] = {"zennshinagas"},
		["hasRunes"] = false,
	},

	["Titan"] = { -- languageID 9
		[1] = {"a", "e", "i", "o", "u", "y", "g", "x"},
		[2] = {"il", "no", "az", "te", "ur", "za", "ze", "re", "ul", "me", "xi"},
		[3] = {"tor", "gul", "lok", "asj", "kar", "lek", "daz", "maz", "ril", "ruk", "laz", "shi", "zar"},
		[4] = {"ashj", "alar", "orah", "amir", "aman", "ante", "kiel", "maez", "maev", "veni", "raka", "zila", "zenn", "parn", "rikk"},
		[5] = {"melar", "rakir", "tiros", "modas", "belan", "zekul", "soran", "gular", "enkil", "adare", "golad", "buras", "nagas", "revos", "refir", "kamil"},
		[6] = {"rethul", "rakkan", "rakkas", "tichar", "mannor", "archim", "azgala", "karkun", "revola", "mishun", "arakal", "kazile", "thorje"},
		[7] = {"belaros", "tiriosh", "faramos", "danashj", "amanare", "faralos", "kieldaz", "karaman", "gulamir", "toralar", "rethule", "zennshi", "amanare"},
		[8] = {"maladath", "kirasath", "romathis", "theramas", "azrathud", "mordanas", "amanalar", "ashjraka", "azgalada", "rukadare", "sorankar", "enkilzar", "belankar"},
		[9] = {"naztheros", "zilthuras", "kanrethad", "melarorah", "arakalada", "soranaman", "nagasraka", "teamanare"},
		[10] = {"matheredor", "ticharamir", "pathrebosh", "benthadoom", "amanemodas", "enkilgular", "burasadare", "melarnagas", "zennrakkan", "kamilgolad", "ashjrethul"},
		[11] = {"ashjrakamas", "mishunadare", "mannorgulan", "archimtiros", "zekulrakkas"},
		[12] = {"zennshinagas"},
		["hasRunes"] = false,
	},

	["Kalimag"] = { -- languageID 12
		[1] = {"a", "o", "k", "t", "g", "u"},
		[2] = {"ko", "ta", "gi", "ka", "tu", "os", "ma", "ra"},
		[3] = {"fel", "rok", "kir", "dor", "von", "nuk", "tor", "kan", "tas", "gun", "dra", "sto"},
		[4] = {"brom", "kras", "toro", "drae", "krin", "zoln", "fmer", "guto", "reth", "shin", "tols", "mahn"},
		[5] = {"bromo", "krast", "torin", "draek", "kranu", "zoern", "fmerk", "gatin", "roath", "shone", "talsa", "fraht"},
		[6] = {"korsul", "dratir", "drinor", "tadrom"},
		[7] = {"ben'nig", "ter'ran", "for'kin", "suz'ahn", "fel'tes", "toka'an", "telsrah", "dorvrem", "koaresh", "fiilrok", "chokgan", "fanroke"},
		[8] = {"kel'shae", "dak'kaun", "tchor'ah", "zela'von", "kis'tean", "ven'tiro", "taegoson", "kilagrin", "aasrugel"},
		[9] = {"gi'frazsh", "roc'grare", "quin'mahk", "ties'alla", "shodru'ga", "os'retiak", "desh'noka", "rohh'krah", "krast'ven", "draemierr", "mastrosum"},
		[10] = {"gi'azol'em", "nuk'tra'te", "zoln'nakaz", "gatin'roth", "ahn'torunt", "thukad'aaz", "gesh'throm", "brud'remek"},
		[11] = {"mok'tavaler", "tae'gel'kir", "dor'dra'tor", "aer'rohgmar", "torrath'unt", "ignan'kitch", "caus'tearic", "borg'helmak", "huut'vactah", "jolpat'krim", "tzench'drah", "kraus'ghosa", "dalgo'nizha", "korsukgrare"},
		[12] = {"moth'keretch", "vendo're'mik", "thloy'martok", "danal'korang", "sunep'kosach"},
		[13] = {"golgo'nishver", "kawee'fe'more", "tagha'senchal", "peng'yaas'ahn", "nash'lokan'ar", "derr'moran'ki", "moor'tosav'ak", "kis'an'tadrom", "bach'usiv'hal"},
		["hasRunes"] = false,
	},

	["Shath'Yar"] = { -- languageID 178
		[1] = {"i"},
		[2] = {"ez", "ga", "ky", "ma", "ni", "og", "za", "zz"},
		[3] = {"gag", "hoq", "lal", "maq", "nuq", "oou", "qam", "shn", "vaz", "vra", "yrr", "zuq"},
		[4] = {"agth", "amun", "arwi", "fssh", "ifis", "kyth", "nuul", "ongg", "puul", "qwaz", "qwor", "ryiu", "shfk", "thoq", "uull", "vwah", "vwyq", "w'oq", "wgah", "ywaq", "zaix", "zzof"},
		[5] = {"ag'rr", "agthu", "ak'uq", "anagg", "bo'al", "fhssh", "h'iwn", "hnakf", "huqth", "iilth", "iiyoq", "lwhuk", "on'ma", "plahf", "shkul", "shuul", "thyzz", "uulwi", "vorzz", "w'ssh", "yyqzz"},
		[6] = {"ag'xig", "al'tha", "an'qov", "an'zig", "bormaz", "c'toth", "far'al", "h'thon", "halahs", "iggksh", "ka'kar", "kaaxth", "marwol", "n'zoth", "qualar", "qvsakf", "shn'ma", "sk'tek", "skshgn", "ssaggh", "tallol", "tulall", "uhnish", "uovssh", "vormos", "yawifk", "yoq'al", "yu'gaz"},
		[7] = {"an'shel", "awtgssh", "guu'lal", "guulphg", "iiqaath", "kssh'ga", "mh'naus", "n'lyeth", "ph'magg", "qornaus", "shandai", "shg'cul", "shg'fhn", "sk'magg", "sk'yahf", "uul'gwa", "uulg'ma", "vwahuhn", "woth'gl", "yeh'glu", "yyg'far", "zyqtahg"},
		[8] = {"awtgsshu", "erh'ongg", "gul'kafh", "halsheth", "log'loth", "mar'kowa", "muoq'vsh", "phquathi", "qi'plahf", "qi'uothk", "sk'shuul", "sk'uuyat", "ta'thall", "thoth'al", "uhn'agth", "ye'tarin", "yoh'ghyl", "zuq'nish"},
		[9] = {"ag'thyzak", "ga'halahs", "lyrr'keth", "par'okoth", "phgwa'cul", "pwhn'guul", "ree'thael", "shath'yar", "shgla'yos", "shuul'wah", "sshoq'meg"},
		[10] = {"ak'agthshi", "shg'ullwaq", "sk'woth'gl"},
		[11] = {"ghawl'fwata", "naggwa'fssh", "yeq'kafhgyl"},
		["hasRunes"] = false,
	},

	["Broker"] = { -- no languageID, fanmade
		[1] = {"a", "o", "k", "t", "z", "u", "j", "x", "r", "h", "s", "q", "f", "y"},
		[2] = {"au", "ba", "by", "fe", "ko", "ku", "so", "ta", "tu", "ve", "xy", "zo", "za", "ve", "sh", "ul", "al", "da", "an", "mi", "ri", "xa", "ha", "ji", "si", "ra", "fa", "nu", "ya"},
		[3] = {"taa", "baa", "xaa", "haa", "jii", "daa", "sii", "zay", "raa", "dha", "saa", "shi", "faa", "gha", "ayn", "mii", "lam", "kaa", "qaa", "yaa", "waa", "nuu", "ara", "dal", "mox", "bic", "dul", "khe", "lla", "mba", "rim", "pyr", "qil", "sha", "til", "van", "vol", "eru", "ruu"},
		[4] = {"nari", "amir", "thaa", "alif", "daal", "jiim", "siin", "zayn", "daad", "saad", "dhaa", "miim", "kaaf", "qaaf", "waaw", "nuun", "anap", "berk", "brak", "burk", "dara", "khem", "taza", "vesh", "krut", "myza", "nagl", "naci", "phes", "prin", "resh", "saar", "vesk", "avna", "hare", "hask", "julk", "silk", "solo", "ropo", "rana", "leah", "azmi", "turu", "bone", "drom", "gosh", "hilt", "hult", "khis", "kraz", "mari", "meri", "piks", "oren", "rela", "ruca", "sahm", "ules"},
		[5] = {"feshi", "au'fe", "za-da", "mii'xy", "sadal", "fe-an", "bur-so", "dalfe", "jihaa", "vesku", "mi'ha", "na-ra", "ta'fe", "dadsa", "kraza"},
		[6] = {"al'ara", "bakuza", "taaqil", "xariya", "zaynul", "nariya", "koraan", "jilkha", "veshda", "tazaal", "haalda", "ulmiya", "brakso", "jilanu", "qil-ri", "kaa-fe", "reshtu", "veskso", "leahza", "phesri"},
		[7] = {"amo'gus", "daalshi", "faakrim", "miiraku", "shivari", "taaresk", "dromiwa", "zayn-mi", "lamvesh", "prin'xa", "daal-ko", "ami-rya", "qilriha", "al'ifar", "zayndad", "reshmii", "miirana", "daalshi", "feshika", "hultaza"},
		[8] = {"daadnari", "veshzayn", "braksolo", "hiltthaa", "burkmari", "saadmari", "krazmiim", "daalsaad", "zaynmiim", "sahmphes", "julkhesh", "kaafburk", "daalkaaf", "veshdaal", "dromsolo", "jul'kraz", "sah-mari", "vesh-daa", "krutnari"},
		[9] = {"reshtaqil", "miirakuza", "alifarana", "jil'khaaf", "baku-zaad", "naci-thaa", "vesk'soza", "oren-saad", "kaaf'nuun", "taza'anap", "nariyahar", "mi'xydaal"},
		["hasRunes"] = true,
	},

	["Cypher"] = { -- languageID 287
		[1] = {"a", "i", "u"},
		[2] = {"ba", "se", "ri", "la", "et", "ex"},
		[3] = {"han", "lee", "pho", "qua", "pax", "ars"},
		[4] = {"flen", "shah", "honh", "luce", "mare", "nova", "sint", "voce", "mens", "sala"},
		[5] = {"ha-na", "heran", "zaral", "sogno", "cuore", "magia", "omnia", "corda", "iuxta", "vitae", "umbra", "tumult", "lumen", "ordus", "honos", "ignis", "fides", "sensa"},
		[6] = {"zenren", "roshoh", "tenero", "sacris", "sonent", "noctis", "tempus", "mortis"},
		[7] = {"rasshan", "zihliha", "incanto", "sanctus", "aeterna"},
		[8] = {"dolcezza", "serenata"},
		["hasRunes"] = true,
	},

	["Sprite"] = { -- languageID 168
		[1] = {"E"},
		[2] = {"ki", "uk"},
		[3] = {"ike", "ika"},
		[4] = {"ikki", "keet"},
		[5] = {"takku"},
		[6] = {"shikku", "koshwi"},
		[7] = {"shikkun"},
		[8] = {"ishakush"},
		[9] = {"ishakusha"},
		["hasRunes"] = false,
	},

	["Nerglish"] = { -- languageID 179
		[1] = {"u", "i"},
		[2] = {"gl", "ih", "uh", "rr"},
		[3] = {"grl", "mrl", "bhr", "buh", "urr"},
		[4] = {"mrgl", "mmml", "blrg", "mrml"},
		[5] = {"grgrl", "grrrm", "lglgl", "grmlm", "mlrgl", "rmrgl"},
		[6] = {"burgle", "mrrgmm", "gurgle", "mglglg"},
		[7] = {"mrgllll", "mrglrgl"},
		[8] = {"mrglrgrl", "mrgmlrrg"},
		[9] = {"mrgmlrrlg", "rrgmlrlmr"},
		[10] = {"mrrglmrlgr", "mrglmrgrlm"},
		[11] = {"mrlgrmrglrm"},
		[12] = {"gmmmlmrmrgmg"},
		["hasRunes"] = false,
	},

	["Moonkin"] = { -- languageID 180
		[1] = {"a"},
		[2] = {"ca", "do", "pa"},
		[3] = {"caw", "coo"},
		[4] = {"chaw", "chee", "quaw", "bock"},
		[5] = {"cluck", "block"},
		[6] = {"ca-caw", "coodle", "doodle", "pa-caw"},
		[7] = {"cuh-caw"},
		[8] = {"caw-quawa"},
		[9] = {"chee-chaw"},
		[10] = {"cluck-ahhh"},
		["hasRunes"] = false,
	},

	["Furbolg"] = {
		[1] = {"a", "e", "r", "k", "u", "h", "g"},
		[2] = {"gr", "ra", "er", "ku", "kr", "ga", "re", "rr", "na", "ah", "oh", "eh", "en", "ek", "ka"},
		[3] = {"hum", "mum", "bur", "ker", "mur", "esh", "grr", "rrf", "bar", "ark", "gli", "ten", "fur", "toe", "paw", "nap", "rum", "fer", "kah", "kan", "err", "rrr", "gar", "rar", "enn", "ehk"},
		[4] = {"tumb", "snik", "rumb", "grrf", "mumb", "pelt", "burr", "norr", "tang", "furr", "bark", "fluf", "argh", "barb", "murr", "kart", "kert", "humb", "grrr", "pawr", "garr", "tenn", "arkk", "krah", "droo"},
		[5] = {"ka-en", "glimm", "thumb", "thump", "rumbr", "grrarf", "barrk", "grrrr", "krahn", "whirr", "rroar", "mo-on", "ha're", "er'rr", "ar'gh", "ba-rr", "mumbrr"},
		[6] = {"rrargh", "nrronn", "gargrr", "gro'rr", "ten-ra", "brumar", "then'a", "grothr", "whisra"},
		["hasRunes"] = true,
	},
	
};

-- Table of characters to keep as they are
local doNotTranslate = { ".", ",", "-", "¤", "0", "1", };

local dictionaries = {
	["Orcish"] = {
		["i'll protect you"] = "bin mog g'thazag cha", ["i will protect you"] = "bin mog g'thazag cha", ["me protect you"] = "bin mog g'thazag cha", ["twisted soul"] = "dae'mon", ["demon"] = "dae'mon", 
		["draenor's honor"] = "Dra'gora", ["draenor's honor"] = "Dra'gora", ["draenors honor"] = "Dra'gora", ["draenors' honor"] = "Dra'gora", ["honor of draenor"] = "Dra'gora", ["draenor's heart"] = "dranosh",
		["heart of draenor"] = "dranosh", ["draenors heart"] = "dranosh", ["draenors' heart"] = "dranosh", ["warrior's heart"] = "garrosh", ["warriors heart"] = "garrosh", ["warriors' heart"] = "garrosh", ["heart of the warrior"] = "garrosh", 
		["heart of a warrior"] = "garrosh", ["heart of warrior"] = "garrosh", ["heart"] = "osh", ["by my axe"] = "gol'kosh", ["the long knives"] = "gor'krosh", ["bowels of the giant"] = "grombolar", ["giant's bowels"] = "grombolar",
		["giants bowels"] = "grombolar", ["giants' bowels"] = "grombolar", ["giant's heart"] = "grommash", ["giants heart"] = "grommash", ["giants' heart"] = "grommash", ["heart of the giant"] = "grommash", 
		["heart of a giant"] = "grommash", ["heart of giant"] = "grommash",

		--literals / non-translated
		["aka'magosh"] = "aka'magosh", ["bin mog g'thazag cha"] = "bin mog g'thazag cha", ["dae'mon"] = "dae'mon", ["dra'gora"] = "dra'gora", ["dranosh"] = "dranosh", ["garrosh"] = "garrosh", ["gol'kosh"] = "gol'kosh",
		["gor'krosh"] = "gor'krosh", ["grombolar"] = "grombolar", ["grommash"] = "grommash", ["kagh"] = "kagh", ["lohn'goron"] = "lohn'goron", ["lok-narash"] = "lok-narash", ["lok-tar"] = "lok-tar", ["lok-tar ogar"] = "lok-tar ogar",
		["lok'amon"] = "lok'amon", ["lok'osh"] = "lok'osh", ["lok'tra"] = "lok'tra", ["lok'vadnod"] = "lok'vadnod", ["mag'har"] = "mag'har", ["mak'gora"] = "mak'gora", ["mak'rogahn"] = "mak'rogahn", ["mok-thorin ka"] = "mok-thorin ka",
		["nagrand"] = "nagrand", ["nelghor"] = "nelghor", ["nelghor-shomash"] = "nelghor-shomash", ["no'ku kil zil'nok ha tar"] = "no'ku kil zil'nok ha tar", ["om'gora"] = "om'gora", ["oshu'gun"] = "oshu'gun", ["ur'gora"] = "ur'gora",
		["wor'gol"] = "wor'gol", ["zug-zug"] = "zug-zug", ["zug zug"] = "zug zug",
		[""] = "",
	},
	["Darnassian"] = { ["hello"] = "bingus",},
};

local languagelist = {
	["^%[Common%]"] = "[Common]",
	["^%[Darnassian%]"] = "[Darnassian]",
	["^%[Dwarven%]"] = "[Dwarven]",
	["^%[Gnomish%]"] = "[Gnomish]",
	["^%[Draenei%]"] = "[Draenei]",
	["^%[Orcish%]"] = "[Orcish]",
	["^%[Zandali%]"] = "[Zandali]",
	["^%[Taurahe%]"] = "[Taurahe]",
	["^%[Gutterspeak%]"] = "[Gutterspeak]",
	["^%[Thalassian%]"] = "[Thalassian]",
	["^%[Goblin%]"] = "[Goblin]",
	["^%[Shalassian%]"] = "[Shalassian]",
	["^%[Vulpera%]"] = "[Vulpera]",
	["^%[Pandaren%]"] = "[Pandaren]",
	--["^%[Ancient Pandaren%]"] = "[Ancient Pandaren]",
	["^%[Draconic%]"] = "[Draconic]",

	["^%[Demonic%]"] = "[Demonic]",
	["^%[Titan%]"] = "[Titan]",
	["^%[Kalimag%]"] = "[Kalimag]",
	["^%[Shath'Yar%]"] = "[Shath'Yar]",
	["^%[Broker%]"] = "[Broker]",
	["^%[Cypher%]"] = "[Cypher]",
	
	["^%[Sprite%]"] = "[Sprite]",
	["^%[Nerglish%]"] = "[Nerglish]",
	["^%[Moonkin%]"] = "[Moonkin]",
	["^%[Furbolg%]"] = "[Furbolg]",
	--["^%[Mogu%]"] = "[Mogu]",

};

local languageNoBrackets = {
	["^%[Common%]"] = "Common",
	["^%[Darnassian%]"] = "Darnassian",
	["^%[Dwarven%]"] = "Dwarven",
	["^%[Gnomish%]"] = "Gnomish",
	["^%[Draenei%]"] = "Draenei",
	["^%[Orcish%]"] = "Orcish",
	["^%[Zandali%]"] = "Zandali",
	["^%[Taurahe%]"] = "Taurahe",
	["^%[Gutterspeak%]"] = "Gutterspeak",
	["^%[Thalassian%]"] = "Thalassian",
	["^%[Goblin%]"] = "Goblin",
	["^%[Shalassian%]"] = "Shalassian",
	["^%[Vulpera%]"] = "Vulpera",
	["^%[Pandaren%]"] = "Pandaren",
	--["^%[Ancient Pandaren%]"] = "Ancient Pandaren",
	["^%[Draconic%]"] = "Draconic",

	["^%[Demonic%]"] = "Demonic",
	["^%[Titan%]"] = "Titan",
	["^%[Kalimag%]"] = "Kalimag",
	["^%[Shath'Yar%]"] = "Shath'Yar",
	["^%[Broker%]"] = "Broker",
	["^%[Cypher%]"] = "Cypher",

	["^%[Sprite%]"] = "Sprite",
	["^%[Nerglish%]"] = "Nerglish",
	["^%[Moonkin%]"] = "Moonkin",
	["^%[Furbolg%]"] = "Furbolg",
	--["^%[Mogu%]"] = "Mogu",

};


local understandLanguage = {
};

local languageBasicList = {
	"Common",
	"Darnassian",
	"Dwarven",
	"Gnomish",
	"Draenei",
	"Orcish",
	"Zandali",
	"Taurahe",
	"Gutterspeak",
	"Thalassian",
	"Goblin",
	"Shalassian",
	"Vulpera",
	"Pandaren",
	--"Ancient Pandaren",
	"Draconic",
	"Demonic",
	"Titan",
	"Kalimag",
	"Shath'Yar",
	"Broker",
	"Cypher",

	"Sprite",
	"Nerglish",
	"Moonkin",
	"Furbolg",
};

local RaceDefaults = {
	gameplay = {
		[1] = {["Common"] = true}, -- 1 human 
		[3] = {["Common"] = true, ["Dwarven"] = true}, -- 3 dwarf
		[4] = {["Common"] = true, ["Darnassian"] = true}, -- 4 night elf
		[7] = {["Common"] = true, ["Gnomish"] = true}, -- 7 gnome
		[11] = {["Common"] = true, ["Draenei"] = true}, -- 11 draenei
		[22] = {["Common"] = true}, -- 22 worgen
		[29] = {["Common"] = true, ["Thalassian"] = true}, -- 29 void elf
		[30] = {["Common"] = true, ["Draenei"] = true}, -- 30 lightforged
		[34] = {["Common"] = true, ["Dwarven"] = true}, -- 34 dark iron
		[32] = {["Common"] = true}, -- 32 kul tiran
		[37] = {["Common"] = true, ["Gnomish"] = true}, -- 37 mechagnome
		[24] = {["Pandaren"] = true}, -- 24 pandaren neutral
		[25] = {["Common"] = true, ["Pandaren"] = true}, -- 25 pandaren alliance
		[26] = {["Orcish"] = true, ["Pandaren"] = true}, -- 26 pandaren horde
		[2] = {["Orcish"] = true}, -- 2 orc
		[5] = {["Orcish"] = true, ["Gutterspeak"] = true}, -- 5 forsaken
		[6] = {["Orcish"] = true, ["Taurahe"] = true}, -- 6 tauren
		[8] = {["Orcish"] = true, ["Zandali"] = true}, -- 8 troll
		[10] = {["Orcish"] = true, ["Thalassian"] = true}, -- 10 blood elf
		[9] = {["Orcish"] = true, ["Goblin"] = true}, -- 9 goblin
		[27] = {["Orcish"] = true, ["Shalassian"] = true}, -- 27 nightborne
		[28] = {["Orcish"] = true, ["Taurahe"] = true}, -- 28 highmountain
		[36] = {["Orcish"] = true}, -- 36 mag'har
		[31] = {["Orcish"] = true, ["Zandali"] = true}, -- 31 zandalari
		[35] = {["Orcish"] = true, ["Vulpera"] = true}, -- 35 vulpera
		--dracthyrN = {"Draconic"}, -- 
		[52] = {["Common"] = true, ["Draconic"] = true}, -- 52 dracthyr alliance
		[70] = {["Orcish"] = true, ["Draconic"] = true}, -- 70 dracthyr horde
	},
	recommended = {
		[1] = {["Common"] = true}, -- 1 human
		[3] = {["Common"] = true, ["Dwarven"] = true, ["Gnomish"] = true}, -- 3 dwarf
		[4] = {["Common"] = true, ["Darnassian"] = true}, -- 4 night elf
		[7] = {["Common"] = true, ["Gnomish"] = true, ["Dwarven"] = true}, -- 7 dwarf
		[11] = {["Common"] = true, ["Draenei"] = true, ["Orcish"] = true}, -- 11 draenei
		[22] = {["Common"] = true}, -- 22 worgen
		[29] = {["Common"] = true, ["Thalassian"] = true}, -- 29 void elf
		[30] = {["Common"] = true, ["Draenei"] = true}, -- 30 lightforged
		[34] = {["Common"] = true, ["Dwarven"] = true}, -- 34 dark iron
		[32] = {["Common"] = true}, -- 32 kul tiran 
		[37] = {["Common"] = true, ["Gnomish"] = true}, -- 37 mechagnome
		[24] = {["Pandaren"] = true}, -- 24 pandaren neutral
		[25] = {["Common"] = true, ["Pandaren"] = true}, -- 25 pandaren alliance
		[26] = {["Orcish"] = true, ["Pandaren"] = true}, -- 26 pandaren horde
		[2] = {["Orcish"] = true, ["Common"] = true}, -- 2 orc
		[5] = {["Orcish"] = true, ["Gutterspeak"] = true, ["Common"] = true}, -- 5 forsaken
		[6] = {["Orcish"] = true, ["Taurahe"] = true}, -- 6 tauren
		[8] = {["Orcish"] = true, ["Zandali"] = true}, -- 8 troll
		[10] = {["Orcish"] = true, ["Thalassian"] = true, ["Common"] = true}, -- 10 blood elf
		[9] = {["Orcish"] = true, ["Goblin"] = true, ["Common"] = true}, -- 9 goblin
		[27] = {["Orcish"] = true, ["Shalassian"] = true}, -- 27 nightborne
		[28] = {["Orcish"] = true, ["Taurahe"] = true}, -- 28 highmountain
		[36] = {["Orcish"] = true}, --36 mag'har
		[31] = {["Orcish"] = true, ["Zandali"] = true}, -- 31 zandalari
		[35] = {["Orcish"] = true, ["Vulpera"] = true}, -- 35 vulpera
		--dracthyrN = {"Draconic", "Common", "Orcish"}, -- 
		[52] = {["Common"] = true, ["Draconic"] = true, ["Orcish"] = true}, -- 52 dracthyr alliance
		[70] = {["Orcish"] = true, ["Draconic"] = true, ["Common"] = true}, -- 70 dracthyr horde
	},
};


----------------------------------------
--
----------------------------------------


---------------------------------------------------------------------------------------------------------------------------------------------------------
-- GUI Buttons
---------------------------------------------------------------------------------------------------------------------------------------------------------

mainFrame.backgroundTex = mainFrame.ScrollFrame:CreateTexture()
mainFrame.backgroundTex:SetAllPoints(mainFrame.ScrollFrame)
mainFrame.backgroundTex:SetAtlas("dragonriding-talents-background")

--some test text
mainFrame.PHText1 = content1:CreateFontString()
mainFrame.PHText1:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.PHText1:SetPoint("CENTER", content1, "CENTER", 0, -500)
mainFrame.PHText1:SetText(L["Diction"])
mainFrame.PHText1:Hide()

mainFrame.PHText2 = content2:CreateFontString()
mainFrame.PHText2:SetFont("Fonts\\FRIZQT__.TTF", 20)
mainFrame.PHText2:SetPoint("TOPLEFT", content2, "TOPLEFT", 55, -25)
mainFrame.PHText2:SetText(L["Settings"])

mainFrame.PHText3 = content3:CreateFontString()
mainFrame.PHText3:SetFont("Fonts\\FRIZQT__.TTF", 20)
mainFrame.PHText3:SetPoint("TOPLEFT", content3, "TOPLEFT", 55, -25)
mainFrame.PHText3:SetText(L["Profiles"])

mainFrame.ButtonTest = CreateFrame("Button", nil, content1, "SharedGoldRedButtonSmallTemplate")
mainFrame.ButtonTest:SetPoint("CENTER", content1, "CENTER", 0,-50)
mainFrame.ButtonTest:SetSize(230,50)
mainFrame.ButtonTest:SetText(L["TogglePrefixOff"])
mainFrame.ButtonTest:SetScript("OnClick", function(self, button)
	mainFrame.TogglePrefix();
	PlaySound(857);
end);


----------------------------------------
-- content 1 - Diction
----------------------------------------

----------------------------------------
-- content 2 - Settings
----------------------------------------

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
	button1 = "Yes",
	button2 = "No",
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
	button1 = "Yes",
	button2 = "No",
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



StaticPopupDialogs["LANGUAGES_CHAR_PRESET_RECOMMENDED"] = {
	text = L["ApplyPresetConfirm"],
	button1 = "Yes",
	button2 = "No",
	OnAccept = function()
		if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
			Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage = CopyTable(RaceDefaults.recommended[select(3, UnitRace("player"))]);
			if select(3, UnitClass("player")) ==  12 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Demonic"] = true;
			end
			if select(3, UnitClass("player")) == 5 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Shath'Yar"] = true;
			end
			if select(3, UnitClass("player")) == 9 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Demonic"] = true;
			end
			if select(3, UnitClass("player")) == 4 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Gutterspeak"] = true;
			end
			if select(3, UnitClass("player")) == 7 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Kalimag"] = true;
			end
			if select(3, UnitClass("player")) == 8 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Titan"] = true;
			end
			if select(3, UnitClass("player")) == 10 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Pandaren"] = true;
			end
			if select(3, UnitClass("player")) == 13 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Draconic"] = true;
			end

		end
		Languages_DB.profiles[charKey].understandLanguage = CopyTable(RaceDefaults.recommended[select(3, UnitRace("player"))]);
		if select(3, UnitClass("player")) ==  12 then
			Languages_DB.profiles[charKey].understandLanguage["Demonic"] = true;
		end
		if select(3, UnitClass("player")) == 5 then
			Languages_DB.profiles[charKey].understandLanguage["Shath'Yar"] = true;
		end
		if select(3, UnitClass("player")) == 9 then
			Languages_DB.profiles[charKey].understandLanguage["Demonic"] = true;
		end
		if select(3, UnitClass("player")) == 4 then
			Languages_DB.profiles[charKey].understandLanguage["Gutterspeak"] = true;
		end
		if select(3, UnitClass("player")) == 7 then
			Languages_DB.profiles[charKey].understandLanguage["Kalimag"] = true;
		end
		if select(3, UnitClass("player")) == 8 then
			Languages_DB.profiles[charKey].understandLanguage["Titan"] = true;
		end
		if select(3, UnitClass("player")) == 10 then
			Languages_DB.profiles[charKey].understandLanguage["Pandaren"] = true;
		end
		if select(3, UnitClass("player")) == 13 then
			Languages_DB.profiles[charKey].understandLanguage["Draconic"] = true;
		end
		lang.checkSettings();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
};



StaticPopupDialogs["LANGUAGES_CHAR_PRESET_GAMEPLAY"] = {
	text = L["ApplyPresetConfirm"],
	button1 = "Yes",
	button2 = "No",
	OnAccept = function()
		if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
			Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage = CopyTable(RaceDefaults.gameplay[select(3, UnitRace("player"))]);
			if select(3, UnitClass("player")) ==  12 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Demonic"] = true;
			end
			if select(3, UnitClass("player")) == 5 then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage["Shath'Yar"] = true;
			end
		end
		Languages_DB.profiles[charKey].understandLanguage = CopyTable(RaceDefaults.gameplay[select(3, UnitRace("player"))]);
		if select(3, UnitClass("player")) ==  12 then
			Languages_DB.profiles[charKey].understandLanguage["Demonic"] = true;
		end
		if select(3, UnitClass("player")) == 5 then
			Languages_DB.profiles[charKey].understandLanguage["Shath'Yar"] = true;
		end
		lang.checkSettings();
	end,
	timeout = 0,
	whileDead = true,
	hideOnEscape = true,
};



mainFrame.LangList_Frame = CreateFrame("Frame", nil, content1, "BackdropTemplate")
mainFrame.LangList_Frame:SetPoint("TOP", content1, "TOP", 0, -95)
mainFrame.LangList_Frame:SetSize(300,780)
mainFrame.LangList_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.LangList_Frame:SetBackdropColor(0,0,0,.5)

mainFrame.DialectList_Frame = CreateFrame("Frame", nil, mainFrame.LangList_Frame, "BackdropTemplate")
mainFrame.DialectList_Frame:SetPoint("TOP", mainFrame.LangList_Frame, "BOTTOM", 0, -55)
mainFrame.DialectList_Frame:SetSize(300,120)
mainFrame.DialectList_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.DialectList_Frame:SetBackdropColor(0,0,0,.5)
mainFrame.DialectList_Frame:Hide()

mainFrame.Acc_Frame = CreateFrame("Frame", nil, content2, "BackdropTemplate")
mainFrame.Acc_Frame:SetPoint("TOP", content2, "TOP", 0, -75)
mainFrame.Acc_Frame:SetSize(300,170)
mainFrame.Acc_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.Acc_Frame:SetBackdropColor(0,0,0,.5)

mainFrame.header1 = content2:CreateFontString()
mainFrame.header1:SetFont("Fonts\\FRIZQT__.TTF", 11)
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
	mainFrame:tooltip_OnEnter(self, L["ResetAccSettings"]);
end);
mainFrame.resetAccSettings:SetScript("OnLeave", mainFrame.tooltip_OnLeave);


mainFrame.Char_Frame = CreateFrame("Frame", nil, mainFrame.Acc_Frame, "BackdropTemplate")
mainFrame.Char_Frame:SetPoint("TOP", mainFrame.Acc_Frame, "BOTTOM", 0, -55)
mainFrame.Char_Frame:SetSize(300,80)
mainFrame.Char_Frame:SetBackdrop(mainFrame.backdropInfo)
mainFrame.Char_Frame:SetBackdropColor(0,0,0,.5)

mainFrame.header2 = content2:CreateFontString()
mainFrame.header2:SetFont("Fonts\\FRIZQT__.TTF", 11)
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
	mainFrame:tooltip_OnEnter(self, L["ResetCharSettings"]);
end);
mainFrame.resetCharSettings:SetScript("OnLeave", mainFrame.tooltip_OnLeave);

mainFrame.glyphsCB = CreateFrame("CheckButton", nil, mainFrame.Acc_Frame, "UICheckButtonTemplate");
mainFrame.glyphsCB:SetPoint("TOPRIGHT", mainFrame.Acc_Frame, "TOPRIGHT", -15, -15);
mainFrame.glyphsCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Print(L["GlyphsOn"]);
		Languages_DB.settings.glyphs = true;
		PlaySound(856);
	else
		Print(L["GlyphsOff"]);
		Languages_DB.settings.glyphs = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.glyphsCB.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.glyphsCB.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.glyphsCB.text:SetPoint("RIGHT", mainFrame.glyphsCB, "LEFT", -5, 0)
mainFrame.glyphsCB.text:SetText(L["UseGlyphs"])
mainFrame.glyphsCB:SetScript("OnEnter", function(self)
	mainFrame:tooltip_OnEnter(self, L["UseGlyphsTT"])
end);
mainFrame.glyphsCB:SetScript("OnLeave", mainFrame.tooltip_OnLeave);

mainFrame.prefixColorPickerButton = CreateFrame("Button", nil, mainFrame.glyphsCB, "SharedButtonSmallTemplate")
mainFrame.prefixColorPickerButton:SetPoint("TOPRIGHT", mainFrame.glyphsCB, "TOPRIGHT", 0, -30)
mainFrame.prefixColorPickerButton:SetSize(110,25)
mainFrame.prefixColorPickerButton:SetText(COLOR_PICKER)
mainFrame.prefixColorPickerButton.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.prefixColorPickerButton.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.prefixColorPickerButton.text:SetPoint("RIGHT", mainFrame.prefixColorPickerButton, "LEFT", -5, 0)
mainFrame.prefixColorPickerButton.text:SetText(L["AddonPrefixColor"])
mainFrame.prefixColorPickerButton:SetScript("OnClick", function(self, button)
	mainFrame:ShowColorPickerText(Languages_DB.settings.colors.prefix.r, Languages_DB.settings.colors.prefix.g, Languages_DB.settings.colors.prefix.b, mainFrame.PrefixColor);
end);

mainFrame.speechbubCB = CreateFrame("CheckButton", nil, mainFrame.prefixColorPickerButton, "UICheckButtonTemplate");
mainFrame.speechbubCB:SetPoint("TOPRIGHT", mainFrame.prefixColorPickerButton, "TOPRIGHT", 0, -30);
mainFrame.speechbubCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Print(L["SpeechBubblesOn"]);
		Languages_DB.settings.speechBubbles = true;
		PlaySound(856);
	else
		Print(L["SpeechBubblesOff"]);
		Languages_DB.settings.speechBubbles = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.speechbubCB.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.speechbubCB.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.speechbubCB.text:SetPoint("RIGHT", mainFrame.speechbubCB, "LEFT", -5, 0)
mainFrame.speechbubCB.text:SetText(L["SpeechBubbles"])
mainFrame.speechbubCB:SetScript("OnEnter", function(self)
	mainFrame:tooltip_OnEnter(self, L["SpeechBubblesTT"])
end);
mainFrame.speechbubCB:SetScript("OnLeave", mainFrame.tooltip_OnLeave);

mainFrame.combatCB = CreateFrame("CheckButton", nil, mainFrame.speechbubCB, "UICheckButtonTemplate");
mainFrame.combatCB:SetPoint("TOPRIGHT", mainFrame.speechbubCB, "TOPRIGHT", 0, -30);
mainFrame.combatCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Print(L["CombatOptionOn"]);
		Languages_DB.settings.combat = true;
		PlaySound(856);
	else
		Print(L["CombatOptionOff"]);
		Languages_DB.settings.combat = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.combatCB.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.combatCB.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.combatCB.text:SetPoint("RIGHT", mainFrame.combatCB, "LEFT", -5, 0)
mainFrame.combatCB.text:SetText(L["CombatOption"])
mainFrame.combatCB:SetScript("OnEnter", function(self)
	mainFrame:tooltip_OnEnter(self, L["CombatOptionTT"])
end);
mainFrame.combatCB:SetScript("OnLeave", mainFrame.tooltip_OnLeave);

mainFrame.factionLangCB = CreateFrame("CheckButton", nil, mainFrame.combatCB, "UICheckButtonTemplate");
mainFrame.factionLangCB:SetPoint("TOPRIGHT", mainFrame.combatCB, "TOPRIGHT", 0, -30);
mainFrame.factionLangCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Print(L["FactionOptionOn"]);
		Languages_DB.settings.faction = true;
		PlaySound(856);
	else
		Print(L["FactionOptionOff"]);
		Languages_DB.settings.faction = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.factionLangCB.text = mainFrame.Acc_Frame:CreateFontString()
mainFrame.factionLangCB.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.factionLangCB.text:SetPoint("RIGHT", mainFrame.factionLangCB, "LEFT", -5, 0)
mainFrame.factionLangCB.text:SetText(L["FactionOption"])
mainFrame.factionLangCB:SetScript("OnEnter", function(self)
	mainFrame:tooltip_OnEnter(self, L["FactionOptionTT"])
end);
mainFrame.factionLangCB:SetScript("OnLeave", mainFrame.tooltip_OnLeave);

mainFrame.trp3ProfileCB = CreateFrame("CheckButton", nil, mainFrame.Char_Frame, "UICheckButtonTemplate");
mainFrame.trp3ProfileCB:SetPoint("TOPRIGHT", mainFrame.Char_Frame, "TOPRIGHT", -15, -15);
mainFrame.trp3ProfileCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Print(L["LinkToTotalRP3On"]);
		if C_AddOns.IsAddOnLoaded("totalRP3") == true and TRP3_API then
			Print(L["LoadingProfile"] .. ": " .. "TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName);
		else
			Print(L["LoadingProfile"] .. ": " .. charKey);
		end
		Languages_DB.profiles[charKey].TRP3 = true;
		PlaySound(856);
	else
		Print(L["LinkToTotalRP3Off"]);
		Print(L["LoadingProfile"] .. ": " .. charKey);
		Languages_DB.profiles[charKey].TRP3 = false;
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.trp3ProfileCB:Disable();
mainFrame.trp3ProfileCB.text = mainFrame.Char_Frame:CreateFontString()
mainFrame.trp3ProfileCB.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.trp3ProfileCB.text:SetPoint("RIGHT", mainFrame.trp3ProfileCB, "LEFT", -5, 0)
mainFrame.trp3ProfileCB.text:SetText(L["LinkToTotalRP3"])
mainFrame.trp3ProfileCB.text:SetTextColor(.5,.5,.5)
mainFrame.trp3ProfileCB:SetScript("OnEnter", function(self)
	mainFrame:tooltip_OnEnter(self, L["LinkToTotalRP3TT"]);
end);
mainFrame.trp3ProfileCB:SetScript("OnLeave", mainFrame.tooltip_OnLeave);


mainFrame.shapeshiftFormsCB = CreateFrame("CheckButton", nil, mainFrame.trp3ProfileCB, "UICheckButtonTemplate");
mainFrame.shapeshiftFormsCB:SetPoint("TOPRIGHT", mainFrame.trp3ProfileCB, "TOPRIGHT", 0, -30);
mainFrame.shapeshiftFormsCB:SetScript("OnClick", function(self)
	if self:GetChecked() then
		Print(L["UseAutoShapeshiftOn"]);
		if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
			Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].shapeshift = true;
		else
			Languages_DB.profiles[charKey].shapeshift = true;
		end
		PlaySound(856);
	else
		Print(L["UseAutoShapeshiftOff"]);
		if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
			Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].shapeshift = false;
		else
			Languages_DB.profiles[charKey].shapeshift = false;
		end
		PlaySound(857);
	end
	lang.checkSettings();
end);
mainFrame.shapeshiftFormsCB.text = mainFrame.Char_Frame:CreateFontString()
mainFrame.shapeshiftFormsCB.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.shapeshiftFormsCB.text:SetPoint("RIGHT", mainFrame.shapeshiftFormsCB, "LEFT", -5, 0)
mainFrame.shapeshiftFormsCB.text:SetText(L["UseAutoShapeshift"])
mainFrame.shapeshiftFormsCB:SetScript("OnEnter", function(self)
	mainFrame:tooltip_OnEnter(self, L["UseAutoShapeshiftTT"]);
end);
mainFrame.shapeshiftFormsCB:SetScript("OnLeave", mainFrame.tooltip_OnLeave);

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
	mainFrame:tooltip_OnEnter(self, L["ImportRecommendedTT"]);
end);
mainFrame.preset_recommended:SetScript("OnLeave", mainFrame.tooltip_OnLeave);

mainFrame.preset_gameplay = CreateFrame("Button", nil, content3, "SharedButtonSmallTemplate")
mainFrame.preset_gameplay:SetPoint("TOPRIGHT", mainFrame.preset_recommended, "TOPRIGHT", 0, -30)
mainFrame.preset_gameplay:SetSize(110,25)
mainFrame.preset_gameplay:SetText(L["ImportGameplay"])
mainFrame.preset_gameplay:SetScript("OnClick", function(self, button)
	StaticPopup_Show("LANGUAGES_CHAR_PRESET_GAMEPLAY");
end);
mainFrame.preset_gameplay:SetScript("OnEnter", function(self)
	mainFrame:tooltip_OnEnter(self, L["ImportGameplayTT"]);
end);
mainFrame.preset_gameplay:SetScript("OnLeave", mainFrame.tooltip_OnLeave);


----------------------------------------
--
----------------------------------------


mainFrame.ColumnLanguage = mainFrame.LangList_Frame:CreateFontString()
mainFrame.ColumnLanguage:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.ColumnLanguage:SetPoint("TOPLEFT", mainFrame.LangList_Frame, "TOPLEFT", 10, -5)
mainFrame.ColumnLanguage:SetText(L["Language"])

mainFrame.ColumnUnderstand = mainFrame.LangList_Frame:CreateFontString()
mainFrame.ColumnUnderstand:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.ColumnUnderstand:SetPoint("TOPLEFT", mainFrame.LangList_Frame, "TOPLEFT", 115, -5)
mainFrame.ColumnUnderstand:SetText(L["Understand"])


for k, v in ipairs(languageBasicList) do
	mainFrame[k] = CreateFrame("Button", nil, mainFrame.LangList_Frame, "SharedButtonSmallTemplate")
	mainFrame[k]:SetPoint("TOPLEFT", mainFrame.LangList_Frame, "TOPLEFT", 10, -30*k)
	mainFrame[k]:SetSize(110,25)
	mainFrame[k]:SetText(v)


	mainFrame[k]:SetScript("OnEnter", function(self)
		mainFrame:tooltip_OnEnter(self, L["ToggleLanguageSpokenTT"]);
	end);
	mainFrame[k]:SetScript("OnLeave", mainFrame.tooltip_OnLeave);

	if LANGUAGE_REPLACEMENTS[v]["hasRunes"] == true then
		mainFrame[k].runeIcon = CreateFrame("Frame", nil, mainFrame[k])
		mainFrame[k].runeIcon:SetPoint("LEFT", mainFrame[k], "RIGHT", 50, 0)
		mainFrame[k].runeIcon:SetSize(25,25)

		mainFrame[k].runeIconTex = mainFrame[k].runeIcon:CreateTexture()
		mainFrame[k].runeIconTex:SetAllPoints()
		mainFrame[k].runeIconTex:SetAtlas("Rune-01-light")

		mainFrame[k].runeIcon:SetScript("OnEnter", function(self)
			mainFrame:tooltip_OnEnter(self, L["ThisLangHasRunesTT"]);
		end);
		mainFrame[k].runeIcon:SetScript("OnLeave", mainFrame.tooltip_OnLeave);
	end

	mainFrame[k].BGTex = mainFrame[k]:CreateTexture()
	mainFrame[k].BGTex:SetPoint("LEFT", mainFrame[k], "LEFT", 0, 0)
	mainFrame[k].BGTex:SetSize(115*2,30)
	mainFrame[k].BGTex:SetAtlas("perks-list-active")
	mainFrame[k].BGTex:SetVertexColor(0/255,0/255,0/255,150/255);

	mainFrame[k].HLTex = mainFrame[k]:CreateTexture()
	mainFrame[k].HLTex:SetPoint("CENTER", mainFrame[k], "CENTER", 0, 0)
	mainFrame[k].HLTex:SetSize(115,30)
	mainFrame[k].HLTex:SetAtlas("UI-Frame-Dragonflight-Portrait")
	mainFrame[k].HLTex:Hide()

	mainFrame[k]:SetScript("OnClick", function(self, button)
		currentLanguage.lang = v;
		preserveLanguage.lang = v;
		Print(L["SettingLanguageTo"] .. " " .. currentLanguage.lang);
		for k, v in ipairs(languageBasicList) do
			mainFrame[k].HLTex:Hide();
			mainFrame[k].BGTex:SetVertexColor(0/255,0/255,0/255,150/255);
		end
		mainFrame[k].HLTex:Show();
		mainFrame[k].BGTex:SetVertexColor(255/255,255/255,255/255,255/255);
		mainFrame.prefix = false;
		mainFrame.TogglePrefix();
		PlaySound(857);
	end);

	mainFrame[k].CB = CreateFrame("CheckButton", nil, mainFrame.LangList_Frame, "UICheckButtonTemplate");
	mainFrame[k].CB:SetPoint("LEFT", mainFrame[k], "RIGHT", 5, 0);

	mainFrame[k].CB:SetScript("OnClick", function(self)
		if self:GetChecked() then
			understandLanguage[v] = true;
			Print(L["EnableUnderstand"] .. " " .. v);
			if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage[v] = true;
			else
				Languages_DB.profiles[charKey].understandLanguage[v] = true;
			end
			PlaySound(856);
		else
			understandLanguage[v] = false;
			Print(L["DisableUnderstand"] .. " " .. v);
			if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
				Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage[v] = false;
			else
				Languages_DB.profiles[charKey].understandLanguage[v] = false;
			end
			PlaySound(857);
		end
		lang.checkSettings();
	end);



	mainFrame[k].CB:SetScript("OnEnter", function(self)
		mainFrame:tooltip_OnEnter(self, L["ToggleLanguageLearnedTT"]);
	end);
	mainFrame[k].CB:SetScript("OnLeave", mainFrame.tooltip_OnLeave);
end

mainFrame.Dialect = mainFrame.DialectList_Frame:CreateFontString()
mainFrame.Dialect:SetFont("Fonts\\FRIZQT__.TTF", 11)
mainFrame.Dialect:SetPoint("TOPLEFT", mainFrame.DialectList_Frame, "TOPLEFT", 10, -5)
mainFrame.Dialect:SetText(L["Dialect"])

mainFrame.dialectOption1 = CreateFrame("Button", nil, mainFrame.DialectList_Frame, "SharedButtonSmallTemplate")
mainFrame.dialectOption1:SetPoint("TOPLEFT", mainFrame.DialectList_Frame, "TOPLEFT", 10, -30*1)
mainFrame.dialectOption1:SetSize(110,25)
mainFrame.dialectOption1:SetText(L["Dwarvish"])

mainFrame.dialectOption1:SetScript("OnClick", function(self, button)
	Print(L["SettingDialectTo"] .. " " .. L["Dwarvish"]);
end);
mainFrame.dialectOption1:Disable()


mainFrame.dialectOption2 = CreateFrame("Button", nil, mainFrame.DialectList_Frame, "SharedButtonSmallTemplate")
mainFrame.dialectOption2:SetPoint("TOPLEFT", mainFrame.DialectList_Frame, "TOPLEFT", 10, -30*2)
mainFrame.dialectOption2:SetSize(110,25)
mainFrame.dialectOption2:SetText(L["Draenic"])

mainFrame.dialectOption2:SetScript("OnClick", function(self, button)
	Print(L["SettingDialectTo"] .. " " .. L["Draenic"]);
end);
mainFrame.dialectOption2:Disable()


mainFrame.dialectOption3 = CreateFrame("Button", nil, mainFrame.DialectList_Frame, "SharedButtonSmallTemplate")
mainFrame.dialectOption3:SetPoint("TOPLEFT", mainFrame.DialectList_Frame, "TOPLEFT", 10, -30*3)
mainFrame.dialectOption3:SetSize(110,25)
mainFrame.dialectOption3:SetText(L["Zandali"])

mainFrame.dialectOption3:SetScript("OnClick", function(self, button)
	Print(L["SettingDialectTo"] .. " " .. L["Zandali"]);
end);
mainFrame.dialectOption3:Disable()


mainFrame.dialectOptionToggle = CreateFrame("Button", nil, mainFrame.DialectList_Frame, "SharedButtonSmallTemplate")
mainFrame.dialectOptionToggle:SetPoint("TOPLEFT", mainFrame.dialectOption1, "TOPLEFT", 170, 0)
mainFrame.dialectOptionToggle:SetSize(110,25)
mainFrame.dialectOptionToggle:SetText("Dialect: Off")

mainFrame.dialectOptionToggle:SetScript("OnClick", function(self, button)
	Print("Debug: Something about toggling Dialect here");
end);
mainFrame.dialectOptionToggle:Disable()



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
	for word, translatedWord in dictionaries[language] do
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

local function ReplaceLanguage(text, language)
	--Print(text)
	text = string.lower(text)
	local capital = 1
	local replacements = LANGUAGE_REPLACEMENTS[language];
	assert(replacements, "unsupported language")

	return string.gsub(text, "[^%s]+", function(word)
		local fontSize = select(2, ChatFrame1:GetFont())
		local hash = 5381;
		for i = 1, #word do
			hash = bit.bxor((hash * 33), string.byte(word, i, i));
		end

		local choices = replacements[#word];
		if not choices then
			-- Long words should just use the longest word-length set.
			choices = replacements[#replacements];
		end

		local Translation = choices[(hash % #choices) + 1]
		if capital == 1 then 
			Translation = Translation:gsub("^%l", string.upper); -- might be able to just tack this onto ReplaceLanguage in event filter
			capital = capital + 1;
		end

		 -- convert into letters
		if LANGUAGE_REPLACEMENTS[language]["hasRunes"] == true and Languages_DB.settings.glyphs == true then
			local bingus = ""
			local chungus = "^%[" .. language .. "%]"
			for character in string.gmatch(Translation, "([%z\1-\127\194-\244][\128-\191]*)") do
				for i, v in ipairs(thingsToHide) do
					if chungus == v then
						character = character:gsub(character, "|T" ..AddonPath .. languageNoBrackets[v] .. "\\" .. character .. ":" .. fontSize .. ":" .. "9" .. "|t" )
						-- this was the "new" method, using a sort of atlas-like texture. however the texel portion of this method proved to be horrible to performance, so individual files per letter (above) are used instead.
						-- i have tried to color this. it require putting in the values for the texel stuff. even with default values it's the same performance loss thing.
						--character = character:gsub(character, "|T" .. AddonPath .. languageNoBrackets[v] .. "_atlas.blp" .. ":" .. fontSize --[[Height]] .. ":" .. "9" --[[Width]] .. ":0:0" --[[offsetX:offsetY]] .. ":512:512" --[[textureWidth:textureHeight]]
						--.. ":" .. atlas[character].L --[[L]] .. ":" .. atlas[character].R --[[R]] .. ":" .. atlas[character].T --[[T]] .. ":" .. atlas[character].B --[[B]] .. ":"
						--.. chatTypeBingus.r * 255 .. ":" .. chatTypeBingus.g * 255 .. ":" .. chatTypeBingus.b * 255 .. ":"
						--.. "|t" );
					end
				end
				--print("debug:" .. character)
				bingus = string.join("", bingus, character);
				Translation = bingus;
			end
		end


		return Translation;
	end);
end

local function eventFilterStuff(frame, event, message, sender, ...)
	for i, v in ipairs(thingsToHide) do
		if lang.combatCheck() then
			return
		else
			if message:find(v) then
				message = message:gsub(v, "")

				local textColor = CreateColor(Languages_DB.settings.colors.prefix.r, Languages_DB.settings.colors.prefix.g, Languages_DB.settings.colors.prefix.b):GenerateHexColor()


				if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
					if Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage[languageNoBrackets[v]] == true then
						return false, "|c" .. textColor .. languagelist[v] .. "|r " .. message, sender, ...
					else
						if event == "CHAT_MSG_SAY" then
							chatTypeBingus = ChatTypeInfo["SAY"];
						elseif event == "CHAT_MSG_YELL" then
							chatTypeBingus = ChatTypeInfo["YELL"];
						end
						return false, "|c" .. textColor .. languagelist[v] .. "|r " .. ReplaceLanguage(message, languageNoBrackets[v]) .. ".", sender, ...
					end

				else
					if Languages_DB.profiles[charKey].understandLanguage[languageNoBrackets[v]] == true then
						return false, "|c" .. textColor .. languagelist[v] .. "|r " .. message, sender, ...
					else
						if event == "CHAT_MSG_SAY" then
							chatTypeBingus = ChatTypeInfo["SAY"];
						elseif event == "CHAT_MSG_YELL" then
							chatTypeBingus = ChatTypeInfo["YELL"];
						end
						return false, "|c" .. textColor .. languagelist[v] .. "|r " .. ReplaceLanguage(message, languageNoBrackets[v]) .. ".", sender, ...
					end
				end


			end
		end
	end

end


ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", eventFilterStuff)
ChatFrame_AddMessageEventFilter("CHAT_MSG_YELL", eventFilterStuff)

local function testScriptHeader()
	mainFrame.setMaxLetters()
	--_G[ACTIVE_CHAT_EDIT_BOX:GetName().."Header"]:GetText()
	--local header = _G[ACTIVE_CHAT_EDIT_BOX:GetName().."Header"]
	local editBox
	local header
	if ACTIVE_CHAT_EDIT_BOX ~= nil and currentLanguage.lang ~= "" and currentLanguage.lang ~= nil and mainFrame.prefix == true then
		if lang.combatCheck() then
			return
		else
			if lang.factionCheck() == true then
				editBox = _G[ACTIVE_CHAT_EDIT_BOX:GetName()]
				header = _G[ACTIVE_CHAT_EDIT_BOX:GetName().."Header"]
				if string.find(header:GetText(),currentLanguage.lang) then -- the header already exists
					return
				end
				if editBox:GetAttribute("chatType") == "SAY" then
					if editBox:IsShown() then
						local left, right, top, bottom = editBox:GetTextInsets(); -- top/bottom will always be 0
						header:SetText(header:GetText() .. "[" .. currentLanguage.lang .. "]");
						editBox:SetTextInsets(left+(header:GetStringWidth()/1.3), right, top, bottom);
					else
						return
					end
				end
				if editBox:GetAttribute("chatType") == "YELL" then
					if editBox:IsShown() then
						local left, right, top, bottom = editBox:GetTextInsets(); -- top/bottom will always be 0
						header:SetText(header:GetText() .. "[" .. currentLanguage.lang .. "]");
						editBox:SetTextInsets(left+(header:GetStringWidth()/1.3), right, top, bottom);
					else
						return
					end
				end
			end
		end
	end
	isFocused = false;
end

--hooksecurefunc("ChatEdit_ResetChatType", function()  isFocused = true; RunNextFrame(testScriptHeader); end)
hooksecurefunc("ChatEdit_OnEditFocusGained", function() RunNextFrame(testScriptHeader); end) -- idk
hooksecurefunc("ChatEdit_OnSpacePressed", function()  RunNextFrame(testScriptHeader); end) -- initial opening
hooksecurefunc("ChatEdit_OnTextChanged", function() RunNextFrame(testScriptHeader); end) -- every key press

mainFrame.PHTRP3Text = content3:CreateFontString()
mainFrame.PHTRP3Text:SetFont("Fonts\\FRIZQT__.TTF", 11)
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
				for k, v in ipairs(languageBasicList) do
					if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API and Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage[v] == nil then
						Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage[v] = false;
					end
					mainFrame[k].CB:SetChecked(Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage[v]);
				end
				mainFrame.shapeshiftFormsCB:SetChecked(Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].shapeshift);
			else
				mainFrame.PHTRP3Text:SetText(charKey);
				--mainFrame.PHTRP3Text:Hide();
			end

			--mainFrame.PHTRP3Text:SetText("TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName);
			mainFrame.trp3ProfileCB:Enable();
			mainFrame.trp3ProfileCB.text:SetTextColor(1,1,1);
		end
	end
end

function lang.factionCheck()
	if Languages_DB.settings.faction ~= true then
		return true
	else
		if UnitFactionGroup("player") == "Alliance" then
			if currentLanguage.lang == "Common" then
				return false
			else
				return true
			end
		elseif UnitFactionGroup("player") == "Horde" then
			if currentLanguage.lang == "Orcish" then
				return false
			else
				return true
			end
		elseif UnitFactionGroup("player") == "Neutral" then
			if currentLanguage.lang == "Pandaren" then
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
	if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
		if Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].shapeshift == true then
			lang.shapeshiftForm()
		end
	else
		if Languages_DB.profiles[charKey].shapeshift == true then
			lang.shapeshiftForm()
		end
	end
end

function lang.trp3Check()
	if C_AddOns.IsAddOnLoaded("totalRP3") == true then
		TRP3_API.RegisterCallback(TRP3_Addon, "REGISTER_DATA_UPDATED", lang.trp3ProfileName);
	end
end

function lang.checkSettings()
	mainFrame.trp3ProfileCB:SetChecked(Languages_DB.profiles[charKey].TRP3);
	mainFrame.glyphsCB:SetChecked(Languages_DB.settings.glyphs);
	mainFrame.speechbubCB:SetChecked(Languages_DB.settings.speechBubbles);
	mainFrame.combatCB:SetChecked(Languages_DB.settings.combat);
	mainFrame.factionLangCB:SetChecked(Languages_DB.settings.faction);
	mainFrame.shapeshiftFormsCB:SetChecked(Languages_DB.profiles[charKey].shapeshift);

	for k, v in ipairs(languageBasicList) do
		if Languages_DB.profiles[charKey].understandLanguage[v] == nil then
			Languages_DB.profiles[charKey].understandLanguage[v] = false;
		end
		mainFrame[k].CB:SetChecked(Languages_DB.profiles[charKey].understandLanguage[v]);
	end
	mainFrame.PHTRP3Text:SetText(charKey);
	lang.trp3ProfileName();
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
							if Languages_DB.profiles[charKey].TRP3 == true and TRP3_API then
								if Languages_DB.profiles["TRP3_" .. TRP3_API.profile.getPlayerCurrentProfile().profileName].understandLanguage[languageNoBrackets[v]] == true then
									return
								else
									SomeTranslatedText = "|c" .. textColor .. languagelist[v] .. "|r " .. ReplaceLanguage(badabingus, languageNoBrackets[v]) .. "."
									holder.String:SetText(SomeTranslatedText)
								end
							else
								if Languages_DB.profiles[charKey].understandLanguage[languageNoBrackets[v]] == true then
									return
								else
									SomeTranslatedText = "|c" .. textColor .. languagelist[v] .. "|r " .. ReplaceLanguage(badabingus, languageNoBrackets[v]) .. "."
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
lang:RegisterEvent("UNIT_AURA")

function mainFrame.init()
	for k, v in ipairs(languageBasicList) do
		mainFrame.commands[string.lower(v)] = function()
			currentLanguage.lang = v;
			preserveLanguage.lang = v;
			Print(L["SettingLanguageTo"] .. " " .. currentLanguage.lang);
			for k, v in ipairs(languageBasicList) do
				mainFrame[k].HLTex:Hide();
				mainFrame[k].BGTex:SetVertexColor(0/255,0/255,0/255,150/255);
			end
			mainFrame[k].HLTex:Show();
			mainFrame[k].BGTex:SetVertexColor(255/255,255/255,255/255,255/255);
			mainFrame.prefix = false;
			mainFrame.TogglePrefix();
		end

		_G["SLASH_" .. v .. "1"] = "/" .. v
		SlashCmdList[v] = mainFrame.commands[string.lower(v)]
	end

end

function lang.addonLoaded(self, event, arg1) -- table, event, addonName
	if event == "ADDON_LOADED" and arg1 == "Languages" then

		if Languages_DB.settings == nil then
			Languages_DB.settings = CopyTable(defaultsTableAcc);
		end

		if Languages_DB.profiles[charKey] == nil then
			Languages_DB.profiles[charKey] = CopyTable(defaultsTableChar);
		end
		lang:LoadChatBubbles()


		lang.checkSettings();
		lang.trp3Check();

		SLASH_LANG1 = "/languages"
		SLASH_LANG2 = "/language"
		SLASH_LANG3 = "/lang"
		SlashCmdList.LANG = mainFrame.HandleSlashCommands;

		mainFrame.init();
	end
	if event == "UNIT_AURA" and arg1 == "player" then
		lang.shapeshiftProfileCheck()
	end
end

lang:SetScript("OnEvent", lang.addonLoaded)