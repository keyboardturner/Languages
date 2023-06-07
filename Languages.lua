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
};


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
	},

	["Goblin"] = {
		[1] = {"z"},
		--[[
		get data here, languageID 40
		]]

	},

	["Shalassian"] = {

		[1] = {"a", "e"},
		--[[
		get data here, languageID 181
		]]
	},

	["Vulpera"] = {

		[1] = {"u", "i", "o", "y"},
		--[[
		get data here, languageID 285
		]]
	},

	["Pandaren"] = { -- this is probably being reworked entirely.

		[1] = {"om", "nom"},
	},

	
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

	["^%[Demonic%]"] = "[Demonic]",
	["^%[Titan%]"] = "[Titan]",
	["^%[Draconic%]"] = "[Draconic]",
	["^%[Kalimag%]"] = "[Kalimag]",
	["^%[Sprite%]"] = "[Sprite]",
	["^%[Shath'Yar%]"] = "[Shath'Yar]",
	["^%[Nerglish%]"] = "[Nerglish]",
	["^%[Moonkin%]"] = "[Moonkin]",
	["^%[Complex Cipher%]"] = "[Complex Cipher]",
	["^%[Basic Cipher%]"] = "[Basic Cipher]",
	["^%[Complex Cipher%]"] = "[Complex Cipher]",
	["^%[Furbolg%]"] = "[Complex Cipher]",
	["^%[Ancient Pandaren%]"] = "[Ancient Pandaren]",
	["^%[Mogu%]"] = "[Mogu]",

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

	["^%[Demonic%]"] = "Demonic",
	["^%[Titan%]"] = "Titan",
	["^%[Draconic%]"] = "Draconic",
	["^%[Kalimag%]"] = "Kalimag",
	["^%[Sprite%]"] = "Sprite",
	["^%[Shath'Yar%]"] = "Shath'Yar",
	["^%[Nerglish%]"] = "Nerglish",
	["^%[Moonkin%]"] = "Moonkin",
	["^%[Complex Cipher%]"] = "Complex Cipher",
	["^%[Basic Cipher%]"] = "Basic Cipher",
	["^%[Complex Cipher%]"] = "Complex Cipher",
	["^%[Furbolg%]"] = "Complex Cipher",
	["^%[Ancient Pandaren%]"] = "Ancient Pandaren",
	["^%[Mogu%]"] = "Mogu",

};

local AddonPath = "|TInterface/AddOns/Languages/Textures/Darnassian/"

local function ReplaceLanguage(text, language)
	print("Debug: " .. text)
	local capital = 1
	local replacements = LANGUAGE_REPLACEMENTS[language];
	assert(replacements, "unsupported language")

	return string.gsub(text, "[^%s]+", function(word)
		local hash = 5381;
		for i = 1, #word do
			hash = bit.bxor((hash * 33), string.byte(word, i, i));
		end

		local choices = replacements[#word];
		if not choices then
			-- Long words should just use the longest word-length set.
			choices = replacements[#replacements];
		end

		local Translation = replacements[#word][(hash % #choices) + 1]
		if capital == 1 then 
			Translation = Translation:gsub("^%l", string.upper) -- might be able to just tack this onto ReplaceLanguage in event filter
			capital = capital + 1
		end

		return Translation;
	end);
end

local understandLanguage = {
	Darnassian = false,
	Orcish = false,
};


ChatFrame_AddMessageEventFilter("CHAT_MSG_SAY", function(frame, event, message, sender, ...)
	for i, v in ipairs(thingsToHide) do
		--print(i) -- 6
		--print(languagelist[i]) -- nil
		--print(v) -- ^%[Orcish%]
		--print(languagelist[v]) -- [Orcish]
		--print(languageNoBrackets[v]) -- Orcish
		if message:find(v) then
			--print(message)
			message = message:gsub(v, "")


			if understandLanguage[languageNoBrackets[v]] == true then
				return false, "|cff1ce651" .. languagelist[v] .. "|r " .. message, sender, ...
			else
				local bingus = ""
				for character in string.gmatch(message, "([%z\1-\127\194-\244][\128-\191]*)") do
					--print(character)
					character = character:gsub(character, "|TInterface\\AddOns\\Languages\\Textures\\" .. languageNoBrackets[v] .. "\\" .. character .. ":15:15|t" )
					--print("debug:" .. character)
					bingus = string.join("", bingus, character)
				end
				--print(bingus)
				--message = message:gsub("%a", "|TInterface\\AddOns\\Languages\\Textures\\" .. languageNoBrackets[v] .. "\\%a:15:15|t" )
				return false, "|cff1ce651" .. languagelist[v] .. "|r " .. ReplaceLanguage(message, languageNoBrackets[v]) .. ".", sender, ...
			end

			--test
			--message = message:gsub("^%l", string.upper)
			--print(message)
			--return false, "|cff1ce651" .. languagelist[v] .. "|r " .. " *Unintelligible*", sender, ...
			--return false, "|cff1ce651" .. languagelist[v] .. "|r " .. ReplaceLanguage(message, languageNoBrackets[v]) .. ".", sender, ...
			--return false, "|cff1ce651[Darnassian]|r " .. cowboytown[string.len(message)-13], sender, ... --I want to archive this for later.
		end
	end

end)