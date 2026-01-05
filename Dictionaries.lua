local _, Lang = ...;

local L = Lang.L


local Dictionaries = {
	[L["Common"]] = {
		-- translations
		["by blood and honor we serve"] = "esarus thar no'darador", ["troll slayer"] = "trol'kalar",
		["in"] = "a'l", ["long live the king"] = "an karanir Thanagor", ["killer"] = "kalar",
		["alliance"] = "landowar", ["peaceful land of the people"] = "Lordaeron", ["lake"] = "mere",
		["may"] = "mor", ["his"] = "ok", ["orc"] = "or", ["orc killer"] = "or'kalar", ["spirit of the world"] = "spiritus mundi",
		["king"] = "thanagor", [ "troll"] = "trol",

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

		--untranslated phrases
		["aludala"] = "aludala", ["ana duna thera"] = "ana duna thera", ["anato retetour"] = "anato retetour", ["anu'dora!"] = "anu'dora!",
		["anu dorah"] = "anu dorah", ["anu dorini ash'ka"] = "anu dorini ash'ka", ["anu dunah thalore"] = "anu dunah thalore", ["iseradune banthalos"] = "iseradune banthalos",
		["anu therador mali"] = "anu therador mali", ["arama sh'nala fasima nemelia boranna... manoria fesala maranor... mal'nala fal!!"] = "Arama sh'nala fasima nemelia boranna... manoria fesala maranor... mal'nala fal!!",
		["ash'al theradas"] = "Ash'al theradas", ["ashbalanol"] = "Ashbalanol", ["ash rohk ilisar"] = "ash rohk ilisar", ["thandae"] = "thandae",
		["ashre thoraman"] = "Ashre thoraman", ["ash'thero danador"] = "Ash'thero danador", ["ash'therod nethanas"] = "Ash'therod nethanas",
		["bathel'daelune"] = "Bathel'daelune", ["deronica"] = "Deronica", ["elun'falah shalar."] = "Elun'falah shalar.", ["elun'orin torel!"] = "Elun'orin torel!",
		["enae elen'relos!"] = "Enae elen'relos!", ["en'shu falah-nah"] = "En'shu falah-nah", ["enshu-falah-nah, dorini."] = "Enshu-falah-nah, dorini.",
		["enu thora'serador"] = "Enu thora'serador", ["hinduli rethal"] = "Hinduli rethal", ["ishnu... oshalan thara dormil... anu'dorin..."] = "Ishnu... Oshalan thara dormil... Anu'dorin...",
		["ishnu-talah kaldorei."] = "Ishnu-talah Kaldorei.", ["sael'ah"] = "Sael'ah", ["shal myrinan ishnu daldorah"] = "Shal myrinan ishnu daldorah",
		["shu dales-na"] = "Shu dales-na", ["thandae-alah"] = "Thandae-alah", ["thara dormil dorah"] = "Thara dormil dorah",
		["tor falah-no dorah"] = "Tor falah-no dorah", ["zin-al-elune!"] = "Zin-al-Elune!",


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

		-- Aar-don'sha, ki kahl'dos.
		["in the light we triumph"] = "aar-don'sha, ki kahl'dos", ["in light we triumph"] = "aar-don'sha, ki kahl'dos", ["light we triumph"] = "aar-don'sha, ki kahl'dos",
		-- Achal hecta
		["good day"] = "achal hecta",
		-- Archenon poros
		["good fortune"] = "archenon poros",
		-- Atar va hish'ana, maat irim ita.
		["beneath the eternal stars we walk together"] = "atar va hish'ana, maat irim ita", ["beneath eternal stars we walk together"] = "atar va hish'ana, maat irim ita",
		["beneath the stars we walk together"] = "atar va hish'ana, maat irim ita",
		-- Auchindoun
		["a home for the honored dead"] = "auchindoun", ["home for the honored dead"] = "auchindoun",
		-- Dioniss aca
		["safe journey"] = "dioniss aca", ["safe travels"] = "dioniss aca",
		-- Draenei
		["exiled ones"] = "draenei", ["the exiled ones"] = "draenei",
		-- Draenor
		["exiles refuge"] = "draenor", ["refuge of exiles"] = "draenor",
		-- Fanlin'Deskor
		["amber skies over wondrous rock"] = "fanlin'deskor", ["amber skies"] = "fanlin'deskor",
		-- Goblin
		["parasite"] = "goblin",
		-- Krokul
		["broken"] = "krokul", ["the broken"] = "krokul",
		-- Krona ki cristorr!
		["the legion will fall"] = "krona ki cristorr", ["legion will fall"] = "krona ki cristorr",
		-- Kurenai
		["redeemed"] = "kurenai", ["the redeemed"] = "kurenai",
		-- Ma-no icta!
		["double your efforts"] = "ma-no icta", ["double efforts"] = "ma-no icta",
		-- Man'ari
		["unnatural beings"] = "man'ari", ["demons"] = "man'ari", ["demon"] = "man'ari",
		-- Pheta thones gamera.
		["light guide our path"] = "pheta thones gamera", ["light guide the path"] = "pheta thones gamera", ["light guide us"] = "pheta thones gamera",
		-- Pheta vi acahachi!
		["light give me strength"] = "pheta vi acahachi", ["light give strength"] = "pheta vi acahachi",
		-- Sha
		["light"] = "sha",
		-- Sha'tar
		["born from light"] = "sha'tar",
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
		-- Alar'annalas
		["ranger lord"] = "alar'annalas",
		-- Al diel shala
		["safe travels"] = "al diel shala", ["travel safely"] = "al diel shala",
		-- Ama noral'arkhana
		["saved by magic"] = "ama noral'arkhana", ["saved through magic"] = "ama noral'arkhana",
		-- Anar'alah
		["by the light"] = "anar'alah", ["by light"] = "anar'alah",
		-- Anar'alah belore
		["by the light of the sun"] = "anar'alah belore", ["by the suns light"] = "anar'alah belore",
		-- Anaria shola
		["speak your business"] = "anaria shola", ["state your business"] = "anaria shola",
		-- Anar'endal dracon
		["by the breath of the dragon"] = "anar'endal dracon", ["by the dragons breath"] = "anar'endal dracon",
		-- Ann'da
		["father"] = "ann'da", ["papa"] = "ann'da",
		-- Anu belore dela'na
		["the sun guides us"] = "anu belore dela'na", ["sun guides us"] = "anu belore dela'na",
		-- Aranal
		["rise"] = "aranal",
		-- Bal'a dash, malanore
		["greetings traveler"] = "bal'a dash, malanore", ["greetings"] = "bal'a dash, malanore",
		-- Ban'dinoriel
		["gatekeeper"] = "ban'dinoriel",
		-- Band'or shorel'aran
		["prepare to say farewell"] = "band'or shorel'aran", ["prepare for farewell"] = "band'or shorel'aran",
		-- Bash'a no falor talah!
		["taste the chill of true death"] = "bash'a no falor talah", ["taste true death"] = "bash'a no falor talah",
		-- Belono sil'aru, belore'dorei
		["shoulder your burdens well child of the sun"] = "belono sil'aru, belore'dorei", ["bear your burdens well child of the sun"] = "belono sil'aru, belore'dorei",
		-- Belore
		["the sun"] = "belore", ["sun"] = "belore",
		-- Belore'dorei
		["child of the sun"] = "belore'dorei", ["children of the sun"] = "belore'dorei",
		-- Doral ana'diel?
		["how fare you"] = "doral ana'diel", ["how are you"] = "doral ana'diel",
		-- Elor bindel felallan morin'aminor
		["sleep forever in quiet serenity"] = "elor bindel felallan morin'aminor", ["sleep in eternal serenity"] = "elor bindel felallan morin'aminor",
		-- Elu'meniel mal alann
		["may peace calm your heart"] = "elu'meniel mal alann", ["peace calm your heart"] = "elu'meniel mal alann",
		-- Felo'melorn
		["flamestrike"] = "felo'melorn",
		-- Kim'jael
		["little rat"] = "kim'jael",
		-- Medivh
		["keeper of secrets"] = "medivh",
		-- Minn'da
		["mother"] = "minn'da", ["mama"] = "minn'da",
		-- Quel'dorei
		["children of noble birth"] = "quel'dorei", ["the highborne"] = "quel'dorei", ["high elves"] = "quel'dorei", ["children of high birth"] = "quel'dorei",
		-- Quel'Thalas
		["high home"] = "quel'thalas",
		-- Rea
		["and"] = "rea",
		-- Ren'dorei
		["children of the void"] = "ren'dorei", ["void elves"] = "ren'dorei",
		-- Selama ashal'anore
		["justice for our people"] = "selama ashal'anore",
		-- Shal'na
		["aunt"] = "shal'na",
		-- Shindu fallah na
		["they are breaking through"] = "shindu fallah na", ["our enemies are breaking through"] = "shindu fallah na",
		-- Shindu sin'dorei
		["failing children of the blood"] = "shindu sin'dorei",
		-- Shorel'aran
		["farewell"] = "shorel'aran",
		-- Sin'dorei
		["children of the blood"] = "sin'dorei", ["people of the bloodline"] = "sin'dorei", ["blood elves"] = "sin'dorei",
		-- Sinu a'manore
		["well met"] = "sinu a'manore",
		-- Sunstrider
		["he who walks the day"] = "sunstrider",
		-- Tal anu'men no sin'dorei
		["death to all who oppose the children of the blood"] = "tal anu'men no sin'dorei", ["death to those who oppose the sin'dorei"] = "tal anu'men no sin'dorei",
		-- Thas'alah
		["light of the forest"] = "thas'alah",
		-- Thas'dorah
		["valor of the forest"] = "thas'dorah",
		-- Vendel'o eranu
		["help me forget"] = "vendel'o eranu",




		--untranslated words & phrases
		["agamath"] = "Agamath", ["anara'nel belore"] = "Anara'nel belore", ["an'daroth"] = "An'daroth", ["andu fallah"] = "Andu fallah",
		["an'owyn"] = "An'owyn", ["an'telas"] = "An'telas", ["anar'alash denal!"] = "Anar'alash denal!", ["anar'dalel!"] = "Anar'dalel!",
		["anu bala belore alon"] = "Anu bala belore alon", ["aranal, ledel!"] = "Aranal, ledel!", ["archonisus"] = "Archonisus",
		["aseph-ah-balla nah"] = "Aseph-ah-balla nah", ["asto're da shan're. turus fulo il'amare, a'talah adore. isera'duna..."] = "Asto're da shan're. Turus Fulo Il'amare, A'Talah Adore. Isera'duna...",
		["balamore shanal!"] = "Balamore shanal!", ["bandal!"] = "Bandal!", ["belesa menoor!"] = "Belesa menoor!",
		["bin dorei am'ovel"] = "Bin dorei am'ovel", ["diel fin'al"] = "Diel fin'al", ["diel ma'ahn... orindel'o."] = "Diel ma'ahn... orindel'o.",
		["elrendar"] = "Elrendar", ["endala finel endal!"] = "Endala finel endal!", ["endirina-dor"] = "Endirina-dor",
		["endo-enah quel'thalas!"] = "Endo-enah Quel'thalas!", ["endorel aluminor"] = "Endorel aluminor", ["enshu-falah-nah, dorini"] = "Enshu-falah-nah, dorini",
		["falthrien"] = "Falthrien", ["fal'inrush"] = "Fal'inrush", ["falithas"] = "Falithas", ["fellovar"] = "Fellovar",
		["felomin ashal"] = "Felomin ashal", ["ishera-do"] = "Ishera-do", ["lu'minellia"] = "Lu'minellia", ["morn'danel"] = "Morn'danel",
		["quel'danas"] = "Quel'Danas", ["quel'danil"] = "Quel'Danil", ["quel'lithien"] = "Quel'Lithien", ["rae'shalare"] = "Rae'shalare",
		["rohendor"] = "Rohendor", ["selama am'oronor!"] = "Selama am'oronor!", ["selama amor'anore!"] = "Selama amor'anore!",
		["sha'amoor ara mashal?"] = "Sha'amoor ara mashal?", ["sha'amoor seabenal!"] = "Sha'amoor seabenal!", ["shalandis"] = "Shalandis",
		["shan'dor"] = "Shan'dor", ["shan'dorah"] = "Shan'dorah", ["sin'loren"] = "Sin'loren", ["tel'thas"] = "Tel'thas",
		["thalas'din belore"] = "Thalas'din belore", ["thori'dal"] = "Thori'dal", ["varillian"] = "Varillian"
	},

	[L["Zandali"]] = {

		-- Atal'ai
		["devoted ones"] = "atal'ai",
		["the devoted ones"] = "atal'ai",

		-- Bwon'tulak
		["death singer"] = "bwon'tulak",

		-- Dazdooga
		["fire"] = "dazdooga",

		-- Doba quzhu ta tawbo! Metah bo chu!
		["we bring a gift for you great loa of death"] = "doba quzhu ta tawbo metah bo chu",
		["we bring a gift great loa of death"] = "doba quzhu ta tawbo metah bo chu",

		-- E'ko
		["life energy"] = "e'ko",
		["life energy within all living things"] = "e'ko",

		-- Fa'da
		["father"] = "fa'da",
		["dad"] = "fa'da",

		-- Ma'da
		["mother"] = "ma'da",
		["mom"] = "ma'da",

		-- Muisek
		["avenging spirit"] = "muisek",
		["avenging spirit of the dead"] = "muisek",

		-- Rush'kah
		["ceremonial mask"] = "rush'kah",
		["ritual mask"] = "rush'kah",

		-- Shera Ali'kh
		["deaths hand"] = "shera ali'kh",
		["hand of death"] = "shera ali'kh",

		-- Zen
		["druid"] = "zen",

		-- Zul'
		["voodoo master"] = "zul",

		-- 'aka
		["daughter of"] = "'aka",
		["daughter"] = "'aka",




		-- untranslated phrases
		["amani"] = "Amani",
		["amani'shi"] = "Amani'shi",
		["atal'alarion"] = "Atal'alarion",
		["atal-mhuto"] = "Atal-Mhuto",
		["azzaga choogo zinn!"] = "Azzaga choogo zinn!",
		["bwonsamdi"] = "Bwonsamdi",
		["chaga... choka'jinn."] = "Chaga... choka'jinn.",
		["dahazi"] = "Dahazi",
		["dazar"] = "Dazar",
		["da amani de chuka!"] = "Da Amani de chuka!",
		["da'kala koraste..."] = "Da'kala koraste...",
		["da'kala di'chuka horridon! kalimaste!"] = "Da'kala di'chuka HORRIDON! Kalimaste!",
		["di chuka rezan!"] = "Di chuka Rezan!",
		["di chuka zandalar!"] = "Di chuka Zandalar!",
		["farastu"] = "Farastu",
		["gachaga"] = "Gachaga",
		["gurubashi"] = "Gurubashi",
		["guzincha"] = "Guzincha",
		["hakkar"] = "Hakkar",
		["ikambokem"] = "Ikambokem",
		["jin'do"] = "Jin'do",
		["jin'rokh"] = "Jin'rokh",
		["jin'sora"] = "Jin'sora",
		["jin'zallah"] = "Jin'Zallah",
		["jin'zil"] = "Jin'Zil",
		["kai'jin"] = "Kai'jin",
		["kai'ju"] = "Kai'ju",
		["ma'tuba!"] = "Ma'tuba!",
		["mai'jin"] = "Mai'jin",
		["mueh'zala"] = "Mueh'zala",
		["nazferiti"] = "Nazferiti",
		["nek'mani"] = "Nek'mani",
		["ohgan"] = "Ohgan",
		["orik'ando"] = "Orik'ando",
		["pohkiza"] = "Pohkiza",
		["rush'kah"] = "Rush'kah",
		["samedi"] = "Samedi",
		["sendulo ma'das na khu'das, kuba zinn awe."] = "Sendulo ma'das na khu'das, kuba zinn awe.",
		["sen'jin"] = "Sen'jin",
		["shango"] = "Shango",
		["tai'jin"] = "Tai'jin",
		["taz'dingo"] = "Taz'dingo",
		["tazaga-choo!"] = "Tazaga-choo!",
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
		["amani"] = "Amani",
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
		["village in the vines"] = "Village in the Vines",
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
		["malorne"] = "apa'ro",
		-- Arikara
		["vengeance"] = "arikara",
		-- Echeyakee
		["whitemist"] = "echeyakee",
		-- Ish-ne-alo por-ah
		["may the days ahead be guided by the elders of long ago"] = "ish-ne-alo por-ah", ["may the days ahead be guided by the elders"] = "ish-ne-alo por-ah",
		-- Isha Awak
		["deep doom"] = "isha awak",
		-- Ishamuhale
		["speartooth"] = "ishamuhale",
		-- Lakota'mani
		["earthshaker"] = "lakota'mani",
		-- Lar'korwi
		["sharp claw"] = "lar'korwi", ["sharpclaw"] = "lar'korwi",
		-- Lo'Gosh
		["ghost wolf"] = "lo'gosh",
		-- Mashan'she
		["the loom of the earth mother"] = "mashan'she", ["loom of the earth mother"] = "mashan'she",
		-- Mawat'aki
		["wintersoul"] = "mawat'aki",
		-- Mu'sha
		["the moon"] = "mu'sha", ["moon"] = "mu'sha",
		-- Nechi owachi
		["hello and thank you"] = "nechi owachi", ["hello thank you"] = "nechi owachi",
		-- Owatanka
		["bluebolt"] = "owatanka",
		-- Shu'halo
		["the tauren"] = "shu'halo", ["tauren"] = "shu'halo",
		-- Theia-shoush ahmen
		["so it will be"] = "theia-shoush ahmen", ["so it shall be"] = "theia-shoush ahmen",
		-- Una'fe
		["refuge"] = "una'fe",
		-- Washte Pawne
		["spirit biter"] = "washte pawne",
		-- Yeena'e
		["those who herald the dawn"] = "yeena'e", ["heralds of the dawn"] = "yeena'e",


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
		-- Quel'vala thonos
		["nobility through tradition"] = "quel'vala thonos",
		-- Ru shanna shal'dorei / Ru-shanna shal'dorei
		["the nightborne will survive"] = "ru shanna shal'dorei", ["nightborne will survive"] = "ru shanna shal'dorei",
		-- Shal'dorei
		["nightborne"] = "shal'dorei",
		-- Tal'ashar
		["an honor duel"] = "tal'ashar", ["honor duel"] = "tal'ashar",


		--untranslated
		["anar'amenos"] = "Anar'amenos",
		["an'ah"] = "An'ah",
		["an'anora"] = "An'anora",
		["an'ratha ador"] = "An'ratha ador",
		["an'ratha adore"] = "An'ratha adore",
		["an'ratha... an'tal-thandros!"] = "An'ratha... an'tal-thandros!",
		["anath'ashar"] = "Anath'ashar",
		["aran'arcana"] = "Aran'arcana",
		["aran'ethil"] = "Aran'ethil",
		["arash-falas"] = "Arash-falas",
		["ash'thoras denil"] = "Ash'thoras denil",
		["e'rath omnas"] = "E'rath omnas",
		["in'alah"] = "In'alah",
		["ishnal toreth"] = "Ishnal toreth",
		["ith'el kanesh"] = "Ith'el kanesh",
		["ith'nala kanesh"] = "Ith'nala kanesh",
		["kal'theros maldin"] = "Kal'theros maldin",
		["n'eth ana"] = "N'eth ana",
		["nar'thalas vas manari"] = "Nar'thalas vas manari",
		["thala nar'valas"] = "Thala nar'valas",
		["nor'bethos suramar"] = "Nor'bethos Suramar",
		["rath"] = "Rath",
		["rath-domaas"] = "Rath-domaas",
		["rath-anu'tanos"] = "Rath-anu'tanos",
		["shal'asan torah"] = "Shal'asan torah",
		["shanar daloras"] = "Shanar daloras",
		["tel'vasha"] = "Tel'vasha",
		["tel'velath"] = "Tel'velath",
		["tenu'balah"] = "Tenu'balah",
		["tor'theras falar"] = "Tor'theras falar"
	},


	[L["Draconic"]] = {
		-- Abela
		["once"] = "abela",
		-- Am dakana
		["for all"] = "am dakana",
		-- Belan shi
		["thank you"] = "belan shi", ["thanks"] = "belan shi",
		-- Dargonax
		["devourer"] = "dargonax",
		-- Drekazera
		["false nest"] = "drekazera",
		-- Lish Llrath
		["talon toss"] = "lish llrath",
		-- Mal
		["and"] = "mal",
		-- Mel andilar borun miranol
		["your suffering shall be legendary"] = "mel andilar borun miranol", ["your suffering will be legendary"] = "mel andilar borun miranol",
		-- Reln nu ramani ar ravelahn
		["let the will of this puppet be broken"] = "reln nu ramani ar ravelahn", ["break the will of this puppet"] = "reln nu ramani ar ravelahn",
		-- Rethul
		["vessel"] = "rethul",
		-- Thorel osh'onza
		["insolent young elf"] = "thorel osh'onza", ["insolent elf"] = "thorel osh'onza",



		--untranslated
		["aberrus"] = "Aberrus", ["akirus"] = "Akirus", ["algeth'ar"] = "Algeth'ar", ["algeth'era"] = "Algeth'era", ["andoros"] = "Andoros",
		["ashjra'kamas"] = "Ashjra'kamas", ["ashjre'thul"] = "Ashjre'thul", ["ataraxis"] = "Ataraxis", ["crul'korak"] = "Crul'korak",
		["crul'shorukh"] = "Crul'shorukh", ["draco'dar"] = "Draco'dar", ["erethos"] = "Erethos", ["fyr'alath"] = "Fyr'alath",
		["gelikyr"] = "Gelikyr", ["gholak"] = "Gholak", ["golad"] = "Golad", ["gurthalak"] = "Gurthalak", ["holth aldon shi"] = "Holth aldon shi",
		["kiril"] = "Kiril", ["krondus krozhu, xahlera..."] = "Krondus krozhu, xahlera...", ["lok'amir il romathis"] = "Lok'amir il Romathis",
		["lunedane"] = "Lunedane", ["karnthar"] = "Karnthar", ["kharnalex"] = "Kharnalex", ["maladath"] = "Maladath", ["mish'undare"] = "Mish'undare",
		["nal ks'kol"] = "Nal ks'kol", ["nasz'uro"] = "Nasz'uro", ["neltharax"] = "Neltharax", ["nelthazan"] = "Nelthazan",
		["no'kaled"] = "No'Kaled", ["rashon"] = "Rashon", ["rathrak"] = "Rathrak", ["rusza'thar"] = "Rusza'thar", ["seradane"] = "Seradane",
		["szar skeleth"] = "Szar Skeleth", ["thaldraszus"] = "Thaldraszus", ["themios"] = "Themios", ["tiriosh"] = "Tiriosh",
		["ti'tahk"] = "Ti'tahk", ["t'zonna"] = "T'zonna", ["vakash"] = "Vakash", ["vakthros"] = "Vakthros", ["valdrakken"] = "Valdrakken",
		["vishanka"] = "Vishanka", ["vis'kag"] = "Vis'kag", ["zelthrak"] = "Zelthrak", ["zskera"] = "Zskera"

	},

	[L["Pandaren"]] = {
		["spirit"] = "chi", ["counselor"] = "chu'shao", ["judge"] = "fa'shua",

		["tan-chao"] = "tan-chao",
	},

	[L["Titan"]] = {
		["storm giants"] = "aesir", ["land of eternal starlight"] = "Kalimdor", ["vessel"] = "midnir", ["serpent"] = "nalak",
		["earth giants"] = "vanir",

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
		-- Aglathrax hig' thrixa
		["i reside within your lungs"] = "aglathrax hig thrixa",
		-- Ak'agthshi ma uhnish...
		["our numbers are endless our power beyond reckoning all who oppose the destroyer will die a thousand deaths"] = "ak'agthshi ma uhnish ak'uq shg'cul vwahuhn hiwn iggksh phquathi gag oou kaaxth shuul",
		-- An'qoth
		["vessel"] = "an'qoth",
		-- AN'zig wgah qam za zyqtahg
		["ghuun will not be stopped"] = "an'zig wgah qam za zyqtahg",
		-- Al'ksh syq iir awan
		["is this real or an illusion you are going mad"] = "al'ksh syq iir awan iilth sythn aqev",
		-- Bwixki amala zal qulllll
		["i will await you in the dark"] = "bwixki amala zal qulllll",
		-- En'othk uulg'shuul
		["there is no light after death only a place where even shadows fear to go"] = "en'othk uulg'shuul mh'za uulwi skshgn kar",
		-- Ez Shuul'wah
		["your faithful servant has failed you o deathwing"] = "ez shuul'wah sk'woth'gl yugaz yog'ghyl ilfah",
		-- Fssh qam ak'agathshi
		["they are redemption they are truth"] = "fssh qam ak'agathshi fssh qam hiwn",
		-- Gag vwah gag yyqzz
		["you will all drown in the lightless abyss"] = "gag vwah gag yyqzz ez hoz shath'yar plahf",
		-- Gag yoh'ghyl
		["you struggle at the surface but he waits below"] = "gag yoh'ghyl og hoq uulgwa gag ez yyqzz huqth",
		-- Gul'kafh an'shel
		["gaze into the void it is the perpetuity in which they dwell"] = "gul'kafh an'shel yoq'al shn ky ywaq nuul",
		-- Gul'kafh an'qov N'Zoth
		["gaze into the heart of nzoth"] = "gul'kafh an'qov nzoth",
		-- H'iwn zaix Shuul'wah
		["all praise deathwing the destroyer"] = "hiwn zaix shuul'wah phquathi",
		-- H'thon thyzz Agth
		["errant flesh when it awakens you will know eternity and you will tremble"] = "h'thon thyzz agth ma iiqaath zuq wgah puul uhn'agth",
		-- Hoq aN'qov
		["the sunken realm welcomes your yawning souls"] = "hoq an'qov huqth erh'ongg thoq shandai h'lwn",
		-- Hul bala miz rilakich
		["how is this possible"] = "hul bala miz rilakich",
		-- I ongg za ywaq qvsakf
		["i feed on your terror"] = "i ongg za ywaq qvsakf",
		-- I wgah far'al
		["i will reduce you to ash"] = "i wgah far'al zuq ni shn",
		-- Iilth ma paf'qi'ag
		["you are a prisoner in your own body a servant of fear"] =  "iilth ma paf'qi'ag sk'halahs gaz skshgn",
		-- Ilith qi'uothk
		["you will drown in the blood of the old gods"] = "ilith qi'uothk shn'ma yeh'glu shath'yar",
		-- Iilth qi mah'shar
		["you will be the first of many to glimpse the madness of nzoth"] = "iilth qi mah'shar fhn oorql nzoth",
		-- Iilth vwah uhn'agth
		["where one falls many shall take its place"] = "iilth vwah uhn'agth fhssh za",
		-- Il'zarq N'Zoth
		["the voice of nzoth whispers from the deeps"] = "il'zarq nzoth phgwa an'zig",
		-- Kulaq w'ajj
		["tremble now for the slumberer awakens"] = "kulaq w'ajj hwa ksh brraglac",
		-- KYTH ag'xig
		["see how we pour from the cursed earth"] = "kyth ag'xig yyg'far iiqaath ongg",
		-- Log'loth w'oq Ongg
		["children come and feed"] = "log'loth w'oq ongg",
		-- Mg'uulwi N'Zoth
		["in the writhing shadow of nzoth all light fades and dies"] = "mg'uulwi nzoth eth'razzqi worg zz oou",
		-- N'Zoth ga zyqtahg
		["the will of nzoth corrupts you"] = "nzoth ga zyqtahg iilth",
		-- Naza bul rexil
		["not a single worthy trait among you"] = "naza bul rexil qalic ul",
		-- Oou gul'kafh
		["the outbreak has begun"] = "oou gul'kafh lal lwhuk",
		-- Puul qi'plahf
		["give yourself to the plague"] = "puul qi'plahf ni oou bormax",
		-- Sk'magg yawifk
		["your suffering strengthens me"] = "sk'magg yawifk hoq",
		-- Sk'shgn eqnizz
		["your fear drives me"] = "sk'shgn eqnizz hoq",
		-- Ug crish zul Thraxas
		["you will be eradicated"] = "ug crish zul thraxas",
		-- Ul basha krix
		["i am superior"] = "ul basha krix",
		-- ULL vera skish
		["you are mine"] = "ull vera skish",
		-- Xith wgah
		["extermination"] = "xith wgah",
		-- Zuq wgah qam n'lyeth
		["you will not survive"] = "zuq wgah qam n'lyeth",



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