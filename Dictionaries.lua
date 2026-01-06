local _, Lang = ...;

local L = Lang.L


local Dictionaries = {
	[L["Common"]] = {
		-- translations
		["by blood and honor we serve"] = "esarus thar no'darador", ["troll slayer"] = "trol'kalar",
		["in"] = "a'l", ["long live the king"] = "an karanir Thanagor", ["killer"] = "kalar",
		["alliance"] = "landowar", ["peaceful land of the people"] = "Lordaeron", ["lake"] = "mere",
		["may"] = "mor", ["his"] = "ok", ["orc"] = "or", ["orc killer"] = "or'kalar", ["spirit of the world"] = "spiritus mundi",
		["king"] = "thanagor", ["troll"] = "trol", ["great winged reptilian creature"] = "dragon", ["winged reptilian creature"] = "drake",
		["great, winged reptilian creature"] = "dragon",

		-- proper nouns
		["alterac"] = "Alterac", ["arathor"] = "Arathor", ["arevass"] = "Arevass", ["andorhal"] = "Andorhal",
		["azotha"] = "Azotha", ["balor"] = "Balor", ["caer darrow"] = "Caer Darrow", ["dalaran"] = "Dalaran",
		["durnholde"] = "Durnholde", ["elwynn"] = "Elwynn", ["gilneas"] = "Gilneas", ["kirin tor"] = "Kirin Tor",
		["kul tiras"] = "Kul Tiras", ["mardenholde"] = "Mardenholde", ["strahnbrad"] = "Strahnbrad", ["strom"] = "Strom",
		["strom'kar"] = "Strom'kar", ["stromgarde"] = "Stromgarde", ["theramore"] = "Theramore", ["tiragarde"] = "Tiragarde",
		["tol barad"] = "Tol Barad", ["lordaeron"] = "Lordaeron", ["lordamere"] = "Lordamere", ["darrowmere"] = "Darrowmere",
	},
	[L["Orcish"]] = {
		["i'll protect you"] = "bin mog g'thazag cha", ["i will protect you"] = "bin mog g'thazag cha", ["me protect you"] = "bin mog g'thazag cha", ["twisted soul"] = "dae'mon", ["demon"] = "dae'mon", 
		["draenor's honor"] = "Dra'gora", ["draenor's honor"] = "Dra'gora", ["draenors honor"] = "Dra'gora", ["draenors' honor"] = "Dra'gora", ["honor of draenor"] = "Dra'gora", ["draenor's heart"] = "dranosh",
		["heart of draenor"] = "dranosh", ["draenors heart"] = "dranosh", ["draenors' heart"] = "dranosh", ["warrior's heart"] = "garrosh", ["warriors heart"] = "garrosh", ["warriors' heart"] = "garrosh", ["heart of the warrior"] = "garrosh", 
		["heart of a warrior"] = "garrosh", ["heart of warrior"] = "garrosh", ["heart"] = "osh", ["by my axe"] = "gol'kosh", ["the long knives"] = "gor'krosh", ["bowels of the giant"] = "grombolar", ["giant's bowels"] = "grombolar",
		["giants bowels"] = "grombolar", ["giants' bowels"] = "grombolar", ["giant's heart"] = "grommash", ["giants heart"] = "grommash", ["giants' heart"] = "grommash", ["heart of the giant"] = "grommash", 
		["heart of a giant"] = "grommash", ["heart of giant"] = "grommash",

		-- proper nouns
		["aka'magosh"] = "aka'magosh", ["bin mog g'thazag cha"] = "bin mog g'thazag cha", ["dae'mon"] = "dae'mon", ["dra'gora"] = "dra'gora", ["dranosh"] = "dranosh", ["garrosh"] = "garrosh", ["gol'kosh"] = "gol'kosh",
		["gor'krosh"] = "gor'krosh", ["grombolar"] = "grombolar", ["grommash"] = "grommash", ["kagh"] = "kagh", ["lohn'goron"] = "lohn'goron", ["lok-narash"] = "lok-narash", ["lok-tar"] = "lok-tar", ["lok-tar ogar"] = "lok-tar ogar",
		["lok'amon"] = "lok'amon", ["lok'osh"] = "lok'osh", ["lok'tra"] = "lok'tra", ["lok'vadnod"] = "lok'vadnod", ["mag'har"] = "mag'har", ["mak'gora"] = "mak'gora", ["mak'rogahn"] = "mak'rogahn", ["mok-thorin ka"] = "mok-thorin ka",
		["nagrand"] = "nagrand", ["nelghor"] = "nelghor", ["nelghor-shomash"] = "nelghor-shomash", ["no'ku kil zil'nok ha tar"] = "no'ku kil zil'nok ha tar", ["om'gora"] = "om'gora", ["oshu'gun"] = "oshu'gun", ["ur'gora"] = "ur'gora",
		["wor'gol"] = "wor'gol", ["zug-zug"] = "zug-zug", ["zug zug"] = "zug zug",
	},
	[L["Dwarvish"]] = {
		["dragonheart"] = "draig'cyfaill", ["star bow"] = "dwyar'hun", ["trust"] = "khadgar", ["mountain of khaz"] = "Khaz Modan",
		["protector"] = "Magna",

		-- proper nouns
		["gwyarbrawden"] = "Gwyarbrawden", ["angor"] = "Angor", ["bael'dun"] = "Bael'dun", ["barak tor'ol"] = "Barak Tor'ol",
		["dun algaz"] = "Dun Algaz", ["dun baldar"] = "Dun Baldar", ["dun garok"] = "Dun Garok", ["dun mandarr"] = "Dun Mandarr",
		["dun modr"] = "Dun Modr", ["dun morogh"] = "Dun Morogh", ["gol'bolar"] = "Gol'Bolar", ["kharanos"] = "Kharanos",
		["thandol"] = "Thandol", ["thelgen"] = "Thelgen", ["thelsamar"] = "Thelsamar", ["thor modan"] = "Thor Modan",
		["uzuraugh"] = "uzuraugh", ["hizakh"] = "hizakh"
	},


	[L["Darnassian"]] = {
		["frostsoul"] = "al'anath", ["finding beauty in imperfection"] = "alara'shinu", ["venom and storm"] = "alash'anir",
		["lover's leaf"] = "alor'el", ["crown of harmony"] = "Amirdrassil", [ "papa"] = "an'da", ["father"] = "an'da", ["dad"] = "an'da",
		["crown of the snow"] = "Andrassil", ["crown of snow"] = "Andrassil", ["may your troubles be diminished"] = "ande'thoras-ethil",
		["let balance be restored"] = "andu-falah-dor", ["let my will be known"] = "anu'dorini talah", ["we face"] = "aria",
		["do it"] = "ash karath", ["prepare to fight"] = "bandu thoribas", ["the arms of the goddess"] = "Bel'ameth", ["arms of the goddess"] = "Bel'ameth",
		["from the"] = "bessae", ["oblivion"] = "denalore", ["devastation"] = "denalore", ["dwarf"] = "dwarf", ["reaver"] = "ellemayne",
		["elune be with you"] = "Elune-Adore", ["the eye of elune"] = "Elun'dris", ["eye of elune"] = "Elun'dris",
		["who goes there"] = "fandu-dath-belore", ["the last"] = "finel", ["last"] = "finel", ["shield against the shadow"] = "irana'ethil",
		["good fortune to you"] = "ishnu-alah", ["good fortune to your family"] = "ishnu-dal-dieb", ["noble blade of elune"] = "Jai'alator",
		["children of the stars"] = "Kaldorei", ["people of the stars"] = "Kaldorei", ["children of stars"] = "Kaldorei", ["people of stars"] = "Kaldorei",
		["seat of the sky"] = "Lathar'Lazal", ["seat of sky"] = "Lathar'Lazal", ["sea"] = "lura", ["mama"] = "Min'da", ["mother"] = "minn'do",
		["master of the fang"] = "Nahlen'do", ["view of unending stars"] = "Nar'valas", ["crown of the heavens"] = "Nordrassil",
		["crown of heavens"] = "Nordrassil", ["children of noble birth"] = "Quel'dorei", ["highborne"] = "Quel'dorei", ["high-borne"] = "Quel'dorei",
		["high elf"] = "Quel'dorei", ["high elves"] = "Quel'dorei", ["i anoint these cartakers of the wild"] = "Ru shallora enudoril",
		["thank you"] = "Shaha lor'ma", ["shadow render"] = "shalla'tor", ["aunt"] = "shal'nar", ["honored teacher"] = "shan'do",
		["the truth is a guiding light"] = "shanna melor'ne adala fal", ["those who remain hidden"] = "Shen'dralar", ["heavy are our hearts"] = "shu dalas na",
		["the wild home"] = "Tal'doren", ["warrior armed only with words"] = "T'lara", ["crown of the earth"] = "Teldrassil", ["crown of earth"] = "Teldrassil",
		["honored student"] = "thero'shan", ["let our enemies beware"] = "tor ilisar'thera'nal", ["broken crown"] = "vordrassil",
		["chaos"] = "xaxas", ["fury"] = "xaxas", ["deathwing"] = "xaxas", ["the glory of azshara"] = "Zin-Azshari", ["glory of azshara"] = "Zin-Azshari",

		-- shared with dialect
		["blood elf"]				= "sin'dorei",
		["blood elves"]				= "sin'dorei",
		["blood elven"]				= "sin'dorei",
		["void elf"]				= "ren'dorei",
		["void elves"]				= "ren'dorei",
		["void elven"]				= "ren'dorei",
		["high elf"]				= "quel'dorei",
		["high elves"]				= "quel'dorei",
		["high elven"]				= "quel'dorei",
		["night elf"]				= "kaldorei",
		["night elves"]				= "kaldorei",
		["night elven"]				= "kaldorei",
		["children of blood"]		= "sin'dorei",
		["children of the blood"]	= "sin'dorei",
		["children of the sun"]		= "belore'dorei",
		["children of sun"]			= "belore'dorei",
		["children of the void"]	= "ren'dorei",
		["children of void"]		= "ren'dorei",
		["children of noble birth"]	= "quel'dorei",
		["children of nobility"]	= "quel'dorei",
		["children of nobility"]	= "quel'dorei",
		["child of blood"]			= "sin'dorei",
		["child of the blood"]		= "sin'dorei",
		["child of the sun"]		= "belore'dorei",
		["child of sun"]			= "belore'dorei",
		["child of the void"]		= "ren'dorei",
		["child of void"]			= "ren'dorei",
		["child of noble birth"]	= "quel'dorei",
		["child of nobility"]		= "quel'dorei",
		["child of nobility"]		= "quel'dorei",
		["people of blood"]			= "sin'dorei",
		["people of the blood"]		= "sin'dorei",
		["people of the sun"]		= "belore'dorei",
		["people of sun"]			= "belore'dorei",
		["people of the void"]		= "ren'dorei",
		["people of void"]			= "ren'dorei",
		["people of noble birth"]	= "quel'dorei",
		["people of nobility"]		= "quel'dorei",
		["people of nobility"]		= "quel'dorei",
		["person of blood"]			= "sin'dorei",
		["person of the blood"]		= "sin'dorei",
		["person of the sun"]		= "belore'dorei",
		["person of sun"]			= "belore'dorei",
		["person of the void"]		= "ren'dorei",
		["person of void"]			= "ren'dorei",
		["person of noble birth"]	= "quel'dorei",
		["person of nobility"]		= "quel'dorei",
		["person of nobility"]		= "quel'dorei",
		["highborne"]				= "quel'dorei",
		["highbornes"]				= "quel'dorei",
		["children of the stars"]	= "kaldorei",
		["children of stars"]		= "kaldorei",
		["nightborne"]				= "shal'dorei",
		["nightbornes"]				= "shal'dorei",
		["children of shadow"]		= "shal'dorei",
		["children of the night"]	= "shal'dorei",
		["high home"]				= "Quel'Thalas",

		--untranslated phrases
		["aludala"] = "aludala", ["ana duna thera"] = "ana duna thera", ["anato retetour"] = "anato retetour", ["anu'dora"] = "anu'dora",
		["anu dorah"] = "anu dorah", ["anu dorini ash'ka"] = "anu dorini ash'ka", ["anu dunah thalore"] = "anu dunah thalore", ["iseradune banthalos"] = "iseradune banthalos",
		["anu therador mali"] = "anu therador mali", 
		["arama sh'nala fasima nemelia boranna"] = "arama sh'nala fasima nemelia boranna", ["manoria fesala maranor"] = "manoria fesala maranor", ["mal'nala fal"] = "mal'nala fal",
		["ash'al theradas"] = "ash'al theradas", ["ashbalanol"] = "ashbalanol", ["ash rohk ilisar"] = "ash rohk ilisar", ["thandae"] = "thandae",
		["ashre thoraman"] = "ashre thoraman", ["ash'thero danador"] = "ash'thero danador", ["ash'therod nethanas"] = "ash'therod nethanas",
		["bathel'daelune"] = "bathel'daelune", ["deronica"] = "deronica", ["elun'falah shalar"] = "elun'falah shalar", ["elun'orin torel"] = "elun'orin torel",
		["enae elen'relos"] = "enae elen'relos", ["en'shu falah-nah"] = "en'shu falah-nah", ["enshu-falah-nah"] = "enshu-falah-nah", ["dorini"] = "dorini",
		["enu thora'serador"] = "enu thora'serador", ["hinduli rethal"] = "hinduli rethal", ["ishnu"] = "ishnu", ["oshalan thara dormil"] = "oshalan thara dormil", ["anu'dorin"] = "anu'dorin",
		["ishnu-talah"] = "ishnu-talah", ["sael'ah"] = "sael'ah", ["shal myrinan ishnu daldorah"] = "shal myrinan ishnu daldorah",
		["shu dales-na"] = "shu dales-na", ["thandae-alah"] = "thandae-alah", ["thara dormil dorah"] = "thara dormil dorah",
		["tor falah-no dorah"] = "tor falah-no dorah", ["zin-al-elune"] = "zin-al-elune",


		--untranslated words
		["aethenar"] = "Aethenar", ["al'ameth"] = "Al'ameth", ["aldrassil"] = "Aldrassil", ["althalaxx"] = "Althalaxx", ["ama'shan"] = "Ama'shan",
		["ameth'aran"] = "Ameth'Aran", ["anora"] = "Anora", ["anu'relos"] = "Anu'relos", ["ara-hinam"] = "Ara-Hinam", ["arauknashal"] = "Arauk-Nashal",
		["arcan'dor"] = "Arcan'dor", ["arlithrien"] = "Arlithrien", ["ash'theran"] = "Ash'theran", ["astranaar"] = "Astranaar",
		["azsuna"] = "Azsuna", ["ban'ethil"] = "Ban'ethil", ["ban'thallow"] = "Ban'Thallow", ["bashal'aran"] = "Bashal'Aran",
		["belor'relos"] = "Belor'relos", ["beth'mora"] = "Beth'mora", ["biel'aran"] = "Biel'aran", ["constellas"] = "Constellas",
		["daral'nir"] = "Daral'nir", ["darnassus"] = "Darnassus", ["dolanaar"] = "Dolanaar", ["dor'danil"] = "Dor'Danil", ["eldara"] = "Eldara",
		["eldarath"] = "Eldarath", ["eldra'nath"] = "Eldra'nath", ["el'dranil"] = "El'dranil", ["eldreth"] = "Eldreth", ["eldre'thalas"] = "Eldre'Thalas",
		["eldrethar"] = "Eldretharr", ["elor'shan"] = "Elor'shan", ["elune'ara"] = "Elune'ara", ["elune'eth"] = "Elune'eth",
		["ethel rethor"] = "Ethel Rethor", ["fal'adora"] = "Fal'adora", ["falanaar"] = "Falanaar", ["falathim"] = "Falathim",
		["fal'dorei"] = "Fal'dorei", ["falfarren"] = "Falfarren", ["faronaar"] = "Faronaar", ["feralas"] = "Feralas", ["hyjal"] = "Hyjal",
		["isildien"] = "Isildien", ["izal-shurah"] = "Izal-Shurah", ["jademir"] = "Jademir", ["kal'delar"] = "Kal'delar", ["kalidar"] = "Kalidar",
		["kel'balor"] = "Kel'balor", ["kelp'thar"] = "Kelp'thar", ["kel'theril"] = "Kel'Theril", ["lar'donir"] = "Lar'donir",
		["lariss"] = "Lariss", ["lithduin"] = "Lithduin", ["llothien"] = "Llothien", ["lor'danel"] = "Lor'danel", ["loreth'aran"] = "Loreth'Aran",
		["lorlathil"] = "Lorlathil", ["lornesta"] = "Lornesta", ["mathystra"] = "Mathystra", ["mazthoril"] = "Mazthoril", ["mennar"] = "Mennar",
		["meredil"] = "Meredil", ["morlos'aran"] = "Morlos'Aran", ["mystral"] = "Mystral", ["nar'shola"] = "Nar'shola", ["nar'thalas"] = "Nar'thalas",
		["nendis"] = "Nendis", ["nor'danil"] = "Nor'Danil", ["nordressa"] = "Nordressa", ["oneiros"] = "Oneiros", ["ordil'aran"] = "Ordil'Aran",
		["quel'dormir"] = "Quel'Dormir", ["rhut'van"] = "Rhut'van", ["rut'theran"] = "Rut'theran", ["sardor"] = "Sardor", ["sar'theris"] = "Sar'theris",
		["satyrnaar"] = "Satyrnaar", ["shaladrassil"] = "Shaladrassil", ["shala'nir"] = "Shala'nir", ["shal'aran"] = "Shal'Aran",
		["shandaral"] = "Shandaral", ["solarsal"] = "Solarsal", ["suramar"] = "Suramar", ["sylvanaar"] = "Sylvanaar", ["talrendis"] = "Talrendis",
		["tel'anor"] = "Tel'anor", ["tethris aran"] = "Tethris Aran", ["thalanaar"] = "Thalanaar", ["thal'dranath"] = "Thal'dranath",
		["thas'talah"] = "Thas'talah", ["thelserai"] = "Thelserai", ["val'sharah"] = "Val'sharah", ["vashj'elan"] = "Vashj'elan",
		["vashj'ir"] = "Vashj'ir", ["zarkhenar"] = "Zarkhenar", ["zin-malor"] = "Zin-Malor", ["zoram"] = "Zoram",

	},
	[L["Draenei"]] = {

		-- Aar-don'sha, ki kahl'dos
		["in the light we triumph"] = "aar-don'sha, ki kahl'dos", ["in light we triumph"] = "aar-don'sha, ki kahl'dos", ["light we triumph"] = "aar-don'sha, ki kahl'dos",

		-- Achal hecta
		["good day"] = "achal hecta",

		-- Archenon poros
		["good fortune"] = "archenon poros",

		-- Atar va hish'ana, maat irim ita
		["beneath the eternal stars we walk together"] = "atar va hish'ana, maat irim ita", ["beneath eternal stars we walk together"] = "atar va hish'ana, maat irim ita",
		["beneath the stars we walk together"] = "atar va hish'ana, maat irim ita", ["beneath the eternal stars, we walk together"] = "atar va hish'ana, maat irim ita",
		["beneath eternal stars, we walk together"] = "atar va hish'ana, maat irim ita", ["beneath the stars, we walk together"] = "atar va hish'ana, maat irim ita",

		-- Auchindoun
		["a home for the honored dead"] = "auchindoun", ["home for the honored dead"] = "auchindoun",

		-- Dioniss aca
		["safe journey"] = "dioniss aca", ["safe travels"] = "dioniss aca",

		-- Draenei
		["exiled ones"] = "draenei", ["the exiled ones"] = "draenei", ["exiled one"] = "draenei",

		-- Draenor
		["exiles refuge"] = "draenor", ["refuge of exiles"] = "draenor",

		-- Fanlin'Deskor
		["amber skies over wondrous rock"] = "fanlin'deskor", ["amber skies"] = "fanlin'deskor",

		-- Goblin
		["parasite"] = "goblin",

		-- Krokul
		["broken"] = "krokul", ["the broken"] = "krokul",

		-- Krona ki cristorr
		["the legion will fall"] = "krona ki cristorr", ["legion will fall"] = "krona ki cristorr",

		-- Kurenai
		["redeemed"] = "kurenai",

		-- Ma-no icta!
		["double your efforts"] = "ma-no icta", ["double efforts"] = "ma-no icta",

		-- Man'ari
		["unnatural beings"] = "man'ari", ["demons"] = "man'ari", ["demon"] = "man'ari",

		-- Pheta thones gamera
		["light guide our path"] = "pheta thones gamera", ["light guide the path"] = "pheta thones gamera", ["light guide us"] = "pheta thones gamera",

		-- Pheta vi acahachi
		["light give me strength"] = "pheta vi acahachi", ["light give strength"] = "pheta vi acahachi",

		-- Sha
		["light"] = "sha",

		-- Sha'tar
		["born from light"] = "sha'tar", ["born of light"] = "sha'tar",

		-- Shattrath
		["dwelling of light"] = "shattrath", ["home of light"] = "shattrath",


		--untranslated words & phrases
		["acalah pek ecta"] = "Acalah pek ecta", ["acheon kor"] = "Acheon kor", ["arklon"] = "Arklon", ["ata'mal"] = "Ata'mal",
		["auchenai"] = "Auchenai", ["auch'naaru"] = "Auch'naaru", ["baa'ri"] = "Baa'ri", ["belaya doros"] = "Belaya doros",
		["boha'mu"] = "Boha'mu", ["chroma, heckt corta"] = "Chroma, heckt corta", ["elodor"] = "Elodor", ["embaari"] = "Embaari",
		["enkaat"] = "Enkaat", ["ere'noru"] = "Ere'Noru", ["farahlon"] = "Farahlon", ["golad, maloch, valsheva"] = "Golad, maloch, valsheva",
		["golad niton acalah"] = "Golad niton acalah", ["halaa"] = "Halaa", ["jorune"] = "Jorune", ["karabor"] = "Karabor",
		["karab'uun"] = "Karab'uun", ["kehla men samir, solay lamaa kahl"] = "Kehla men samir, solay lamaa kahl", ["krypta"] = "Krypta",
		["kuu'rat"] = "Kuu'rat", ["nalanora aca"] = "Nalanora aca", ["omenai"] = "Omenai", ["ora teramos"] = "Ora teramos",
		["orunai"] = "Orunai", ["orebor"] = "Orebor", ["pheta vi hylas"] = "Pheta vi hylas", ["pheta voros"] = "Pheta voros",
		["rangari"] = "Rangari", ["shanai ortar"] = "Shanai ortar", ["sha'naar"] = "Sha'naar", ["silmyr"] = "Silmyr", ["talador"] = "Talador",
		["telaar"] = "Telaar", ["telhamat"] = "Telhamat", ["telmor"] = "Telmor", ["telredor"] = "Telredor", ["tuurem"] = "Tuurem",
	},

	[L["Thalassian"]] = {
		-- alar'annalas
		["ranger lord"] = "alar'annalas", ["lord of rangers"] = "alar'annalas",

		-- al diel shala
		["safe travels"] = "al diel shala", ["travel safely"] = "al diel shala", ["travel safe"] = "al diel shala",
		["journey safely"] = "al diel shala", ["safe journey"] = "al diel shala", ["may your travels be safe"] = "al diel shala",

		-- ama noral'arkhana
		["saved by magic"] = "ama noral'arkhana", ["saved through magic"] = "ama noral'arkhana",
		["rescued by magic"] = "ama noral'arkhana", ["preserved by magic"] = "ama noral'arkhana", ["protected by magic"] = "ama noral'arkhana",

		-- anar'alah
		["by the light"] = "anar'alah", ["by light"] = "anar'alah", ["in the light"] = "anar'alah",
		["under the light"] = "anar'alah", ["for the light"] = "anar'alah",

		-- anar'alah belore
		["by the light of the sun"] = "anar'alah belore", ["by the suns light"] = "anar'alah belore",

		-- anaria shola
		["speak your business"] = "anaria shola", ["state your business"] = "anaria shola",
		["declare your business"] = "anaria shola", ["speak your purpose"] = "anaria shola",
		["state your purpose"] = "anaria shola",

		-- anar'endal dracon
		["by the breath of the dragon"] = "anar'endal dracon", ["by the dragons breath"] = "anar'endal dracon",
		["of the dragon"] = "dracon", ["dragon"] = "dracon", ["breath of the dragon"] = "anar'endal dracon",
		["by the dragon's breath"] = "anar'endal dracon", ["dragon's breath"] = "anar'endal dracon",
		["of the dragon"] = "dracon",

		-- ann'da
		["father"] = "ann'da", ["papa"] = "ann'da", ["pa"] = "ann'da", ["dad"] = "ann'da", ["old man"] = "ann'da",

		-- anu belore dela'na
		["the sun guides us"] = "anu belore dela'na", ["sun guides us"] = "anu belore dela'na",
		["the sun guides our path"] = "anu belore dela'na", ["guided by the sun"] = "anu belore dela'na",

		-- aranal
		["rise"] = "aranal", ["arise"] = "aranal", ["stand"] = "aranal", ["stand up"] = "aranal",
		["ascend"] = "aranal",

		-- bal'a dash, malanore
		["greetings"] = "bal'a dash", ["traveler"] = "malanore", ["well met"] = "bal'a dash",
		["hail"] = "bal'a dash", ["traveler"] = "malanore", ["wanderer"] = "malanore",
		["wayfarer"] = "malanore",

		-- ban'dinoriel
		["gatekeeper"] = "ban'dinoriel", ["guardian of the gate"] = "ban'dinoriel",
		["gate guardian"] = "ban'dinoriel", ["gateguardian"] = "ban'dinoriel", ["warden of the gate"] = "ban'dinoriel",
		["gate warden"] = "ban'dinoriel", ["gatewarden"] = "ban'dinoriel",

		-- band'or shorel'aran
		["prepare to say farewell"] = "band'or shorel'aran", ["prepare for farewell"] = "band'or shorel'aran",
		["prepare to"] = "band'or", ["prepare for"] = "band'or", ["make ready to"] = "band'or",

		-- shorel'aran
		["farewell"] = "shorel'aran", ["goodbye"] = "shorel'aran", ["prepare"] = "shorel'aran",

		-- bash'a no falor talah!
		["taste the chill of true death"] = "bash'a no falor talah", ["taste true death"] = "bash'a no falor talah",

		-- belono sil'aru, belore'dorei
		["shoulder your burdens well"] = "belono sil'aru", ["bear your burdens well"] = "belono sil'aru",
		["carry your burdens well"] = "belono sil'aru", ["endure your burdens"] = "belono sil'aru",

		-- belore
		["the sun"] = "belore", ["sun"] = "belore",  ["of the sun"] = "belore", ["sunlight"] = "belore",
		["the sunlight"] = "belore",

		-- belore'dorei
		["child of the sun"] = "belore'dorei", ["children of the sun"] = "belore'dorei", ["sunborn"] = "belore'dorei",

		-- doral ana'diel
		["how fare you"] = "doral ana'diel", ["how are you"] = "doral ana'diel", ["how do you fare"] = "doral ana'diel",
		["how goes it"] = "doral ana'diel",

		-- elor bindel felallan morin'aminor
		["sleep forever in quiet serenity"] = "elor bindel felallan morin'aminor", ["sleep in eternal serenity"] = "elor bindel felallan morin'aminor",
		["sleep in quiet serenity"] = "elor bindel felallan morin'aminor", ["sleep in eternal quiet serenity"] = "elor bindel felallan morin'aminor",
		["rest forever in quiet serenity"] = "elor bindel felallan morin'aminor", ["rest in eternal serenity"] = "elor bindel felallan morin'aminor",
		["rest in quiet serenity"] = "elor bindel felallan morin'aminor", ["rest in eternal quiet serenity"] = "elor bindel felallan morin'aminor",

		-- elu'meniel mal alann
		["may peace calm your heart"] = "elu'meniel mal alann", ["peace calm your heart"] = "elu'meniel mal alann",
		["may peace find your heart"] = "elu'meniel mal alann", ["may your heart know peace"] = "elu'meniel mal alann",

		-- felo'melorn
		["flamestrike"] = "felo'melorn", ["strike with flame"] = "felo'melorn", ["flame strike"] = "felo'melorn",

		-- kim'jael
		["little rat"] = "kim'jael", ["small rat"] = "kim'jael",

		-- medivh
		["keeper of secrets"] = "medivh", ["guardian of secrets"] = "medivh", ["holder of secrets"] = "medivh", ["master of secrets"] = "medivh",

		-- minn'da
		["mother"] = "minn'da", ["mama"] = "minn'da", ["mom"] = "minn'da", ["ma"] = "minn'da",

		-- rea
		["and"] = "rea", ["as well as"] = "rea", ["along with"] = "rea",

		-- selama ashal'anore
		["justice for our people"] = "selama ashal'anore", ["justice for the people"] = "selama ashal'anore",
		["justice for our kind"] = "selama ashal'anore", ["justice for our kin"] = "selama ashal'anore",

		-- shal'na
		["aunt"] = "shal'na", ["auntie"] = "shal'na", ["aunty"] = "shal'na",

		-- shindu fallah na
		["they are breaking through"] = "shindu fallah na", ["our enemies are breaking through"] = "shindu fallah na",
		["they're breaking through"] = "shindu fallah na", ["the enemy is breaking through"] = "shindu fallah na",
		["the enemy has broken through"] = "shindu fallah na",

		-- shindu sin'dorei
		["failing"] = "shindu", ["weak"] = "shindu",

		-- sinu a'manore
		["well met"] = "sinu a'manore",

		-- sunstrider
		["he who walks the day"] = "sunstrider",

		-- tal anu'men no sin'dorei
		["death to all who oppose the"] = "tal anu'men no", ["death to those who oppose the"] = "tal anu'men no",
		["death to those who oppose us"] = "tal anu'men no", ["death to our enemies"] = "tal anu'men no",
		["death to the enemies"] = "tal anu'men no",

		-- thas'alah
		["light of the forest"] = "thas'alah", ["forest light"] = "thas'alah", ["forestlight"] = "thas'alah", ["light of the woods"] = "thas'alah",

		-- thas'dorah
		["valor of the forest"] = "thas'dorah", ["forest valor"] = "thas'dorah", ["forestvalor"] = "thas'dorah", ["valor of the woods"] = "thas'dorah",

		-- vendel'o eranu
		["help me forget"] = "vendel'o eranu", ["help me to forget"] = "vendel'o eranu", ["make me forget"] = "vendel'o eranu", ["let me forget"] = "vendel'o eranu",

		-- shared with dialect
		["blood elf"]				= "sin'dorei",
		["blood elves"]				= "sin'dorei",
		["blood elven"]				= "sin'dorei",
		["void elf"]				= "ren'dorei",
		["void elves"]				= "ren'dorei",
		["void elven"]				= "ren'dorei",
		["high elf"]				= "quel'dorei",
		["high elves"]				= "quel'dorei",
		["high elven"]				= "quel'dorei",
		["night elf"]				= "kaldorei",
		["night elves"]				= "kaldorei",
		["night elven"]				= "kaldorei",
		["children of blood"]		= "sin'dorei",
		["children of the blood"]	= "sin'dorei",
		["children of the sun"]		= "belore'dorei",
		["children of sun"]			= "belore'dorei",
		["children of the void"]	= "ren'dorei",
		["children of void"]		= "ren'dorei",
		["children of noble birth"]	= "quel'dorei",
		["children of nobility"]	= "quel'dorei",
		["children of nobility"]	= "quel'dorei",
		["child of blood"]			= "sin'dorei",
		["child of the blood"]		= "sin'dorei",
		["child of the sun"]		= "belore'dorei",
		["child of sun"]			= "belore'dorei",
		["child of the void"]		= "ren'dorei",
		["child of void"]			= "ren'dorei",
		["child of noble birth"]	= "quel'dorei",
		["child of nobility"]		= "quel'dorei",
		["child of nobility"]		= "quel'dorei",
		["people of blood"]			= "sin'dorei",
		["people of the blood"]		= "sin'dorei",
		["people of the sun"]		= "belore'dorei",
		["people of sun"]			= "belore'dorei",
		["people of the void"]		= "ren'dorei",
		["people of void"]			= "ren'dorei",
		["people of noble birth"]	= "quel'dorei",
		["people of nobility"]		= "quel'dorei",
		["people of nobility"]		= "quel'dorei",
		["person of blood"]			= "sin'dorei",
		["person of the blood"]		= "sin'dorei",
		["person of the sun"]		= "belore'dorei",
		["person of sun"]			= "belore'dorei",
		["person of the void"]		= "ren'dorei",
		["person of void"]			= "ren'dorei",
		["person of noble birth"]	= "quel'dorei",
		["person of nobility"]		= "quel'dorei",
		["person of nobility"]		= "quel'dorei",
		["highborne"]				= "quel'dorei",
		["highbornes"]				= "quel'dorei",
		["children of the stars"]	= "kaldorei",
		["children of stars"]		= "kaldorei",
		["nightborne"]				= "shal'dorei",
		["nightbornes"]				= "shal'dorei",
		["children of shadow"]		= "shal'dorei",
		["children of the night"]	= "shal'dorei",
		["high home"]				= "Quel'Thalas",

		--untranslated words & phrases
		["agamath"] = "Agamath", ["anara'nel belore"] = "anara'nel belore", ["an'daroth"] = "An'daroth", ["andu fallah"] = "Andu fallah",
		["an'owyn"] = "An'owyn", ["an'telas"] = "An'telas", ["anar'alash denal"] = "anar'alash denal", ["anar'dalel"] = "anar'dalel",
		["anu bala belore alon"] = "anu bala belore alon", ["aranal, ledel"] = "aranal, ledel", ["archonisus"] = "Archonisus",
		["aseph-ah-balla nah"] = "aseph-ah-balla nah", ["asto're da shan're"] = "asto're da shan're", ["turus fulo il'amare"] = "turus fulo il'amare",
		["a'talah adore"] = "a'talah adore", ["isera'duna"] = "isera'duna",
		["balamore shanal"] = "balamore shanal", ["bandal"] = "bandal", ["belesa menoor"] = "belesa menoor",
		["bin dorei am'ovel"] = "bin dorei am'ovel", ["diel fin'al"] = "diel fin'al", ["diel ma'ahn"] = "diel ma'ahn", ["orindel'o"] = "orindel'o",
		["elrendar"] = "elrendar", ["endala finel endal"] = "endala finel endal", ["endirina-dor"] = "endirina-dor",
		["endo-enah"] = "endo-enah", ["endorel aluminor"] = "endorel aluminor", ["enshu-falah-nah"] = "enshu-falah-nah", ["dorini"] = "dorini",
		["falthrien"] = "Falthrien", ["fal'inrush"] = "fal'inrush", ["falithas"] = "falithas", ["fellovar"] = "fellovar",
		["felomin ashal"] = "felomin ashal", ["ishera-do"] = "ishera-do", ["lu'minellia"] = "lu'minellia", ["morn'danel"] = "morn'danel",
		["quel'danas"] = "Quel'Danas", ["quel'danil"] = "Quel'Danil", ["quel'lithien"] = "Quel'Lithien", ["rae'shalare"] = "rae'shalare",
		["rohendor"] = "rohendor", ["selama am'oronor"] = "selama am'oronor", ["selama amor'anore"] = "selama amor'anore",
		["sha'amoor ara mashal"] = "sha'amoor ara mashal", ["sha'amoor seabenal"] = "sha'amoor seabenal", ["shalandis"] = "shalandis",
		["shan'dor"] = "shan'dor", ["shan'dorah"] = "Shan'dorah", ["sin'loren"] = "Sin'loren", ["tel'thas"] = "Tel'thas",
		["thalas'din"] = "Thalas'din", ["thori'dal"] = "Thori'dal", ["varillian"] = "Varillian"
	},

	[L["Zandali"]] = {

		-- Atal'ai
		["devoted ones"] = "atal'ai", ["the devoted ones"] = "atal'ai", ["the faithful"] = "atal'ai",
		["the devoted"] = "atal'ai", ["faithful ones"] = "atal'ai",

		-- Bwon'tulak
		["death singer"] = "bwon'tulak", ["singer"] = "tulak", ["death"] = "bwon",
		["singer of death"] = "bwon'tulak", ["one who sings death"] = "bwon'tulak",

		-- Dazdooga
		["fire"] = "dazdooga", ["flame"] = "dazdooga", ["the flame"] = "dazdooga", ["the fire"] = "dazdooga",

		-- Doba quzhu ta tawbo! Metah bo chu!
		["we bring a gift for you great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we bring a gift great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we bring gifts to you great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we bring gifts great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we offer a gift to you great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we offer a gift great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we offer gifts to you great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we offer gifts great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we bring a gift for you, great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we bring a gift, great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we bring gifts to you, great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we bring gifts, great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we offer a gift to you, great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we offer a gift, great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we offer gifts to you, great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we offer gifts, great loa of death"] = "doba quzhu ta tawbo metah bo chu",

		-- E'ko
		["life energy"] = "e'ko",
		["life energy within all living things"] = "e'ko",
		["life force"] = "e'ko", ["spirit energy"] = "e'ko",
		["energy of life"] = "e'ko",

		-- Fa'da
		["father"] = "fa'da",
		["dad"] = "fa'da",
		["papa"] = "fa'da",
		["pa"] = "fa'da",

		-- Ma'da
		["mother"] = "ma'da",
		["mom"] = "ma'da",
		["mama"] = "ma'da",
		["ma"] = "ma'da",

		-- Muisek
		["avenging spirit"] = "muisek",
		["avenging spirit of the dead"] = "muisek",
		["vengeful spirit"] = "muisek",
		["spirit of vengeance"] = "muisek",
		["angry spirit"] = "muisek",

		-- Rush'kah
		["ceremonial mask"] = "rush'kah",
		["ritual mask"] = "rush'kah",
		["ceremony mask"] = "rush'kah",
		["sacred mask"] = "rush'kah",

		-- Shera Ali'kh
		["deaths hand"] = "shera ali'kh",
		["hand of death"] = "shera ali'kh",
		["death's hand"] = "shera ali'kh",

		-- Zen
		["druid"] = "zen",

		-- Zul'
		["voodoo master"] = "zul",
		["master of voodoo"] = "zul",
		["voodoo priest"] = "zul",
		["witch doctor"] = "zul",

		-- 'aka
		["daughter of"] = "'aka",
		["daughter"] = "'aka",

		-- untranslated phrases
		["amani"] = "Amani",
		["amani'shi"] = "Amani'shi",
		["atal'alarion"] = "Atal'alarion",
		["atal-mhuto"] = "Atal-Mhuto",
		["azzaga choogo zinn"] = "azzaga choogo zinn",
		["bwonsamdi"] = "Bwonsamdi",
		["chaga"] = "chaga",
		["choka'jinn"] = "choka'jinn",
		["dahazi"] = "Dahazi",
		["dazar"] = "Dazar",
		["da amani de chuka"] = "da Amani de chuka",
		["da'kala koraste"] = "da'kala koraste",
		["da'kala di'chuka horridon"] = "da'kala di'chuka horridon",
		["kalimaste"] = "kalimaste",
		["di chuka "] = "Di chuka",
		["rezan"] = "Rezan",
		["zandalar"] = "Zandalar",
		["farastu"] = "farastu",
		["gachaga"] = "gachaga",
		["gurubashi"] = "Gurubashi",
		["guzincha"] = "guzincha",
		["hakkar"] = "Hakkar",
		["ikambokem"] = "ikambokem",
		["jin'do"] = "Jin'do",
		["jin'rokh"] = "Jin'rokh",
		["jin'sora"] = "Jin'sora",
		["jin'zallah"] = "Jin'Zallah",
		["jin'zil"] = "Jin'Zil",
		["kai'jin"] = "Kai'jin",
		["kai'ju"] = "Kai'ju",
		["ma'tuba"] = "Ma'tuba",
		["mai'jin"] = "Mai'jin",
		["mueh'zala"] = "Mueh'zala",
		["nazferiti"] = "Nazferiti",
		["nek'mani"] = "Nek'mani",
		["ohgan"] = "Ohgan",
		["orik'ando"] = "Orik'ando",
		["pohkiza"] = "Pohkiza",
		["rush'kah"] = "rush'kah",
		["samedi"] = "Samedi",
		["sendulo ma'das na khu'das"] = "Sendulo ma'das na khu'das",
		["kuba zinn awe."] = "kuba zinn awe.",
		["sen'jin"] = "Sen'jin",
		["shango"] = "Shango",
		["tai'jin"] = "Tai'jin",
		["taz'dingo"] = "taz'dingo",
		["tazaga-choo"] = "Tazaga-choo",
		["taz'okun"] = "Taz'okun",
		["thresh'jin"] = "Thresh'jin",
		["ty'jin"] = "Ty'jin",
		["vol'jin"] = "Vol'jin",
		["vosh'gajin"] = "Vosh'gajin",
		["yayo'jin"] = "Yayo'jin",
		["yojamba"] = "Yojamba",
		["zagota"] = "Zagota",
		["zandalar"] = "Zandalar",
		["zanza"] = "Zanza",
		["zul'arek"] = "Zul'arek",
		["zul'brin"] = "Zul'brin",
		["zul'dare"] = "Zul'Dare",
		["zul'jin"] = "Zul'jin",
		["zul'lor"] = "Zul'Lor",
		["zul'marosh"] = "Zul'Marosh",
		["zul'serak"] = "Zul'Serak",
		["zuvembi"] = "Zuvembi",


		-- Forest troll settlement names
		["tor'watha"] = "Tor'Watha",
		["zeb'watha"] = "Zeb'Watha",
		["zul'aman"] = "Zul'Aman",

		-- Mossflayer
		["mazra'alor"] = "Mazra'Alor",
		["zul'mashar"] = "Zul'Mashar",

		-- Shadowpine
		["zeb'nowa"] = "Zeb'Nowa",
		["zeb'sora"] = "Zeb'Sora",
		["zeb'tela"] = "Zeb'Tela",

		-- Smolderthorn
		["tazz'alor"] = "Tazz'Alor",

		-- Vilebranch
		["agol'watha"] = "Agol'watha",
		["jintha'alor"] = "Jintha'Alor",
		["shaol'watha"] = "Shaol'watha",

		-- Witherbark
		["hiri'watha"] = "Hiri'watha",
		["shadra'alor"] = "Shadra'Alor",
		["zun'watha"] = "Zun'watha",

		-- Jungle troll settlement names
		-- Bloodscalp
		["bal'lal"] = "Bal'lal",
		["tkashi"] = "Tkashi",
		["zul'kunda"] = "Zul'Kunda",
		["zuuldaia"] = "Zuuldaia",

		-- Darkspear
		["malaka'jin"] = "Malaka'jin",
		["zabra'jin"] = "Zabra'jin",

		-- Skullsplitter
		["balia'mah"] = "Balia'mah",
		["ziata'jai"] = "Ziata'jai",
		["zul'mamwe"] = "Zul'Mamwe",

		-- Miscellaneous
		["aboraz"] = "Aboraz",
		["jubuwal"] = "Jubuwal",
		["kal'ai"] = "Kal'ai",
		["mizjah"] = "Mizjah",
		["zul'gurub"] = "Zul'Gurub",

		-- Zandalari settlements
		["dol'watha"] = "Dol'watha",
		["shaol'mara"] = "Shaol'mara",
		["za'tual"] = "Za'Tual",
		["zeb'ahari"] = "Zeb'ahari",
		["zeb'tula"] = "Zeb'tula",
		["zuldazar"] = "Zuldazar",

		-- Other
		["gundrak"] = "Gundrak",
		["zul'farrak"] = "Zul'Farrak",
		["zul'drak"] = "Zul'Drak"


	},

	[L["Taurahe"]] = {
		-- An'she
		["the sun"] = "an'she", ["sun"] = "an'she",

		-- Apa'ro
		["malorne"] = "apa'ro", ["the great stag"] = "apa'ro", ["the white stag"] = "apa'ro",

		-- Arikara
		["vengeance"] = "arikara", ["revenge"] = "arikara", ["retribution"] = "arikara",

		-- Echeyakee
		["whitemist"] = "echeyakee", ["white mist"] = "echeyakee", ["mist of white"] = "echeyakee",

		-- Ish-ne-alo por-ah
		["may the days ahead be guided by the elders of long ago"] = "ish-ne-alo por-ah", ["may the days ahead be guided by the elders"] = "ish-ne-alo por-ah",
		["may the elders guide the days ahead"] = "ish-ne-alo por-ah", ["may the wisdom of the elders guide you"] = "ish-ne-alo por-ah",

		-- Isha Awak
		["deep doom"] = "isha awak", ["great doom"] = "isha awak", ["terrible fate"] = "isha awak",

		-- Ishamuhale
		["speartooth"] = "ishamuhale", ["spear tooth"] = "ishamuhale", ["tooth of the spear"] = "ishamuhale",

		-- Lakota'mani
		["earthshaker"] = "lakota'mani", ["earth shaker"] = "lakota'mani", ["shaker of the earth"] = "lakota'mani",
		["one who shakes the earth"] = "lakota'mani",

		-- Lar'korwi
		["sharp claw"] = "lar'korwi", ["sharpclaw"] = "lar'korwi", ["keen claw"] = "lar'korwi", ["razor claw"] = "lar'korwi",

		-- Lo'Gosh
		["ghost wolf"] = "lo'gosh", ["ghostwolf"] = "lo'gosh", ["spirit wolf"] = "lo'gosh", ["spiritwolf"] = "lo'gosh",
		["spectral wolf"] = "lo'gosh",

		-- Mashan'she
		["the loom of the earth mother"] = "mashan'she", ["loom of the earth mother"] = "mashan'she",
		["earth mothers loom"] = "mashan'she", ["earth mother's loom"] = "mashan'she",
		["the loom of the earthmother"] = "mashan'she", ["loom of the earthmother"] = "mashan'she",
		["earthmothers loom"] = "mashan'she", ["earthmother's loom"] = "mashan'she",

		-- Mawat'aki
		["wintersoul"] = "mawat'aki", ["winter soul"] = "mawat'aki", ["soul of winter"] = "mawat'aki",
		["winter spirit"] = "mawat'aki", ["spirit of winter"] = "mawat'aki",

		-- Mu'sha
		["the moon"] = "mu'sha", ["moon"] = "mu'sha",

		-- Nechi owachi
		["hello and thank you"] = "nechi owachi", ["hello thank you"] = "nechi owachi",
		["greetings and thanks"] = "nechi owachi", ["thanks and greetings"] = "nechi owachi",

		-- Owatanka
		["bluebolt"] = "owatanka", ["blue bolt"] = "owatanka", ["bolt of blue"] = "owatanka",

		-- Shu'halo
		["the tauren"] = "shu'halo", ["tauren"] = "shu'halo",

		-- Theia-shoush ahmen
		["so it will be"] = "theia-shoush ahmen", ["so it shall be"] = "theia-shoush ahmen",
		["it will be so"] = "theia-shoush ahmen", ["thus it will be"] = "theia-shoush ahmen",

		-- Una'fe
		["refuge"] = "una'fe", ["sanctuary"] = "una'fe", ["safe haven"] = "una'fe",

		-- Washte Pawne
		["spirit biter"] = "washte pawne", ["spiritbiter"] = "washte pawne", ["spirit eater"] = "washte pawne",
		["spiriteater"] = "washte pawne", ["devourer of spirits"] = "washte pawne",

		-- Yeena'e
		["those who herald the dawn"] = "yeena'e", ["heralds of the dawn"] = "yeena'e",
		["bringers of the dawn"] = "yeena'e", ["those who bring the dawn"] = "yeena'e",


		--untranslated
		["aparaje"] = "Aparaje",
		["arra'chea"] = "Arra'chea",
		["awak'mani"] = "Awak'mani",
		["chouk'taga'loush"] = "Chouk'taga'loush",
		["eche'ro"] = "Eche'ro",
		["mazzranache"] = "Mazzranache",
		["mojache"] = "Mojache",
		["nag'grada'baash"] = "Nag'grada'baash",
		["narache"] = "Narache",
		["tahonda"] = "Tahonda",
		["taurajo"] = "Taurajo"
	},

	[L["Shalassian"]] = {
		-- Erana-dora isil
		["a thousand thanks upon you"] = "erana-dora isil", ["thousand thanks upon you"] = "erana-dora isil", ["many thanks"] = "erana-dora isil",
		["a thousand thanks"] = "erana-dora isil", ["my thanks upon you"] = "erana-dora isil",

		-- Quel'vala thonos
		["nobility through tradition"] = "quel'vala thonos", ["nobility by tradition"] = "quel'vala thonos",
		["honor through tradition"] = "quel'vala thonos", ["tradition defines nobility"] = "quel'vala thonos",

		-- Ru shanna shal'dorei / Ru-shanna shal'dorei
		["the nightborne will survive"] = "ru shanna shal'dorei", ["the shal'dorei will survive"] = "ru shanna shal'dorei",
		["the shal'dorei will endure"] = "ru shanna shal'dorei", ["the nightborne will endure"] = "ru shanna shal'dorei",

		-- Tal'ashar
		["an honor duel"] = "tal'ashar", ["honor duel"] = "tal'ashar", ["duel of honor"] = "tal'ashar",
		["formal duel"] = "tal'ashar", ["duel by honor"] = "tal'ashar",

		-- shared with dialect
		["blood elf"]				= "sin'dorei",
		["blood elves"]				= "sin'dorei",
		["blood elven"]				= "sin'dorei",
		["void elf"]				= "ren'dorei",
		["void elves"]				= "ren'dorei",
		["void elven"]				= "ren'dorei",
		["high elf"]				= "quel'dorei",
		["high elves"]				= "quel'dorei",
		["high elven"]				= "quel'dorei",
		["night elf"]				= "kaldorei",
		["night elves"]				= "kaldorei",
		["night elven"]				= "kaldorei",
		["children of blood"]		= "sin'dorei",
		["children of the blood"]	= "sin'dorei",
		["children of the sun"]		= "belore'dorei",
		["children of sun"]			= "belore'dorei",
		["children of the void"]	= "ren'dorei",
		["children of void"]		= "ren'dorei",
		["children of noble birth"]	= "quel'dorei",
		["children of nobility"]	= "quel'dorei",
		["children of nobility"]	= "quel'dorei",
		["child of blood"]			= "sin'dorei",
		["child of the blood"]		= "sin'dorei",
		["child of the sun"]		= "belore'dorei",
		["child of sun"]			= "belore'dorei",
		["child of the void"]		= "ren'dorei",
		["child of void"]			= "ren'dorei",
		["child of noble birth"]	= "quel'dorei",
		["child of nobility"]		= "quel'dorei",
		["child of nobility"]		= "quel'dorei",
		["people of blood"]			= "sin'dorei",
		["people of the blood"]		= "sin'dorei",
		["people of the sun"]		= "belore'dorei",
		["people of sun"]			= "belore'dorei",
		["people of the void"]		= "ren'dorei",
		["people of void"]			= "ren'dorei",
		["people of noble birth"]	= "quel'dorei",
		["people of nobility"]		= "quel'dorei",
		["people of nobility"]		= "quel'dorei",
		["person of blood"]			= "sin'dorei",
		["person of the blood"]		= "sin'dorei",
		["person of the sun"]		= "belore'dorei",
		["person of sun"]			= "belore'dorei",
		["person of the void"]		= "ren'dorei",
		["person of void"]			= "ren'dorei",
		["person of noble birth"]	= "quel'dorei",
		["person of nobility"]		= "quel'dorei",
		["person of nobility"]		= "quel'dorei",
		["highborne"]				= "quel'dorei",
		["highbornes"]				= "quel'dorei",
		["children of the stars"]	= "kaldorei",
		["children of stars"]		= "kaldorei",
		["nightborne"]				= "shal'dorei",
		["nightbornes"]				= "shal'dorei",
		["children of shadow"]		= "shal'dorei",
		["children of the night"]	= "shal'dorei",
		["high home"]				= "Quel'Thalas",

		--untranslated
		["anar'amenos"] = "anar'amenos",
		["an'ah"] = "an'ah",
		["an'anora"] = "an'anora",
		["an'ratha ador"] = "an'ratha ador",
		["an'ratha adore"] = "an'ratha adore",
		["an'ratha"] = "an'ratha",
		["an'tal-thandros"] = "an'tal-thandros",
		["anath'ashar"] = "anath'ashar",
		["aran'arcana"] = "aran'arcana",
		["aran'ethil"] = "aran'ethil",
		["arash-falas"] = "arash-falas",
		["ash'thoras denil"] = "ash'thoras denil",
		["e'rath omnas"] = "e'rath omnas",
		["in'alah"] = "in'alah",					-- probably "light on"
		["ishnal toreth"] = "ishnal toreth",
		["ith'el kanesh"] = "ith'el kanesh",
		["ith'nala kanesh"] = "ith'nala kanesh",
		["kal'theros maldin"] = "kal'theros maldin",
		["n'eth ana"] = "n'eth ana",
		["nar'thalas vas manari"] = "nar'thalas vas manari",
		["thala nar'valas"] = "thala nar'valas",
		["nor'bethos suramar"] = "nor'bethos Suramar",
		["rath"] = "rath",							-- probably a basic magic attack
		["rath-domaas"] = "rath-domaas",			-- rank 2 of magic attack
		["rath-anu'tanos"] = "rath-anu'tanos",		-- another magic attack
		["shal'asan torah"] = "shal'asan torah",
		["shanar daloras"] = "shanar daloras",
		["tel'vasha"] = "tel'vasha",
		["tel'velath"] = "tel'velath",
		["tenu'balah"] = "tenu'balah",
		["tor'theras falar"] = "tor'theras falar"
	},


	[L["Draconic"]] = {
		-- Abela
		["once"] = "abela", ["one time"] = "abela", ["at one time"] = "abela",

		-- Am dakana
		["for all"] = "am dakana", ["for everyone"] = "am dakana",
		["for all things"] = "am dakana", ["for all time"] = "am dakana",

		-- Belan shi
		["thank you"] = "belan shi", ["thanks"] = "belan shi", ["thanks"] = "belan shi",
		["many thanks"] = "belan shi", ["my thanks"] = "belan shi",

		-- Dargonax
		["devourer"] = "dargonax", ["consumer"] = "dargonax", ["eater"] = "dargonax",
		["the devourer"] = "dargonax",

		-- Drekazera
		["false nest"] = "drekazera", ["empty nest"] = "drekazera", ["sham nest"] = "drekazera",

		-- Lish Llrath
		["talon toss"] = "lish llrath", ["throw of the talon"] = "lish llrath", ["talon throw"] = "lish llrath",

		-- Mal
		["and"] = "mal", ["as well as"] = "mal", ["along with"] = "mal",

		-- Mel andilar borun miranol
		["your suffering shall be legendary"] = "mel andilar borun miranol", ["your suffering will be legendary"] = "mel andilar borun miranol",
		["your suffering shall be remembered"] = "mel andilar borun miranol", ["your pain will be legendary"] = "mel andilar borun miranol",

		-- Reln nu ramani ar ravelahn
		["let the will of this puppet be broken"] = "reln nu ramani ar ravelahn", ["break the will of this puppet"] = "reln nu ramani ar ravelahn",
		["shatter the will of this puppet"] = "reln nu ramani ar ravelahn", ["let this puppet's will be broken"] = "reln nu ramani ar ravelahn",
		["let this puppets will be broken"] = "reln nu ramani ar ravelahn",

		-- Rethul
		["vessel"] = "rethul", ["host"] = "rethul", ["container"] = "rethul",

		-- Thorel osh'onza
		["insolent young elf"] = "thorel osh'onza", ["insolent elf"] = "thorel osh'onza", ["arrogant elf"] = "thorel osh'onza",
		["disrespectful elf"] = "thorel osh'onza",

		--untranslated
		["aberrus"] = "Aberrus", ["akirus"] = "akirus", ["algeth'ar"] = "Algeth'ar", ["algeth'era"] = "Algeth'era", ["andoros"] = "Andoros",
		["ashjra'kamas"] = "ashjra'kamas", ["ashjre'thul"] = "ashjre'thul", ["ataraxis"] = "ataraxis", ["crul'korak"] = "crul'korak",
		["crul'shorukh"] = "crul'shorukh", ["draco'dar"] = "draco'dar", ["erethos"] = "Erethos", ["fyr'alath"] = "fyr'alath",
		["gelikyr"] = "gelikyr", ["gholak"] = "gholak", ["golad"] = "golad", ["gurthalak"] = "gurthalak", ["holth aldon shi"] = "holth aldon shi",
		["kiril"] = "kiril", ["krondus krozhu"] = "krondus krozhu", ["xahlera"] = "xahlera", ["lok'amir il romathis"] = "lok'amir il romathis",
		["lunedane"] = "Lunedane", ["karnthar"] = "Karnthar", ["kharnalex"] = "kharnalex", ["maladath"] = "maladath", ["mish'undare"] = "mish'undare",
		["nal ks'kol"] = "nal ks'kol", ["nasz'uro"] = "nasz'uro", ["neltharax"] = "neltharax", ["nelthazan"] = "nelthazan",
		["no'kaled"] = "no'kaled", ["rashon"] = "rashon", ["rathrak"] = "rathrak", ["rusza'thar"] = "rusza'thar", ["seradane"] = "Seradane",
		["szar skeleth"] = "szar skeleth", ["thaldraszus"] = "Thaldraszus", ["themios"] = "themios", ["tiriosh"] = "tiriosh",
		["ti'tahk"] = "ti'tahk", ["t'zonna"] = "t'zonna", ["vakash"] = "vakash", ["vakthros"] = "Vakthros", ["valdrakken"] = "Valdrakken",
		["vishanka"] = "vishanka", ["vis'kag"] = "vis'kag", ["zelthrak"] = "zelthrak", ["zskera"] = "Zskera"

	},

	[L["Pandaren"]] = {
		["spirit"] = "chi", ["spirit"] = "chi", ["inner spirit"] = "chi",
		["life spirit"] = "chi", ["spiritual energy"] = "chi",

		["counselor"] = "chu'shao", ["advisor"] = "chu'shao", ["guide"] = "chu'shao",

		["judge"] = "fa'shua", ["arbiter"] = "fa'shua", ["magistrate"] = "fa'shua",

		["tan-chao"] = "tan-chao",
	},

	[L["Titan"]] = {
		["storm giants"] = "aesir", ["giants of the storm"] = "aesir",
		["stormborn giants"] = "aesir",

		["land of eternal starlight"] = "Kalimdor",

		["vessel"] = "midnir", ["host"] = "midnir", ["container"] = "midnir",

		["serpent"] = "nalak",

		["earth giants"] = "vanir", ["giants of the earth"] = "vanir",
		["stone giants"] = "vanir", ["earthborn giants"] = "vanir",

		--untranslated
		["aggramar"] = "Aggramar", ["aman'thul"] = "Aman'Thul", ["argus"] = "Argus", ["azeroth"] = "Azeroth", ["echomok"] = "Echomok",
		["eonar"] = "Eonar", ["gni'kiv"] = "Gni'kiv", ["goaz"] = "Goaz", ["golganneth"] = "Golganneth", ["gorridar"] = "Gorridar",
		["khaz'goroth"] = "Khaz'goroth", ["khaz'mul"] = "Khaz'mul", ["kol-tharish"] = "Kol-tharish", ["m'thorus"] = "M'thorus",
		["norgannon"] = "Norgannon", ["revola ruk maez amir"] = "Revola ruk maez amir", ["sargeras"] = "Sargeras", ["seetheras"] = "Seetheras",
		["taesavir"] = "Taesavir", ["taeshalach"] = "Taeshalach", ["terramok"] = "Terramok", ["thraegar"] = "Thraegar", ["tsol"] = "Tsol",
		["uldaman"] = "Uldaman", ["uldaz"] = "Uldaz", ["uldir"] = "Uldir", ["uldis"] = "Uldis", ["uldorus"] = "Uldorus", ["ulduar"] = "Ulduar",
		["uldum"] = "Uldum", ["val'anyr"] = "Val'anyr",

	},

	[L["Kalimag"]] = {
		["burn"] = "reth",


		--untranslated
		["arathar"] = "arathar", ["glazfuris"] = "glazfuris", ["ko'gun"] = "ko'gun", ["rethfuras"] = "rethfuras", ["sho'ravon"] = "sho'ravon",
		["sulfuras"] = "sulfuras",
	},

	[L["Shath'Yar"]] = {

		-- WIP
		-- does not match letter count

		-- Mindflayer Kaahrj
		["there is no light after death"] = "en'othk uulg'shuul",
		--variants
		["there is no light beyond death"] = "en'othk uulg'shuul",
		["no light waits after death"] = "en'othk uulg'shuul",
		["death leads only to darkness"] = "en'othk uulg'shuul",
		["beyond death, there is no light"] = "en'othk uulg'shuul",
		["the dead find no light"] = "en'othk uulg'shuul",

		["only a place where even shadows fear to go"] = "mh'za uulwi skshgn kar",
		--variants
		["a place where even shadows dare not tread"] = "mh'za uulwi skshgn kar",
		["where shadows fear to linger"] = "mh'za uulwi skshgn kar",
		["a realm feared by the shadows themselves"] = "mh'za uulwi skshgn kar",
		["where darkness itself recoils"] = "mh'za uulwi skshgn kar",

		["you are a prisoner in your own body"] = "iilth ma paf'qi'ag sk'halahs",
		--variants
		["you are trapped within your own flesh"] = "iilth ma paf'qi'ag sk'halahs",
		["your body is your prison"] = "iilth ma paf'qi'ag sk'halahs",
		["your flesh binds you"] = "iilth ma paf'qi'ag sk'halahs",
		["you are caged in your own form"] = "iilth ma paf'qi'ag sk'halahs",

		["a servant of fear"] = "gaz skshgn",
		--variants
		["a thrall of fear"] = "gaz skshgn",
		["fear’s servant"] = "gaz skshgn",
		["you serve fear"] = "gaz skshgn",

		["you will be the first of many to glimpse the madness of n'zoth"] = "iilth qi mah'shar fhn oorql N'Zoth",
		["you will be the first of many to glimpse the madness of nzoth"] = "iilth qi mah'shar fhn oorql N'Zoth",
		--variants
		["you will be the first to behold n'zoth's madness"] = "iilth qi mah'shar fhn oorql N'Zoth",
		["you will glimpse the madness of n'zoth before all others"] = "iilth qi mah'shar fhn oorql N'Zoth",
		["you will open your eyes to n'zoth’s madness"] = "iilth qi mah'shar fhn oorql N'Zoth",
		["you will be the first to behold nzoth's madness"] = "iilth qi mah'shar fhn oorql N'Zoth",
		["you will glimpse the madness of nzoth before all others"] = "iilth qi mah'shar fhn oorql N'Zoth",
		["you will open your eyes to nzoth’s madness"] = "iilth qi mah'shar fhn oorql N'Zoth",

		["the voice of n'zoth whispers from the deeps"] = "il'zarq N'Zoth phgwa an'zig",
		["the voice of nzoth whispers from the deeps"] = "il'zarq N'Zoth phgwa an'zig",
		--variants
		["n'zoth whispers from the deep"] = "il'zarq N'Zoth phgwa an'zig",
		["the deep carries n'zoth's whispers"] = "il'zarq N'Zoth phgwa an'zig",
		["from the depths, n'zoth speaks"] = "il'zarq N'Zoth phgwa an'zig",
		["nzoth whispers from the deep"] = "il'zarq N'Zoth phgwa an'zig",
		["the deep carries nzoth's whispers"] = "il'zarq N'Zoth phgwa an'zig",
		["from the depths, nzoth speaks"] = "il'zarq N'Zoth phgwa an'zig",

		["it sings of unspeakable horrors"] = "il'zarq taag ov'kadaq",
		--variants
		["it sings of nameless horrors"] = "il'zarq taag ov'kadaq",
		["it chants of horrors beyond words"] = "il'zarq taag ov'kadaq",
		["its song tells of unutterable horrors"] = "il'zarq taag ov'kadaq",

		["in the writhing shadow of n'zoth, all light fades and dies"] = "mg'uulwi N'Zoth, eth'razzqi worg zz oou",
		["in the writhing shadow of nzoth, all light fades and dies"] = "mg'uulwi N'Zoth, eth'razzqi worg zz oou",
		--variants
		["in n'zoth's shadow, all light withers"] = "mg'uulwi N'Zoth, eth'razzqi worg zz oou",
		["all light dies beneath n'zoth’s shadow"] = "mg'uulwi N'Zoth, eth'razzqi worg zz oou",
		["n'zoth’s shadow consumes all light"] = "mg'uulwi N'Zoth, eth'razzqi worg zz oou",
		["in nzoth's shadow, all light withers"] = "mg'uulwi N'Zoth, eth'razzqi worg zz oou",
		["all light dies beneath nzoth’s shadow"] = "mg'uulwi N'Zoth, eth'razzqi worg zz oou",
		["nzoth’s shadow consumes all light"] = "mg'uulwi N'Zoth, eth'razzqi worg zz oou",

		["the will of n'zoth is made manifest"] = "N'Zoth iiyoq raz'tal'vsak",
		["the will of nzoth is made manifest"] = "N'Zoth iiyoq raz'tal'vsak",
		--variants
		["n'zoth's will is revealed"] = "N'Zoth iiyoq raz'tal'vsak",
		["the will of n'zoth takes form"] = "N'Zoth iiyoq raz'tal'vsak",
		["n'zoth’s will is realized"] = "N'Zoth iiyoq raz'tal'vsak",
		["nzoth's will is revealed"] = "N'Zoth iiyoq raz'tal'vsak",
		["the will of nzoth takes form"] = "N'Zoth iiyoq raz'tal'vsak",
		["nzoth’s will is realized"] = "N'Zoth iiyoq raz'tal'vsak",

		["it cannot be contained"] = "iiyoq nel'othk ar'afgh",
		--variants
		["it cannot be restrained"] = "iiyoq nel'othk ar'afgh",
		["it cannot be bound"] = "iiyoq nel'othk ar'afgh",
		["it cannot be held"] = "iiyoq nel'othk ar'afgh",

		["the crooked serpent with no eyes is watching from the endless sky"] = "poq'yith mazzka awan ki uhnish'philfgsh",
		--variants
		["the eyeless serpent watches from the endless sky"] = "poq'yith mazzka awan ki uhnish'philfgsh",
		["an eyeless, crooked serpent watches from above"] = "poq'yith mazzka awan ki uhnish'philfgsh",
		["the twisted serpent without eyes gazes from the infinite sky"] = "poq'yith mazzka awan ki uhnish'philfgsh",
		["from the endless heavens, the eyeless serpent watches"] = "poq'yith mazzka awan ki uhnish'philfgsh",

		["the black empire once ruled this pitiful world, and it will do so again"] = "shath'mag vwyq shu et'agthu, shath'mag sshk ye",
		--variants
		["the black empire ruled this world before, and it will rule again"] = "shath'mag vwyq shu et'agthu, shath'mag sshk ye",
		["this world once belonged to the black empire, and it shall again"] = "shath'mag vwyq shu et'agthu, shath'mag sshk ye",
		["the black empire has ruled this world before, and will reclaim it"] = "shath'mag vwyq shu et'agthu, shath'mag sshk ye",
		["the black empire’s dominion will return to this wretched world"] = "shath'mag vwyq shu et'agthu, shath'mag sshk ye",

		["we will reforge our dread citadels atop the fly-blown corpse of this kingdom"] = "ag'rr hazz ak'yel ksh ga'halahs pahg",
		--variants
		["we will rebuild our dread citadels upon the rotting corpse of this kingdom"] = "ag'rr hazz ak'yel ksh ga'halahs pahg",
		["our dread citadels will rise from the corpse of this fallen kingdom"] = "ag'rr hazz ak'yel ksh ga'halahs pahg",
		["we shall forge our citadels upon this kingdom’s decaying remains"] = "ag'rr hazz ak'yel ksh ga'halahs pahg",
		["this kingdom’s corpse will bear our dread citadels once more"] = "ag'rr hazz ak'yel ksh ga'halahs pahg",

		["your pitiful kind will know only despair and sorrow for a hundred thousand millennia to come"] = "krz'ek fhn'z agash zz maqdahl or'kaaxth'ma amqa",
		--variants
		["your wretched kind will know only despair for countless millennia"] = "krz'ek fhn'z agash zz maqdahl or'kaaxth'ma amqa",
		["your kind will suffer sorrow and despair for ages unending"] = "krz'ek fhn'z agash zz maqdahl or'kaaxth'ma amqa",
		["for endless millennia, your kind will know nothing but despair"] = "krz'ek fhn'z agash zz maqdahl or'kaaxth'ma amqa",

		["your soul will wander roads that twist in endless spirals"] = "sk'yahf qi'magg luk sshoq anagg'qen",
		--variants
		["your soul will wander endless, twisting paths"] = "sk'yahf qi'magg luk sshoq anagg'qen",
		["your spirit will drift through spirals without end"] = "sk'yahf qi'magg luk sshoq anagg'qen",
		["your soul will be lost upon roads that never straighten"] = "sk'yahf qi'magg luk sshoq anagg'qen",
		["your essence will roam infinite, coiling paths"] = "sk'yahf qi'magg luk sshoq anagg'qen",

		["i am not the first"] = "y'za noq mah",
		--variants
		["i was not the first"] = "y'za noq mah",
		["i am not the beginning"] = "y'za noq mah",

		["i am not the last"] = "y'za noq ormz",
		--variants
		["i will not be the last"] = "y'za noq ormz",
		["others will follow"] = "y'za noq ormz",
		["this will happen again"] = "y'za noq ormz",
		["i am not the end"] = "y'za noq ormz",

		["the blood of n'zoth runs through me"] = "yeh'glu N'Zoth okom hoq",
		["the blood of nzoth runs through me"] = "yeh'glu N'Zoth okom hoq",
		--variants
		["n'zoth's blood flows within me"] = "yeh'glu N'Zoth okom hoq",
		["i carry the blood of n'zoth"] = "yeh'glu N'Zoth okom hoq",
		["n'zoth flows through my veins"] = "yeh'glu N'Zoth okom hoq",
		["i am bound by the blood of n'zoth"] = "yeh'glu N'Zoth okom hoq",
		["nzoth's blood flows within me"] = "yeh'glu N'Zoth okom hoq",
		["i carry the blood of nzoth"] = "yeh'glu N'Zoth okom hoq",
		["nzoth flows through my veins"] = "yeh'glu N'Zoth okom hoq",
		["i am bound by the blood of nzoth"] = "yeh'glu N'Zoth okom hoq",

		["i cannot die"] = "y'za sythn oou",
		--variants
		["i will not die"] = "y'za sythn oou",
		["death cannot claim me"] = "y'za sythn oou",
		["i am beyond death"] = "y'za sythn oou",
		["i do not die"] = "y'za sythn oou",

		["al'ksh syq iir awan"] = "is this real or an illusion",
		--variants
		["is this real, or merely illusion"] = "al'ksh syq iir awan",
		["is this truth or illusion"] = "al'ksh syq iir awan",
		["is this reality, or a lie"] = "al'ksh syq iir awan",
		["is any of this real"] = "al'ksh syq iir awan",

		["iilth sythn aqev"] = "you are going mad",
		--variants
		["you are losing your mind"] = "iilth sythn aqev",
		["madness is taking you"] = "iilth sythn aqev",
		["your mind is breaking"] = "iilth sythn aqev",
		["you are succumbing to madness"] = "iilth sythn aqev",

		["aqev"] = "mad",
		--variants
		["insane"] = "aqev",
		["deranged"] = "aqev",
		["unhinged"] = "aqev",



		-- Yor'sahj the Unsleeping
		["o, deathwing"] = "ez, Shuul'wah",
		--variants
		["oh, deathwing"] = "ez, Shuul'wah",
		["hear us, deathwing"] = "ez, Shuul'wah",
		["we call to you, deathwing"] = "ez, Shuul'wah",

		["your faithful servant has failed you"] = "sk'woth'gl yu'gaz yog'ghyl ilfah",
		--variants
		["your devoted servant has failed you"] = "sk'woth'gl yu'gaz yog'ghyl ilfah",
		["your loyal servant has disappointed you"] = "sk'woth'gl yu'gaz yog'ghyl ilfah",
		["your servant has failed in your service"] = "sk'woth'gl yu'gaz yog'ghyl ilfah",
		["your faithful one has failed you"] = "sk'woth'gl yu'gaz yog'ghyl ilfah",

		["all praise deathwing"] = "h'iwn zaix Shuul'wah",
		--variants
		["praise deathwing"] = "h'iwn zaix Shuul'wah",
		["all hail deathwing"] = "h'iwn zaix Shuul'wah",
		["glory to deathwing"] = "h'iwn zaix Shuul'wah",
		["honor deathwing"] = "h'iwn zaix Shuul'wah",

		["the destroyer"] = "phquathi",
		--variants
		["the worldbreaker"] = "phquathi",
		["the ender of all"] = "phquathi",
		["the bringer of ruin"] = "phquathi",
		["the annihilator"] = "phquathi",

		["you will drown in the blood of the old gods"] = "ilith qi'uothk shn'ma yeh'glu Shath'Yar",
		--variants
		["you will drown in old god blood"] = "ilith qi'uothk shn'ma yeh'glu Shath'Yar",
		["the blood of the old gods will drown you"] = "ilith qi'uothk shn'ma yeh'glu Shath'Yar",
		["you will choke on the blood of the old gods"] = "ilith qi'uothk shn'ma yeh'glu Shath'Yar",
		["old god blood will swallow you"] = "ilith qi'uothk shn'ma yeh'glu Shath'Yar",

		["all of you"] = "h'iwn iilth",
		--variants
		["every one of you"] = "h'iwn iilth",
		["all of you will suffer"] = "h'iwn iilth",
		["each and every one of you"] = "h'iwn iilth",
		["none of you will escape"] = "h'iwn iilth",

		["see how we pour from the cursed earth"] = "kyth ag'xig yyg'far iiqaath ongg",
		--variants
		["witness how we rise from the cursed earth"] = "kyth ag'xig yyg'far iiqaath ongg",
		["see us spill forth from the cursed ground"] = "kyth ag'xig yyg'far iiqaath ongg",
		["behold as we pour from the blighted earth"] = "kyth ag'xig yyg'far iiqaath ongg",
		["watch us emerge from the cursed soil"] = "kyth ag'xig yyg'far iiqaath ongg",

		["your soul will know endless torment"] = "sk'yahf qi'plahf ph'magg",
		--variants
		["your soul will suffer endless torment"] = "sk'yahf qi'plahf ph'magg",
		["endless torment awaits your soul"] = "sk'yahf qi'plahf ph'magg",
		["your soul will never know peace"] = "sk'yahf qi'plahf ph'magg",
		["your soul will be tortured without end"] = "sk'yahf qi'plahf ph'magg",


		["the darkness devours all"] = "uull lwhuk h'iwn",
		--variants
		["darkness devours all things"] = "uull lwhuk h'iwn",
		["all will be consumed by darkness"] = "uull lwhuk h'iwn",
		["nothing escapes the darkness"] = "uull lwhuk h'iwn",
		["the darkness consumes everything"] = "uull lwhuk h'iwn",

		["our numbers are endless"] = "ak'agthshi ma uhnish",
		--variants
		["our numbers know no end"] = "ak'agthshi ma uhnish",
		["we are without number"] = "ak'agthshi ma uhnish",
		["we cannot be counted"] = "ak'agthshi ma uhnish",
		["our multitudes are endless"] = "ak'agthshi ma uhnish",

		["our power beyond reckoning"] = "ak'uq shg'cul vwahuhn",
		--variants
		["our power cannot be measured"] = "ak'uq shg'cul vwahuhn",
		["our power is beyond understanding"] = "ak'uq shg'cul vwahuhn",
		["our strength defies reckoning"] = "ak'uq shg'cul vwahuhn",
		["our might is immeasurable"] = "ak'uq shg'cul vwahuhn",

		["all who oppose the destroyer will die a thousand deaths"] = "h'iwn iggksh phquathi gag oou kaaxth shuul",
		--variants
		["all who defy the destroyer will die a thousand deaths"] = "h'iwn iggksh phquathi gag oou kaaxth shuul",
		["those who oppose the destroyer will suffer countless deaths"] = "h'iwn iggksh phquathi gag oou kaaxth shuul",
		["defiance of the destroyer brings a thousand deaths"] = "h'iwn iggksh phquathi gag oou kaaxth shuul",
		["any who stand against the destroyer will die again and again"] = "h'iwn iggksh phquathi gag oou kaaxth shuul",

		-- Herald Volazj / Commander Ulthok
		["gaze into the void"] = "gul'kafh an'shel",
		--variants
		["look into the void"] = "gul'kafh an'shel",
		["stare into the void"] = "gul'kafh an'shel",
		["peer into the void"] = "gul'kafh an'shel",
		["behold the void"] = "gul'kafh an'shel",

		["it is the perpetuity in which they dwell"] = "yoq'al shn ky ywaq nuul",
		--variants
		["it is the eternity in which they dwell"] = "yoq'al shn ky ywaq nuul",
		["they dwell within perpetuity"] = "yoq'al shn ky ywaq nuul",
		["it is an endless state where they abide"] = "yoq'al shn ky ywaq nuul",
		["they exist within endless perpetuity"] = "yoq'al shn ky ywaq nuul",

		["where one falls, many shall take its place"] = "iilth vwah, uhn'agth fhssh za",
		--variants
		["when one falls, many rise in its place"] = "iilth vwah, uhn'agth fhssh za",
		["for every one that falls, many replace it"] = "iilth vwah, uhn'agth fhssh za",
		["one falls, and many take its place"] = "iilth vwah, uhn'agth fhssh za",
		["they are endless—where one falls, many follow"] = "iilth vwah, uhn'agth fhssh za",


		["they who dine on lost souls know only hunger"] = "shgla'yos plahf mh'naus",
		--variants
		["those who feast on lost souls know only hunger"] = "shgla'yos plahf mh'naus",
		["they feed on lost souls, yet are never sated"] = "shgla'yos plahf mh'naus",
		["devourers of lost souls are forever hungry"] = "shgla'yos plahf mh'naus",
		["they consume lost souls and know no fullness"] = "shgla'yos plahf mh'naus",

		["from its bleakest depths"] = "shkul an'zig qvsakf kssh'ga",
		--variants
		["from its darkest depths"] = "shkul an'zig qvsakf kssh'ga",
		["from the bleakest depths below"] = "shkul an'zig qvsakf kssh'ga",
		["from depths most desolate"] = "shkul an'zig qvsakf kssh'ga",
		["from its deepest, bleakest reaches"] = "shkul an'zig qvsakf kssh'ga",

		["we reclaim this world"] = "ag'thyzak agthu",
		--variants
		["we reclaim this world"] = "ag'thyzak agthu",
		["this world is reclaimed"] = "ag'thyzak agthu",
		["we take this world back"] = "ag'thyzak agthu",
		["this world returns to us"] = "ag'thyzak agthu",

		["they are the whisper on the shivering wind"] = "ywaq ma phgwa'cul hnakf",
		--variants
		["they whisper upon the shivering wind"] = "ywaq ma phgwa'cul hnakf",
		["they are the voices carried by the cold wind"] = "ywaq ma phgwa'cul hnakf",
		["they ride the trembling wind as whispers"] = "ywaq ma phgwa'cul hnakf",
		["they are the whisper carried on the wind"] = "ywaq ma phgwa'cul hnakf",

		["they drink your fear: it is the blood of life"] = "ywaq puul skshgn on'ma yeh'glu zuq",
		--variants
		["they drink your fear—it is the blood of life"] = "ywaq puul skshgn on'ma yeh'glu zuq",
		["your fear is their sustenance"] = "ywaq puul skshgn on'ma yeh'glu zuq",
		["they feed upon fear, the blood of life"] = "ywaq puul skshgn on'ma yeh'glu zuq",
		["fear is the lifeblood they drink"] = "ywaq puul skshgn on'ma yeh'glu zuq",

		-- Warlord Zon'ozz
		["gaze into the heart of n'zoth"] = "gul'kafh an'qov N'Zoth",
		["gaze into the heart of nzoth"] = "gul'kafh an'qov N'Zoth",
		--variants
		["look into the heart of n'zoth"] = "gul'kafh an'qov N'Zoth",
		["peer into n'zoth's heart"] = "gul'kafh an'qov N'Zoth",
		["behold the heart of n'zoth"] = "gul'kafh an'qov N'Zoth",
		["stare into n'zoth's core"] = "gul'kafh an'qov N'Zoth",
		["look into the heart of nzoth"] = "gul'kafh an'qov N'Zoth",
		["peer into nzoth's heart"] = "gul'kafh an'qov N'Zoth",
		["behold the heart of nzoth"] = "gul'kafh an'qov N'Zoth",
		["stare into nzoth's core"] = "gul'kafh an'qov N'Zoth",

		["the will of n'zoth corrupts you"] = "N'Zoth ga zyqtahg iilth",
		["the will of nzoth corrupts you"] = "N'Zoth ga zyqtahg iilth",
		--variants
		["n'zoth's will corrupts you"] = "N'Zoth ga zyqtahg iilth",
		["you are corrupted by n'zoth's will"] = "N'Zoth ga zyqtahg iilth",
		["n'zoth's will seeps into you"] = "N'Zoth ga zyqtahg iilth",
		["the will of n'zoth twists you"] = "N'Zoth ga zyqtahg iilth",
		["nzoth's will corrupts you"] = "N'Zoth ga zyqtahg iilth",
		["you are corrupted by nzoth's will"] = "N'Zoth ga zyqtahg iilth",
		["nzoth's will seeps into you"] = "N'Zoth ga zyqtahg iilth",
		["the will of nzoth twists you"] = "N'Zoth ga zyqtahg iilth",

		["your suffering strengthens me"] = "sk'magg yawifk hoq",
		--variants
		["your suffering empowers me"] = "sk'magg yawifk hoq",
		["i grow stronger from your suffering"] = "sk'magg yawifk hoq",
		["your pain makes me stronger"] = "sk'magg yawifk hoq",
		["i am strengthened by your suffering"] = "sk'magg yawifk hoq",


		["your fear drives me"] = "sk'shgn eqnizz hoq",
		--variants
		["your fear fuels me"] = "sk'shgn eqnizz hoq",
		["i am driven by your fear"] = "sk'shgn eqnizz hoq",
		["your fear propels me"] = "sk'shgn eqnizz hoq",
		["your terror gives me purpose"] = "sk'shgn eqnizz hoq",

		["your deaths shall sing of n'zoth's unending glory"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		["your deaths shall sing of nzoth's unending glory"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		--variants
		["your deaths will sing of n'zoth's eternal glory"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		["your deaths will praise n'zoth's endless glory"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		["your dying screams will glorify n'zoth forever"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		["your deaths will echo n'zoth's undying glory"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		["your deaths will sing of nzoth's eternal glory"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		["your deaths will praise nzoth's endless glory"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		["your dying screams will glorify nzoth forever"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",
		["your deaths will echo nzoth's undying glory"] = "sk'shuul agth vorzz N'Zoth naggwa'fssh",

		["your skulls shall adorn n'zoth's writhing throne"] = "sk'tek agth nuq N'Zoth yyqzz",
		["your skulls shall adorn nzoth's writhing throne"] = "sk'tek agth nuq N'Zoth yyqzz",
		--variants
		["your skulls will adorn n'zoth's writhing throne"] = "sk'tek agth nuq N'Zoth yyqzz",
		["n'zoth's throne will be crowned with your skulls"] = "sk'tek agth nuq N'Zoth yyqzz",
		["your skulls will decorate n'zoth's throne"] = "sk'tek agth nuq N'Zoth yyqzz",
		["n'zoth's throne will writhe beneath your skulls"] = "sk'tek agth nuq N'Zoth yyqzz",
		["your skulls will adorn nzoth's writhing throne"] = "sk'tek agth nuq N'Zoth yyqzz",
		["nzoth's throne will be crowned with your skulls"] = "sk'tek agth nuq N'Zoth yyqzz",
		["your skulls will decorate nzoth's throne"] = "sk'tek agth nuq N'Zoth yyqzz",
		["nzoth's throne will writhe beneath your skulls"] = "sk'tek agth nuq N'Zoth yyqzz",

		["your agony sustains me"] = "sk'uuyat guulphg hoq",
		--variants
		["your agony sustains me"] = "sk'uuyat guulphg hoq",
		["i am sustained by your agony"] = "sk'uuyat guulphg hoq",
		["your torment keeps me alive"] = "sk'uuyat guulphg hoq",
		["i endure through your agony"] = "sk'uuyat guulphg hoq",

		["your souls shall sate n'zoth's endless hunger"] = "sk'yahf agth huqth N'Zoth qornaus",
		["your souls shall sate nzoth's endless hunger"] = "sk'yahf agth huqth N'Zoth qornaus",
		--variants
		["your souls will sate n'zoth's endless hunger"] = "sk'yahf agth huqth N'Zoth qornaus",
		["n'zoth's hunger will be fed by your souls"] = "sk'yahf agth huqth N'Zoth qornaus",
		["your souls will feed n'zoth's eternal hunger"] = "sk'yahf agth huqth N'Zoth qornaus",
		["n'zoth will feast upon your souls"] = "sk'yahf agth huqth N'Zoth qornaus",
		["your souls will sate nzoth's endless hunger"] = "sk'yahf agth huqth N'Zoth qornaus",
		["nzoth's hunger will be fed by your souls"] = "sk'yahf agth huqth N'Zoth qornaus",
		["your souls will feed nzoth's eternal hunger"] = "sk'yahf agth huqth N'Zoth qornaus",
		["nzoth will feast upon your souls"] = "sk'yahf agth huqth N'Zoth qornaus",

		["to have waited so long... for this..."] = "uovssh thyzz... qwaz...",
		--variants
		["we have waited so long... for this..."] = "uovssh thyzz... qwaz...",
		["at last... after so long..."] = "uovssh thyzz... qwaz...",
		["so long we have waited..."] = "uovssh thyzz... qwaz...",
		["this moment was long awaited..."] = "uovssh thyzz... qwaz...",

		["once more shall the twisted flesh-banners of n'zoth chitter and howl above the fly-blown corpse of this world"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		["once more shall the twisted flesh-banners of nzoth chitter and howl above the fly-blown corpse of this world"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		--variants
		["once more, n'zoth's twisted flesh-banners will howl above this dead world"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		["again shall n'zoth's flesh-banners shriek over the corpse of this world"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		["n'zoth's writhing banners will once again scream above this rotting world"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		["the flesh-banners of n'zoth will howl again over this world's corpse"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		["once more, nzoth's twisted flesh-banners will howl above this dead world"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		["again shall nzoth's flesh-banners shriek over the corpse of this world"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		["nzoth's writhing banners will once again scream above this rotting world"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",
		["the flesh-banners of nzoth will howl again over this world's corpse"] = "vwyq agth sshoq'meg N'Zoth vra zz shfk qwor ga'halahs agthu",

		["after millennia, we have returned"] = "uulg'ma, ag qam",
		--variants
		["after ages, we return"] = "uulg'ma, ag qam",
		["after countless ages, we have returned"] = "uulg'ma, ag qam",
		["we return after millennia"] = "uulg'ma, ag qam",
		["after endless time, we return"] = "uulg'ma, ag qam",


		["they do not die; they do not live"] = "ywaq maq oou ywaq maq ssaggh",
		--variants
		["they exist outside the cycle"] = "ywaq ma shg'fhn",
		["they stand beyond the cycle"] = "ywaq ma shg'fhn",
		["they are not bound by the cycle"] = "ywaq ma shg'fhn",
		["the cycle does not bind them"] = "ywaq ma shg'fhn",

		["they are outside the cycle"] = "ywaq ma shg'fhn",
		--variants
		["they exist outside the cycle"] = "ywaq ma shg'fhn",
		["they stand beyond the cycle"] = "ywaq ma shg'fhn",
		["they are not bound by the cycle"] = "ywaq ma shg'fhn",
		["the cycle does not bind them"] = "ywaq ma shg'fhn",

		["victory for Deathwing"] = "zzof Shuul'wah",
		--variants
		["victory to Deathwing"] = "zzof Shuul'wah",
		["triumph for Deathwing"] = "zzof Shuul'wah",
		["Deathwing is victorious"] = "zzof Shuul'wah",
		["Deathwing shall triumph"] = "zzof Shuul'wah",

		["for the glory of n'zoth"] = "thoq fssh N'Zoth",
		["for the glory of nzoth"] = "thoq fssh N'Zoth",
		--variants
		["for n'zoth's glory"] = "thoq fssh N'Zoth",
		["glory to n'zoth"] = "thoq fssh N'Zoth",
		["in the name of n'zoth's glory"] = "thoq fssh N'Zoth",
		["all for the glory of n'zoth"] = "thoq fssh N'Zoth",
		["for nzoth's glory"] = "thoq fssh N'Zoth",
		["glory to nzoth"] = "thoq fssh N'Zoth",
		["in the name of nzoth's glory"] = "thoq fssh N'Zoth",
		["all for the glory of nzoth"] = "thoq fssh N'Zoth",

		-- Zek'voz
		["how is this... possible..."] = "hul bala miz rilakich...",
		--variants
		["how can this be..."] = "hul bala miz rilakich...",
		["this is... impossible..."] = "hul bala miz rilakich...",
		["how could this happen..."] = "hul bala miz rilakich...",
		["this cannot be..."] = "hul bala miz rilakich...",

		["not a single worthy trait among you"] = "naza bul rexil qalic ul'",
		--variants
		["there is nothing worthy among you"] = "naza bul rexil qalic ul'",
		["you possess not a single worthy trait"] = "naza bul rexil qalic ul'",
		["nothing about you is worthy"] = "naza bul rexil qalic ul'",
		["you are devoid of any merit"] = "naza bul rexil qalic ul'",


		["you will be eradicated"] = "ug' crish zul Thraxas",
		--variants
		["you will be wiped out"] = "ug' crish zul Thraxas",
		["you will be destroyed"] = "ug' crish zul Thraxas",
		["you will be annihilated"] = "ug' crish zul Thraxas",
		["you will be erased"] = "ug' crish zul Thraxas",

		["i am superior"] = "ul basha krix",
		--variants
		["i am above you"] = "ul basha krix",
		["i am greater"] = "ul basha krix",
		["i surpass you"] = "ul basha krix",
		["i stand above all"] = "ul basha krix",

		-- Armageddon (comic)
		["tremble now, for the slumberer awakens"] = "kulaq w'ajj hwa-ksh brraglac",
		--variants
		["tremble, for the sleeper awakens"] = "kulaq w'ajj hwa-ksh brraglac",
		["shudder now—the slumberer rises"] = "kulaq w'ajj hwa-ksh brraglac",
		["quake, for the sleeper stirs"] = "kulaq w'ajj hwa-ksh brraglac",
		["fear now, the slumberer awakens"] = "kulaq w'ajj hwa-ksh brraglac",

		["they are the howlers in the dark"] = "ywaq ma fvlolf ksht aak vrbl",
		--variants
		["they howl within the dark"] = "ywaq ma fvlolf ksht aak vrbl",
		["they are the voices that howl in darkness"] = "ywaq ma fvlolf ksht aak vrbl",
		["they are the howling ones of the dark"] = "ywaq ma fvlolf ksht aak vrbl",
		["from the darkness, they howl"] = "ywaq ma fvlolf ksht aak vrbl",

		["the madness without end"] = "shn aglf olbl'nyral",
		--variants
		["madness without end"] = "shn aglf olbl'nyral",
		["endless madness"] = "shn aglf olbl'nyral",
		["a madness that never ends"] = "shn aglf olbl'nyral",
		["madness eternal"] = "shn aglf olbl'nyral",

		["they are the shadow that feasts on life"] = "ywaq mwual'gyos gag prfakt sjabba zuq...",
		--variants
		["they are the shadow that devours life"] = "ywaq mwual'gyos gag prfakt sjabba zuq...",
		["they are the darkness that feeds on life"] = "ywaq mwual'gyos gag prfakt sjabba zuq...",
		["they feast upon the living"] = "ywaq mwual'gyos gag prfakt sjabba zuq...",
		["they are life-devouring shadows"] = "ywaq mwual'gyos gag prfakt sjabba zuq...",

		-- G'huun
		["children, come and feed"] = "log'loth w'oq Ongg",
		--variants
		["children, come feast"] = "log'loth w'oq Ongg",
		["come, children, and feed"] = "log'loth w'oq Ongg",
		["children, feed now"] = "log'loth w'oq Ongg",
		["come and feed, my children"] = "log'loth w'oq Ongg",


		["the contagion... has taken root within you"] = "oou thyzz lal ak'uq qwaz Zuq shkul ma sk'tek...",
		--variants
		["the contagion has taken root in you"] = "oou thyzz lal ak'uq qwaz Zuq shkul ma sk'tek...",
		["the corruption has rooted itself within you"] = "oou thyzz lal ak'uq qwaz Zuq shkul ma sk'tek...",
		["the sickness now grows inside you"] = "oou thyzz lal ak'uq qwaz Zuq shkul ma sk'tek...",
		["it has taken root within you"] = "oou thyzz lal ak'uq qwaz Zuq shkul ma sk'tek...",

		-- Vol'zith the Whisperer
		["beneath the tides, your truth awaits"] = "skitsh qi'uthik illith",
		--variants
		["your truth waits beneath the tides"] = "skitsh qi'uthik illith",
		["beneath the waves, your truth lies"] = "skitsh qi'uthik illith",
		["the tides conceal your truth"] = "skitsh qi'uthik illith",
		["your truth sleeps beneath the sea"] = "skitsh qi'uthik illith",

		["darkness roots. pestilence spreads. the doorway is open"] = "ugalazul bwrxil' qu rax",
		--variants
		["darkness takes root. pestilence spreads. the way is open"] = "ugalazul bwrxil' qu rax",
		["the darkness has rooted; the doorway stands open"] = "ugalazul bwrxil' qu rax",
		["pestilence spreads as the door opens"] = "ugalazul bwrxil' qu rax",
		["the way is open, and corruption spreads"] = "ugalazul bwrxil' qu rax",

		["you are mine"] = "ULL vera skish",
		--variants
		["you belong to me"] = "ULL vera skish",
		["you are claimed"] = "ULL vera skish",
		["you are mine to command"] = "ULL vera skish",
		["you are already mine"] = "ULL vera skish",

		["blood pours forth in the depths"] = "xul krass qi' UN skush",
		--variants
		["blood floods the depths"] = "xul krass qi' UN skush",
		["the depths run with blood"] = "xul krass qi' UN skush",
		["blood spills endlessly below"] = "xul krass qi' UN skush",
		["the deep overflows with blood"] = "xul krass qi' UN skush",

		["i will await you... in the dark..."] = "bwixki amala zal qul",
		--variants
		["i wait for you in the dark"] = "bwixki amala zal qul",
		["i await you in darkness"] = "bwixki amala zal qul",
		["i will wait for you in the dark"] = "bwixki amala zal qul",
		["i await you within the darkness"] = "bwixki amala zal qul",
		["in the dark, i wait for you"] = "bwixki amala zal qul",
		["i linger for you in the dark"] = "bwixki amala zal qul",

		["i reside within your lungs"] = "aglathrax hig thrixa",
		--variants
		["i dwell within your lungs"] = "aglathrax hig thrixa",
		["i breathe inside you"] = "aglathrax hig thrixa",
		["your lungs are my home"] = "aglathrax hig thrixa",
		["i live within your breath"] = "aglathrax hig thrixa",




		-- Mythrax the Unraveler
		["xalzaix hungers for annihilation"] = "Uulg'ma zyqtahg yrr",
--variants
		["xalzaix yearns for annihilation"] = "Uulg'ma zyqtahg yrr",
		["xalzaix thirsts for annihilation"] = "Uulg'ma zyqtahg yrr",
		["xalzaix desires only annihilation"] = "Uulg'ma zyqtahg yrr",
		["xalzaix is driven by annihilation"] = "Uulg'ma zyqtahg yrr",

		["extermination"] = "Xith wgah",
--variants
		["total extermination"] = "Xith wgah",
		["eradication"] = "Xith wgah",
		["annihilation"] = "Xith wgah",
		["purging all life"] = "Xith wgah",

-- Yogg-Saron
		["the shadow of my corpse will choke this land for all eternity"] = "Uulwi ifis halahs gag erh'ongg w'ssh",
--variants
		["my corpse's shadow will suffocate this land forever"] = "Uulwi ifis halahs gag erh'ongg w'ssh",
		["this land will choke beneath my corpse's shadow"] = "Uulwi ifis halahs gag erh'ongg w'ssh",
		["my shadowed corpse will smother this world eternally"] = "Uulwi ifis halahs gag erh'ongg w'ssh",
		["forever will this land choke beneath my shadow"] = "Uulwi ifis halahs gag erh'ongg w'ssh",

-- Anglepoint Wharf
		["our gods will devour all"] = "Ak yar qi'lwhuk h'iwn",
--variants
		["our gods will consume everything"] = "Ak yar qi'lwhuk h'iwn",
		["all will be devoured by our gods"] = "Ak yar qi'lwhuk h'iwn",
		["nothing will escape our gods"] = "Ak yar qi'lwhuk h'iwn",
		["our gods hunger for all things"] = "Ak yar qi'lwhuk h'iwn",

		["i return to the writhing throne"] = "Y'za qam yyqzz...",
--variants
		["once more, i return to the throne"] = "Y'za qam yyqzz...",
		["the writhing throne calls me back"] = "Y'za qam yyqzz...",
		["i reclaim my throne"] = "Y'za qam yyqzz...",

		["power unrelenting"] = "Uq naggwa...",
--variants
		["unrelenting power"] = "Uq naggwa...",
		["power without end"] = "Uq naggwa...",
		["power that never wanes"] = "Uq naggwa...",
		["endless power"] = "Uq naggwa...",

-- Deep Watcher
		["the eye sees all"] = "Ma sk'magg ni arwi",
--variants
		["the eye watches all"] = "Ma sk'magg ni arwi",
		["nothing escapes the eye"] = "Ma sk'magg ni arwi",
		["all is seen by the eye"] = "Ma sk'magg ni arwi",
		["the eye misses nothing"] = "Ma sk'magg ni arwi",

		["his greatness... his glory"] = "Ma zzof ag ez uulwi",
--variants
		["his greatness, his glory"] = "Ma zzof ag ez uulwi",
		["behold his greatness"] = "Ma zzof ag ez uulwi",
		["witness his glory"] = "Ma zzof ag ez uulwi",
		["his glory is unmatched"] = "Ma zzof ag ez uulwi",

		["we slumber no more!"] = "Oou oou ryiu nuq",
--variants
		["we sleep no longer"] = "Oou oou ryiu nuq",
		["our slumber ends"] = "Oou oou ryiu nuq",
		["we are awake at last"] = "Oou oou ryiu nuq",
		["no more sleep"] = "Oou oou ryiu nuq",

		["we rise... as he rises!"] = "Yrr par'okoth yrr vorzz",
--variants
		["as he rises, so do we"] = "Yrr par'okoth yrr vorzz",
		["we rise with him"] = "Yrr par'okoth yrr vorzz",
		["his rising is our rising"] = "Yrr par'okoth yrr vorzz",
		["we ascend as he ascends"] = "Yrr par'okoth yrr vorzz",



		-- individual words derived from phrases
		["i am"] = "y'za", ["i"] = "y'za", ["i'm"] = "y'za",
		["me"] = "y'za",
		["myself"] = "y'za",

		["not"] = "noq",
		["never"] = "noq",
		["no longer"] = "noq",
		["nothing"] = "noq",
		["none"] = "noq",

		["first"] = "mah",
		["beginning"] = "mah",
		["at the start"] = "mah",
		["origin"] = "mah",

		["last"] = "ormz",
		["the last"] = "ormz",
		["the end"] = "ormz",
		["final"] = "ormz",
		["the ending"] = "ormz",

		["you"] = "iilth",
		["yourself"] = "iilth",
		["thee"] = "iilth",
		["thou"] = "iilth",

		["your"] = "sk'", --prefix
		["your"] = "sk'",
		["yours"] = "sk'",
		["belonging to you"] = "sk'",

		["they"] = "ywaq",
		["them"] = "ywaq",
		["those"] = "ywaq",
		["the others"] = "ywaq",

		["his"] = "ag",
		["him"] = "ag",

		["do not"] = "maq", ["don't"] = "maq",
		["will not"] = "maq",
		["won't"] = "maq",
		["refuse to"] = "maq",

		["cannot"] = "sythn", ["can not"] = "sythn", ["can't"] = "sythn",
		["unable to"] = "sythn",


		["cannot be"] = "nel'othk", ["can not be"] = "nel'othk", ["can't be"] = "nel'othk",
		["return"] = "qam",
		["returned"] = "qam",
		["come back"] = "qam",
		["has returned"] = "qam",
		["return again"] = "qam",

		["will"] = "qi",
		["will soon"] = "qi",
		["will inevitably"] = "qi",
		["is destined to"] = "qi",

		["shall"] = "agth",
		["shall"] = "agth",
		["must"] = "agth",
		["is decreed"] = "agth",
		["is commanded"] = "agth",

		["devour"] = "lwhuk",
		["consume"] = "lwhuk",
		["eat"] = "lwhuk",
		["feast upon"] = "lwhuk",
		["swallow"] = "lwhuk",

		["know"] = "plahf",
		["understand"] = "plahf",
		["realize"] = "plahf",
		["are aware"] = "plahf",

		["die"] = "oou",
		["death"] = "oou",

		["we"] = "oou",
		["us"] = "oou",

		["live"] = "ssaggh",
		["exist"] = "ssaggh",
		["survive"] = "ssaggh",

		["madness"] = "shn",
		["insanity"] = "shn",
		["delirium"] = "shn",

		["shadow"] = "uulwi",
		["darkness"] = "uulwi",
		["shade"] = "uulwi",

		["cycle"] = "shg'fhn",
		["pattern"] = "shg'fhn",

		["fear"] = "skshgn",
		["terror"] = "skshgn",
		["dread"] = "skshgn",
		["panic"] = "skshgn",

		["soul"] = "yahf",
		["spirit"] = "yahf",
		["essence"] = "yahf",

		["blood"] = "yeh'glu",
		["lifeblood"] = "yeh'glu",
		["bloodshed"] = "yeh'glu",

		["throne"] = "yyqzz",
		["seat of power"] = "yyqzz",

		["depth"] = "zig",
		["depths"] = "an'zig",
		["the deep"] = "zig",
		["the depths"] = "an'zig",
		["the abyss"] = "an'zig",

		["endless"] = "naggwa", ["unending"] = "naggwa",
		["eternal"] = "naggwa",
		["without end"] = "naggwa",

		["glory"] = "fssh",
		["greatness"] = "fssh",
		["majesty"] = "fssh",

		["all"] = "h'iwn",
		["everything"] = "h'iwn",
		["all things"] = "h'iwn",
		["everyone"] = "h'iwn",


		["vessel"] = "an'qoth",  ["host"] = "an'qoth", ["container"] = "an'qoth",
		["shell"] = "an'qoth",
		["body"] = "an'qoth",

		["destroyer"] = "phquathi",
		["ruiner"] = "phquathi",
		["worldbreaker"] = "phquathi",

		["death"] = "shuul",
		["the end"] = "shuul",
		["doom"] = "shuul",

		["wing"] = "wah",
		["wings"] = "wah",

		["deathwing"] = "shuul'wah",
		["black aspect"] = "shuul'wah",



		-- individual words that can be derived from the above
		--[[

		shath'yar		meaning								examples
		________________________________________________________________________
		Y'za			I am / I							Appears in many 1st-person declaratives
		noq				not									Negation particle
		mah				first								Reinforced by "mah'shar" = first of many
		ormz			last								Exclusive contrast with mah

		Y'za			I / I am							Y'za noq mah
		Iilth			you									Iilth ma paf'qi'ag
		Sk'-			your (possessive)					Sk'yahf, Sk'shgn, Sk'tək
		Ywaq			they								Many "They are..." lines
		ag				we									ag'THYZAK, ag qam

		noq				not									I am not the first
		maq				do not								Ywaq maq oou
		sythn			cannot								I cannot die
		nel'othk		cannot be							IT CANNOT BE CONTAINED

		qam				return / returned					I return, we have returned
		qi				will / shall						Future constructions
		agth			shall / will (formal, prophetic)	Skull shall adorn…
		lwhuk			devour								Darkness devours all
		plahf			know								Your soul will know torment
		oou				die / death							multiple
		ssaggh			live								contrast with oou
	
		shn				madness								The madness without end
		uulwi			shadow								many
		shg'fhn			cycle								outside the cycle
		skshgn			fear								Your fear drives me
		yahf			soul								repeated
		yeh'glu			blood								many
		yyqzz			throne								writhing throne
		zig / an'zig	depths								whispers from the deeps

		mah				first								confirmed
		ormz			last								confirmed
		naggwa			endless / unending					glory, power
		fssh			glory								For the glory of N'Zoth
		H'IWN			all									ALL OF YOU

		]]



		-- matches letter count, probably from the parser
		--[[

		-- From the Maw of Madness
		["They are redemption"] = "Fssh qam ak'agathShi",
		["They are truth"] = "Fssh qam h'iwn",
		["You will all drown in the lightless abyss"] = "Gag vwah gag yyqzz ez hoz shAth'yar plahf",
		["You struggle at the surface"] = "Gag yoh'ghyl og hoq uul'gwa",
		["But He waits below"] = "gag Ez yyqzz huqth",

		-- A Mote of Cosmic Truth
		["Errant flesh"] = "H'thon thyzz",
		["When it awakens"] = "Agth ma iiqaath",
		["you will know eternity"] = "zuq wgah puul uhn'agth",
		["and you will tremble"] = "yrr zuq wgah uulg'ma",
		["The key... turns once more"] = "Oou zuq agthu qwor arwi",
		["There is a great and terrible truth at the beginning of all things."] = "Shuul og i agthu yrr sk'uuyat uulwi ma oou sshoq'met ez nuq far'al",
		["I am its herald."] = "I zz nuq al'tha",
		["Listen to my sermon, and know your infinite inconsequence"] = "Ssaggh ni za an'zig yrr puul ywaq gul'kafh",
		["You have seen into the beyond"] = "Zuq agth kyth ongg oou uovssh",
		["Now you shall perceive things as they truly are"] = "Nuq zuq lwhuk qi'uothk far'al aq zaix hnakf lal",

		-- Storm's End (Quest)
		["The sunken realm welcomes your yawning souls"] = "Hoq aN'qov huqth erh'ongg thoq shanDai h'lwn",
		["No light"] = "Og h'iwn",
		["No escape."] = "Og vormos",
		["The forgotten king returns"] = "Hoq sshoq'meg thoq wotH'gl",
		["My fall is but a beat in the heart of the infinite abyss"] = "Za uul og nuq i fssh zz oou iiyoq ez oou gul'kafh anagg",

		-- G'huun
		["I feed on your terror"] = "I ongg za ywaq qvsakf",
		["The outbreak has begun"] = "Oou gul'kafh lal lwhuk!",
		["The titans cannot save you"] = "Oou vwahuHn ag'xig shfk zuq!",
		["Let the feast of a thousand maws begin"] = "Qam oou iilth ez i awtgsshu amun on'ma!",
		["Feel the twitch in your spine?"] = "Vwah oou kaaxth zz ywaq iiyoq",
		["That is where I exist"] = "Ag'xig fhssh I on'ma.",				-- it is likely this term uses "that's" in parser
		["Come, servants of rot"] = "W'oq uhn'agth ez qam",
		["Consume"] = "Shandai!",
		["Your screams will echo forever"] = "Ywaq mh'naus wgah zaix zygtahg.",
		["Your husk serves a new master now"] = "Ywaq ongg an'qov i lal halahs nuq.",
		["My whispers will liquefy your mind"] = "Za awtgsshu wgah uulg'ma ywaq zaix.",
		["You cannot escape infection"] = "Zuq ag'xig bormaz ag'thyzak!",


		-- Mythrax
		["I will reduce you to ash"] = "I wgah far'al zuq ni shn",
		["Give yourself to the plague"] = "Puul qi'plahf ni oou bormax!",
		["You will not survive"] = "Zuq wgah qam n'lyeth!",
		["ghuun will not be stopped"] = "an'zig wgah qam za zyqtahg",

		-- Soggoth
		["The deep one's prison weakens"] = "Oou wgah yyqZz uhnish guu'lal",
		["None will be spared"] = "Qwor wgah za kaaxth",

		-- Coming Out of His Shell (Quest)
		["Fluffy"] = "Yu'gaz",



		--]]



		--untranslated
		["al'golath mal shal'nel"] = "Al'golath mal shal'nel", ["al'tha, al'tha bormaz. ni bormaz ta'thall?"] = "Al'tha, Al'tha bormaz. Ni bormaz ta'thall?",
		["athu'gag magg'naggwa. qor'naus'agth lwhuk. lilth gag'huqth'hoq."] = "Athu'gag magg'naggwa. Qor'naus'agth lwhuk. Lilth gag'huqth'hoq.",
		["bal'qwari og shadar."] = "Bal'qwari Og Shadar.", ["bo'al lal arwi c'toth."] = "Bo'al lal arwi C'toth.",
		["f'lakh ghet!"] = "F'lakh ghet!", ["f'tagh nah'hat! immathan! sha'lub nahab! sha'lub nahab!"] = "F'tagh nah'hat! I'mmathan! Sha'lub nahab! Sha'lub nahab!",
		["gillari, geth'shar. gillari, teko'shar."] = "Gillari, geth'shar. Gillari, teko'shar.", ["h'thon marwol qualar."] = "H'thon marwol qualar.",
		["immalanath, yasoth nalarub!!!"] = "Immalanath, yasoth nalarub!!!", ["log'loth og shandai"] = "Log'loth og shandai",
		["mar'kowa tallol ye'tarin."] = "Mar'kowa tallol ye'tarin.", ["pwhn'guul i ghawl'fwata ryiu wgah uul'gwan h'iwn guu'lal."] = "Pwhn'guul i ghawl'fwata ryiu wgah uul'gwan h'iwn guu'lal.",
		["shethnoth, ol'goth, grell."] = "Shethnoth, ol'goth, grell.", ["shur'nab... shur'nab... yogg-saron!"] = "Shur'nab... shur'nab... Yogg-Saron!",
		["thoth'al amun ree'thael vormos! vormos! vormos!"] = "Thoth'al amun Ree'thael vormos! Vormos! Vormos!", ["tulall par'okoth. far'al, ka'kar."] = "Tulall par'okoth. Far'al, ka'kar.",
		["uhn'agh fash"] = "Uhn'agh Fash", ["uulwi gag erh'ongg w'ssh/w'ssht."] = "Uulwi gag erh'ongg w'ssh/w'ssht.", ["xal'atoh"] = "Xal'atoh",
		["yrr n'lyeth... shuul anagg!"] = "Yrr n'lyeth... shuul anagg!", ["y'knath k'th'rygg k'yi mrr'ungha gr'mula."] = "Y'knath k'th'rygg k'yi mrr'ungha gr'mula."
	},

	[L["Nerubian"]] = {
		["the servant bows to the master's authority"] = "Shabtir bakh sokhen",

		--untranslated
		-- Anub'arak (submerge / summon)
		["auum na l ak k k k isshhh"] = "auum na-l ak-k-k-k isshhh",
		-- Kaheti combat barks
		["aza chatak"] = "aza cha'tak",
		["azatak"] = "aza'tak",
		["elix takna"] = "elix tak'na",
		["igitith ik ansurek"] = "igitith ik ansurek",
		["kahet iz korvan"] = "kahet iz korvan",
		["takizik"] = "tak'izik",
		["takna"] = "tak'na",
		["tak kattaj"] = "tak kat'taj",
		["tak rasha"] = "tak rasha",
		["takrasha na"] = "tak'rasha na",
		-- Anub'arak (kill / locust swarm)
		["flakkh shir"] = "f-lakkh shir",
		["uunak hissss tik k k k k"] = "uunak-hissss tik-k-k-k-k",
		-- Krik'thir the Gatewatcher
		["hushtak heetah"] = "hush-tak hee-tah",
		-- Elder Nadox
		["shhhad ak kereeesshh chak k k"] = "shhhad ak kereeesshh chak-k-k",
		-- Widow Arak'nai (greeting)
		["ikitash izal"] = "iki'tash izal",
		-- Vizier's Scrawled Streamer (written text)
		["unhhh tikk a shisss kka shir na l bkah a shisss kreesh kik ik ta sohk a tik hiss a k k k"] = "unhhh-tikk-a-shisss kka shir na-l bkah a-shisss kreesh kik ik ta sohk-a tik hiss a-k-k-k",


		["acherus"] = "Acherus", ["ahn'kahet"] = "Ahn'kahet", ["azj-kahet"] = "Azj-Kahet", ["azjol-nerub"] = "Azjol-Nerub",
		["en'kilah"] = "En'kilah", ["izol"] = "Izol", ["kolramas"] = "Kolramas", ["narjun"] = "Narjun",
		["nasam"] = "Nasam", ["naxxanar"] = "Naxxanar", ["naxxramas"] = "Naxxramas", ["naz'anak"] = "Naz'anak", ["nerub-ar"] = "Nerub-ar",
		["noth"] = "Noth", ["rak-ahat"] = "Rak-Ahat", ["rak-neraz"] = "Rak-Neraz", ["rak-ush"] = "Rak-Ush", ["rak-zakaz"] = "Rak-Zakaz",
		["tak-rethan"] = "Tak-Rethan", ["talramas"] = "Talramas", ["voltarus"] = "Voltarus", ["vosh"] = "Vosh", ["xesh"] = "Xesh",
		["zeramas"] = "Zeramas",
	},

	[L["Nerglish"]] = {
		-- Aaaaaughibbrgubugbugrguburgle!
		["aaaaaughibbrgubugbugrguburgle"] = "aaaaaughibbrgubugbugrguburgle", ["rwl rwl rwl rwl"] = "aaaaaughibbrgubugbugrguburgle",
		-- Flllurlog
		["move"] = "flllurlog", ["walk"] = "flllurlog",
		-- Flllurlokkr
		["fisherman"] = "flllurlokkr",
		-- Furl
		["feral"] = "furl",
		-- GRRundee
		["gordunni"] = "grrundee",
		-- Klun
		["clan"] = "klun",
		-- Kuldurrreee
		["night elf"] = "kuldurrreee",
		["night elves"] = "kuldurrreee",
		-- Mglrmglmglmgl
		["the murloc gods have blessed us"] = "mglrmglmglmgl", ["the gods have blessed us"] = "mglrmglmglmgl",
		-- Mgrrrl
		["fishing nets"] = "mgrrrl", ["nets"] = "mgrrrl",
		-- Mllgggrrrr
		["thirsty"] = "mllgggrrrr",
		-- Mmgr
		["with"] = "mmgr",
		-- Mmm-
		["tasty"] = "mmm",
		-- Mmmm
		["good"] = "mmmm", ["good enough"] = "mmmm",
		-- Mmmml
		["right"] = "mmmml",
		["correct"] = "mmmml",
		-- Mmmm mrrrggk
		["good magic"] = "mmmm mrrrggk",
		-- Mmmrrggllm
		["aunt"] = "mmmrrggllm",
		-- Mmmrrgglm
		["uncle"] = "mmmrrgglm",
		-- Mmmrrglllm
		["friend"] = "mmmrrglllm",
		-- Mmmurlok
		["murloc"] = "mmmurlok",
		-- Mrgle
		["yes"] = "mrgle", ["acknowledged"] = "mrgle",
		-- Mrgllll glrrm gl!
		["i will kill you"] = "mrgllll glrrm gl",
		-- Mrrrggk
		["magic"] = "mrrrggk",
		-- Mrrrgll
		["sorry"] = "mrrrgll",
		-- Murguhlum
		["ringworm"] = "murguhlum",
		-- N
		["and"] = "n",
		-- Nk
		["no"] = "nk",
		-- Nk mllgggrrrr
		["not thirsty"] = "nk mllgggrrrr",
		-- RRRgrrr
		["ogre"] = "rrrgrrr",
		-- Shng
		["sing"] = "shng",
		-- Skr
		["scar"] = "skr",
		-- Srng
		["spring"] = "srng",
		-- Urka
		["up"] = "urka",
		-- Uuua
		["honor"] = "uuua",

	},

	[L["Furbolg"]] = {
		["justice"] = "vark", ["furbolg"] = "ursa",
	},

};



Lang.Dictionaries = Dictionaries