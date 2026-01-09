local _, Lang = ...;

local L = Lang.L

local LANGUAGE_REPLACEMENTS = {
	[L["Common"]] = {
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

	[L["Darnassian"]] = {
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

	[L["Dwarvish"]] = {
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
		["hasRunes"] = true,
	},

	[L["Gnomish"]] = {
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

	[L["Draenei"]] = {
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

	[L["Orcish"]] = {
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

	[L["Zandali"]] = {
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

	[L["Taurahe"]] = {
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
		["hasRunes"] = true,
	},

	[L["Gutterspeak"]] = {
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

	[L["Forsaken"]] = {
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

	[L["Thalassian"]] = {
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

	[L["Goblin"]] = { -- languageID 40
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

	[L["Shalassian"]] = { -- languageID 181
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

	[L["Vulpera"]] = { -- languageID 285
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

	[L["Pandaren"]] = { -- reworked entirely, a truncated list of random names
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

	[L["Ancient Pandaren"]] = { -- extended/expanded list of truncated NameGen, reformatted. Complete: 1,2
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

	[L["Draconic"]] = { -- languageID 11
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

	[L["Demonic"]] = { -- languageID 8
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

	[L["Titan"]] = { -- languageID 9
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

	[L["Kalimag"]] = { -- languageID 12
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

	[L["Shath'Yar"]] = { -- languageID 178
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
		["hasRunes"] = true,
	},

	[L["Broker"]] = { -- no languageID, fanmade
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

	[L["Cypher"]] = { -- languageID 287
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

	[L["Arathi"]] = { -- no languageID, fanmade

		[1] = {"a", "d", "e", "n", "p", "s", "y"},
		[2] = {"ae", "al", "am", "an", "ar", "as", "au", "ch", "da", "ea", "ed", "eh", "el", "en", "es", "ez", "ge", "ja", "je", "jo", "ke", "la", "lo", "ma", "mi", "na", "ne", "on", "ra", "ro", "ru", "so", "th", "ve", "vi", "we", "yl", "za", "zo"},
		[3] = {"ahl", "ald", "all", "aly", "avi", "axe", "bar", "bas", "bli", "bow", "car", "cie", "cry", "del", "den", "der", "dra", "ead", "fae", "fas", "fay", "fyn", "gen", "gol", "gor", "hor", "ill", "iza", "jae", "jer", "kae", "kei", "key", "kie", "lar", "las", "lay", "leb", "len", "ler", "lia", "lip", "lor", "lyn", "mae", "mal", "man", "mar", "mer", "mor", "mut", "mya", "myl", "ner", "net", "nie", "pal", "pea", "pha", "pon", "pyr", "rae", "ran", "raw", "ren", "rex", "rie", "rin", "rnt", "roe", "rra", "rys", "sap", "sil", "son", "sor", "syg", "tae", "tea", "ter", "ton", "tor", "tta", "vae", "val", "van", "vel", "ven", "vik", "war", "way", "wen", "wyd", "wyn", "yol"},
		[4] = {"anda", "aura", "blae", "bray", "bron", "cava", "dail", "dala", "dale", "dawn", "diri", "dorn", "dram", "duel", "enta", "evae", "fair", "fall", "fend", "fire", "flan", "flit", "fyre", "fyrm", "gaen", "gard", "glen", "glow", "hael", "hand", "hann", "helm", "host", "iron", "iryn", "klay", "lain", "lani", "layr", "lina", "lych", "mael", "maer", "mail", "marc", "meld", "mian", "more", "murr", "oria", "paig", "pert", "phie", "phil", "pray", "pure", "pyke", "seph", "shel", "song", "stan", "thal", "thar", "tian", "veir", "vera", "vest", "waet", "ward", "wynd"},
		[5] = {"aegis", "akith", "amble", "bawnd", "blaze", "braes", "braun", "brigh", "brons", "clair", "corhe", "flame", "fraed", "fyres", "gills", "glynn", "havuk", "lisia", "lithe", "maelt", "monte", "shelm", "sieyr", "sterl", "steur", "stone", "stray", "suley", "surge", "taver", "telle", "thuri", "thyst"},
		[6] = {"astair", "entine", "fierce", "flayme", "leifen", "pierce", "plough", "shayne", "smithe", "stonge", "strike", "strong", "taella", "torina", "ezalyn", "golren", "klayth"},
		[7] = {"sorath", "keirath", "veirlis", "faermar", "naliren"},
		[8] = {"fairfend", "trueglen", "laynemar", "bronfyre", "flitfyre", "hostglen", "ironglow", "veirdawn"},
		[9] = {"ironblaze", "bronsfend", "helmsurge", "duelbawnd", "brighhelm", "faynstell", "jeveraest"},
		[10] = {"haelvaedra", "valmarward"},
		[11] = {"eadwardfend", "warhostfyre", "rystonsterl", "bowglenfend", "auralistone", "dawnmarward", "nalinstonge"},
		[12] = {"drampertmaer", "pureironfire", "sygreglowren"},
		[13] = {"sygremarblade", "auralialychen"},
		[14] = {"lynironmaldawn", "laynebrighglow", "nalironmarward"},
		[15] = {"flamefyreplough", "sterlglensturge", "fairlaynesturge", "brighstelledawn", "helmmardawnfend", "bronsstellaglow", "drammarfairward", "ironsturgebrigh"},
		[16] = {"warbladeaurafend", "dawntruefairward", "vaefiretrueblaze", "valfendbrighhelm"},
		[17] = {"fiercemarwardglow", "sterlsigremarward", "truebrighglowward"},
		[18] = {"truepykestrongiron", "fayrglenwardsturge", "warsterlstrikeward"},
		["hasRunes"] = true,
	},


	[L["Nerubian"]] = { -- languageID 307
		[1] = {"a", "s", "x", "j", "k"},
		[2] = {"ah", "hz", "ex", "iz", "ox", "uj", "ji", "vx", "xi", "yz", "kz", "zk", "az"},
		[3] = {"ahj", "tak", "raz", "rak", "nix", "xin", "xor", "ohx", "ahn", "toz", "iko", "ozu", "xif"},
		[4] = {"xizy", "anub", "ixxo", "zish", "xini", "oxin"},
		[5] = {"kahet", "nerub", "tyzix", "xinox", "rakaz"},
		[6] = {"ik'tik", "itzkal"},
		[7] = {"ohj'xin", "tak'ral", "jinitiz"},
		[8] = {"ahz'tazi", "oxitazij"},
		[9] = {"zinixitik"},
		[10] = {"Kraxizinaz"},
		["hasRunes"] = false,
	},

	[L["Sprite"]] = { -- languageID 168
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

	[L["Nerglish"]] = { -- languageID 179
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

	[L["Moonkin"]] = { -- languageID 180
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

	[L["Furbolg"]] = {
		[1] = {"a", "e", "r", "k", "u", "h", "g"},
		[2] = {"gr", "ra", "er", "ku", "kr", "ga", "re", "rr", "na", "ah", "oh", "eh", "en", "ek", "ka"},
		[3] = {"hum", "mum", "bur", "ker", "mur", "esh", "grr", "rrf", "bar", "ark", "gli", "ten", "fur", "toe", "paw", "nap", "rum", "fer", "kah", "kan", "err", "rrr", "gar", "rar", "enn", "ehk"},
		[4] = {"tumb", "snik", "rumb", "grrf", "mumb", "pelt", "burr", "norr", "tang", "furr", "bark", "fluf", "argh", "barb", "murr", "kart", "kert", "humb", "grrr", "pawr", "garr", "tenn", "arkk", "krah", "droo"},
		[5] = {"ka-en", "glimm", "thumb", "thump", "rumbr", "grrarf", "barrk", "grrrr", "krahn", "whirr", "rroar", "mo-on", "ha're", "er'rr", "ar'gh", "ba-rr", "mumbrr"},
		[6] = {"rrargh", "nrronn", "gargrr", "gro'rr", "ten-ra", "brumar", "then'a", "grothr", "whisra"},
		["hasRunes"] = true,
	},

	[L["Hara'ni"]] = {
		[1] = {"Oi",},
		[2] = {"We", "Ti", "Po", "Pi", "Pa", "Or", "Oi", "Ob", "Ni", "Na", "Lo", "Li", "Ke", "Ho", "Hi", "Ha", "Ao",},
		[3] = {"Yin", "Wey", "Shu", "Sho", "Shi", "Pon", "Olu", "Oah", "Noh", "Koh", "Isa", "Hai", "Cho", "Ayo", "Aye",},
		[4] = {"Urao", "Shul", "Shae", "Roon", "Obwe", "Nalo", "Ihna", "Hune", "Hara", "Enoa", "Ayia", "Ahoa",},
		[5] = {"Nahli", "Mahwe", "Kupai", "Hanui", "Ediwa",},
		[6] = {"Oh'lua",},
		[7] = {"Ruahnti", "Keralwe", "Keradwe", "Kao'mal",},
		[8] = {"Ru'ahnii", "Pon'ayia", "Nal'shae", "Koh'ihna", "Aiy'hune",},
		["hasRunes"] = false,
	},
	
};

Lang.LANGUAGE_REPLACEMENTS = LANGUAGE_REPLACEMENTS;


local AlphabetKerning = {
	[L["Arathi"]] = {
		[" "] = {
			width = .5,
			height = 1,
		},
		["'"] = {
			width = .25,
			height = 1,
		},
		["-"] = {
			width = .546875,
			height = 1,
		},
		["A"] = {
			width = .578125,
			height = 1,
		},
		["B"] = {
			width = .625,
			height = 1,
		},
		["C"] = {
			width = .6875,
			height = 1,
		},
		["D"] = {
			width = .625,
			height = 1,
		},
		["E"] = {
			width = .625,
			height = 1,
		},
		["F"] = {
			width = .625,
			height = 1,
		},
		["G"] = {
			width = .5625,
			height = 1,
		},
		["H"] = {
			width = .625,
			height = 1,
		},
		["I"] = {
			width = .625,
			height = 1,
		},
		["J"] = {
			width = .625,
			height = 1,
		},
		["K"] = {
			width = .59375,
			height = 1,
		},
		["L"] = {
			width = .625,
			height = 1,
		},
		["M"] = {
			width = .625,
			height = 1,
		},
		["N"] = {
			width = .625,
			height = 1,
		},
		["O"] = {
			width = .6875,
			height = 1,
		},
		["P"] = {
			width = .625,
			height = 1,
		},
		["Q"] = {
			width = .6875,
			height = 1,
		},
		["R"] = {
			width = .625,
			height = 1,
		},
		["S"] = {
			width = .625,
			height = 1,
		},
		["T"] = {
			width = .59375,
			height = 1,
		},
		["U"] = {
			width = .71875,
			height = 1,
		},
		["V"] = {
			width = .625,
			height = 1,
		},
		["W"] = {
			width = .625,
			height = 1,
		},
		["X"] = {
			width = .625,
			height = 1,
		},
		["Y"] = {
			width = .5625,
			height = 1,
		},
		["Z"] = {
			width = .625,
			height = 1,
		},
	},



	[L["Broker"]] = {
		[" "] = {
			width = .8,
			height = 1,
		},
		["'"] = {
			width = .375,
			height = 1,
		},
		["-"] = {
			width = .625,
			height = 1,
		},
		["A"] = {
			width = .750,
			height = 1,
		},
		["B"] = {
			width = .8125,
			height = 1,
		},
		["C"] = {
			width = .84375,
			height = 1,
		},
		["D"] = {
			width = .9375,
			height = 1,
		},
		["E"] = {
			width = .875,
			height = 1,
		},
		["F"] = {
			width = .875,
			height = 1,
		},
		["G"] = {
			width = 1,
			height = 1,
		},
		["H"] = {
			width = 1,
			height = 1,
		},
		["I"] = {
			width = .9375,
			height = 1,
		},
		["J"] = {
			width = .6875,
			height = 1,
		},
		["K"] = {
			width = .8125,
			height = 1,
		},
		["L"] = {
			width = .78125,
			height = 1,
		},
		["M"] = {
			width = .8125,
			height = 1,
		},
		["N"] = {
			width = 1,
			height = 1,
		},
		["O"] = {
			width = .875,
			height = 1,
		},
		["P"] = {
			width = .84375,
			height = 1,
		},
		["Q"] = {
			width = .875,
			height = 1,
		},
		["R"] = {
			width = .9375,
			height = 1,
		},
		["S"] = {
			width = 1,
			height = 1,
		},
		["T"] = {
			width = 1,
			height = 1,
		},
		["U"] = {
			width = .90625,
			height = 1,
		},
		["V"] = {
			width = .500,
			height = 1,
		},
		["W"] = {
			width = .90625,
			height = 1,
		},
		["X"] = {
			width = .9375,
			height = 1,
		},
		["Y"] = {
			width = .750,
			height = 1,
		},
		["Z"] = {
			width = .90625,
			height = 1,
		},
	},



	[L["Zandali"]] = {
		[" "] = {
			width = .75,
			height = 1,
		},
		["'"] = {
			width = .234375,
			height = 1,
		},
		["-"] = {
			width = .515625,
			height = 1,
		},
		["A"] = {
			width = .859375,
			height = 1,
		},
		["B"] = {
			width = .890625,
			height = 1,
		},
		["C"] = {
			width = .859375,
			height = 1,
		},
		["D"] = {
			width = .890625,
			height = 1,
		},
		["E"] = {
			width = 1,
			height = 1,
		},
		["F"] = {
			width = .875,
			height = 1,
		},
		["G"] = {
			width = 1,
			height = 1,
		},
		["H"] = {
			width = 1,
			height = 1,
		},
		["I"] = {
			width = .84375,
			height = 1,
		},
		["J"] = {
			width = .734375,
			height = 1,
		},
		["K"] = {
			width = .75,
			height = 1,
		},
		["L"] = {
			width = 1,
			height = 1,
		},
		["M"] = {
			width = .734375,
			height = 1,
		},
		["N"] = {
			width = .890625,
			height = 1,
		},
		["O"] = {
			width = 1,
			height = 1,
		},
		["P"] = {
			width = .8125,
			height = 1,
		},
		["Q"] = {
			width = .828125,
			height = 1,
		},
		["R"] = {
			width = 1,
			height = 1,
		},
		["S"] = {
			width = 1,
			height = 1,
		},
		["T"] = {
			width = .734375,
			height = 1,
		},
		["U"] = {
			width = 1,
			height = 1,
		},
		["V"] = {
			width = .953125,
			height = 1,
		},
		["W"] = {
			width = .90625,
			height = 1,
		},
		["X"] = {
			width = .953125,
			height = 1,
		},
		["Y"] = {
			width = .8125,
			height = 1,
		},
		["Z"] = {
			width = .59375,
			height = 1,
		},
	},



	[L["Thalassian"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .375,
			height = 1,
		},
		["-"] = {
			width = .671875,
			height = 1,
		},
		["A"] = {
			width = 1,
			height = 1,
		},
		["B"] = {
			width = 1,
			height = 1,
		},
		["C"] = {
			width = 1,
			height = 1,
		},
		["D"] = {
			width = .921875,
			height = 1,
		},
		["E"] = {
			width = 1,
			height = 1,
		},
		["F"] = {
			width = 1,
			height = 1,
		},
		["G"] = {
			width = 1,
			height = 1,
		},
		["H"] = {
			width = 1,
			height = 1,
		},
		["I"] = {
			width = 1,
			height = 1,
		},
		["J"] = {
			width = 1,
			height = 1,
		},
		["K"] = {
			width = .859375,
			height = 1,
		},
		["L"] = {
			width = 1,
			height = 1,
		},
		["M"] = {
			width = 1,
			height = 1,
		},
		["N"] = {
			width = 1,
			height = 1,
		},
		["O"] = {
			width = 1,
			height = 1,
		},
		["P"] = {
			width = 1,
			height = 1,
		},
		["Q"] = {
			width = 1,
			height = 1,
		},
		["R"] = {
			width = 1,
			height = 1,
		},
		["S"] = {
			width = .859375,
			height = 1,
		},
		["T"] = {
			width = .953125,
			height = 1,
		},
		["U"] = {
			width = 1,
			height = 1,
		},
		["V"] = {
			width = 1,
			height = 1,
		},
		["W"] = {
			width = 1,
			height = 1,
		},
		["X"] = {
			width = 1,
			height = 1,
		},
		["Y"] = {
			width = 1,
			height = 1,
		},
		["Z"] = {
			width = 1,
			height = 1,
		},
	},



	[L["Taurahe"]] = {
		[" "] = {
			width = .75,
			height = 1,
		},
		["'"] = {
			width = 0.234375,
			height = 1,
		},
		["-"] = {
			width = 0.625,
			height = 1,
		},
		["A"] = {
			width = 0.578125,
			height = 1,
		},
		["B"] = {
			width = 0.609375,
			height = 1,
		},
		["C"] = {
			width = 0.84375,
			height = 1,
		},
		["D"] = {
			width = 0.828125,
			height = 1,
		},
		["E"] = {
			width = 0.734375,
			height = 1,
		},
		["F"] = {
			width = 0.46875,
			height = 1,
		},
		["G"] = {
			width = 0.609375,
			height = 1,
		},
		["H"] = {
			width = 0.828125,
			height = 1,
		},
		["I"] = {
			width = 0.625,
			height = 1,
		},
		["J"] = {
			width = 0.546875,
			height = 1,
		},
		["K"] = {
			width = 0.8125,
			height = 1,
		},
		["L"] = {
			width = 0.640625,
			height = 1,
		},
		["M"] = {
			width = 0.875,
			height = 1,
		},
		["N"] = {
			width = 0.75,
			height = 1,
		},
		["O"] = {
			width = 0.5625,
			height = 1,
		},
		["P"] = {
			width = 0.734375,
			height = 1,
		},
		["Q"] = {
			width = 0.609375,
			height = 1,
		},
		["R"] = {
			width = 0.671875,
			height = 1,
		},
		["S"] = {
			width = 1,
			height = 1,
		},
		["T"] = {
			width = 0.75,
			height = 1,
		},
		["U"] = {
			width = 0.828125,
			height = 1,
		},
		["V"] = {
			width = 0.796875,
			height = 1,
		},
		["W"] = {
			width = 0.484375,
			height = 1,
		},
		["X"] = {
			width = 0.671875,
			height = 1,
		},
		["Y"] = {
			width = 0.71875,
			height = 1,
		},
		["Z"] = {
			width = 0.703125,
			height = 1,
		},
	},



	[L["Shath'Yar"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .375,
			height = 1,
		},
		["-"] = {
			width = 1,
			height = 1,
		},
		["A"] = {
			width = .8125,
			height = 1,
		},
		["B"] = {
			width = .84375,
			height = 1,
		},
		["C"] = {
			width = 1,
			height = 1,
		},
		["D"] = {
			width = .59375,
			height = 1,
		},
		["E"] = {
			width = .703125,
			height = 1,
		},
		["F"] = {
			width = .84375,
			height = 1,
		},
		["G"] = {
			width = 1,
			height = 1,
		},
		["H"] = {
			width = .640625,
			height = 1,
		},
		["I"] = {
			width = 1,
			height = 1,
		},
		["J"] = {
			width = 1,
			height = 1,
		},
		["K"] = {
			width = .78125,
			height = 1,
		},
		["L"] = {
			width = 1,
			height = 1,
		},
		["M"] = {
			width = .765625,
			height = 1,
		},
		["N"] = {
			width = 1,
			height = 1,
		},
		["O"] = {
			width = 1,
			height = 1,
		},
		["P"] = {
			width = .71875,
			height = 1,
		},
		["Q"] = {
			width = .59375,
			height = 1,
		},
		["R"] = {
			width = .75,
			height = 1,
		},
		["S"] = {
			width = .6875,
			height = 1,
		},
		["T"] = {
			width = .5625,
			height = 1,
		},
		["U"] = {
			width = .84375,
			height = 1,
		},
		["V"] = {
			width = .9375,
			height = 1,
		},
		["W"] = {
			width = 1,
			height = 1,
		},
		["X"] = {
			width = 1,
			height = 1,
		},
		["Y"] = {
			width = 1,
			height = 1,
		},
		["Z"] = {
			width = .6875,
			height = 1,
		},
	},



	[L["Common"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .250,
			height = 1,
		},
		["-"] = {
			width = .5625,
			height = 1,
		},
		["A"] = {
			width = .500,
			height = 1,
		},
		["B"] = {
			width = .5625,
			height = 1,
		},
		["C"] = {
			width = .625,
			height = 1,
		},
		["D"] = {
			width = .625,
			height = 1,
		},
		["E"] = {
			width = .625,
			height = 1,
		},
		["F"] = {
			width = .750,
			height = 1,
		},
		["G"] = {
			width = .625,
			height = 1,
		},
		["H"] = {
			width = .625,
			height = 1,
		},
		["I"] = {
			width = .250,
			height = 1,
		},
		["J"] = {
			width = 1,
			height = 1,
		},
		["K"] = {
			width = .625,
			height = 1,
		},
		["L"] = {
			width = .375,
			height = 1,
		},
		["M"] = {
			width = .625,
			height = 1,
		},
		["N"] = {
			width = .5625,
			height = 1,
		},
		["O"] = {
			width = .500,
			height = 1,
		},
		["P"] = {
			width = .5625,
			height = 1,
		},
		["Q"] = {
			width = .90625,
			height = 1,
		},
		["R"] = {
			width = .59375,
			height = 1,
		},
		["S"] = {
			width = .59375,
			height = 1,
		},
		["T"] = {
			width = .5625,
			height = 1,
		},
		["U"] = {
			width = .4375,
			height = 1,
		},
		["V"] = {
			width = .5625,
			height = 1,
		},
		["W"] = {
			width = .65625,
			height = 1,
		},
		["X"] = {
			width = .90625,
			height = 1,
		},
		["Y"] = {
			width = .625,
			height = 1,
		},
		["Z"] = {
			width = .750,
			height = 1,
		},
	},


	[L["Cypher"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .3125,
			height = 1,
		},
		["-"] = {
			width = .3125,
			height = 1,
		},
		["A"] = {
			width = .3125,
			height = 1,
		},
		["B"] = {
			width = .8125,
			height = 1,
		},
		["C"] = {
			width = .84375,
			height = 1,
		},
		["D"] = {
			width = .90625,
			height = 1,
		},
		["E"] = {
			width = .90625,
			height = 1,
		},
		["F"] = {
			width = .84375,
			height = 1,
		},
		["G"] = {
			width = 1,
			height = 1,
		},
		["H"] = {
			width = .875,
			height = 1,
		},
		["I"] = {
			width = 1,
			height = 1,
		},
		["J"] = {
			width = 1,
			height = 1,
		},
		["K"] = {
			width = 1,
			height = 1,
		},
		["L"] = {
			width = .71875,
			height = 1,
		},
		["M"] = {
			width = .90625,
			height = 1,
		},
		["N"] = {
			width = .78125,
			height = 1,
		},
		["O"] = {
			width = .875,
			height = 1,
		},
		["P"] = {
			width = .53125,
			height = 1,
		},
		["Q"] = {
			width = 1,
			height = 1,
		},
		["R"] = {
			width = .78125,
			height = 1,
		},
		["S"] = {
			width = 1,
			height = 1,
		},
		["T"] = {
			width = .59375,
			height = 1,
		},
		["U"] = {
			width = .625,
			height = 1,
		},
		["V"] = {
			width = .46875,
			height = 1,
		},
		["W"] = {
			width = 1,
			height = 1,
		},
		["X"] = {
			width = .875,
			height = 1,
		},
		["Y"] = {
			width = 1,
			height = 1,
		},
		["Z"] = {
			width = .59375,
			height = 1,
		},
	},



	[L["Darnassian"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .250,
			height = 1,
		},
		["-"] = {
			width = .59375,
			height = 1,
		},
		["A"] = {
			width = .90625,
			height = 1,
		},
		["B"] = {
			width = .71875,
			height = 1,
		},
		["C"] = {
			width = 1,
			height = 1,
		},
		["D"] = {
			width = .59375,
			height = 1,
		},
		["E"] = {
			width = .5625,
			height = 1,
		},
		["F"] = {
			width = .46875,
			height = 1,
		},
		["G"] = {
			width = 1,
			height = 1,
		},
		["H"] = {
			width = .625,
			height = 1,
		},
		["I"] = {
			width = .5625,
			height = 1,
		},
		["J"] = {
			width = .625,
			height = 1,
		},
		["K"] = {
			width = .625,
			height = 1,
		},
		["L"] = {
			width = .65625,
			height = 1,
		},
		["M"] = {
			width = .500,
			height = 1,
		},
		["N"] = {
			width = .500,
			height = 1,
		},
		["O"] = {
			width = .375,
			height = 1,
		},
		["P"] = {
			width = .90625,
			height = 1,
		},
		["Q"] = {
			width = .90625,
			height = 1,
		},
		["R"] = {
			width = .65625,
			height = 1,
		},
		["S"] = {
			width = .875,
			height = 1,
		},
		["T"] = {
			width = .875,
			height = 1,
		},
		["U"] = {
			width = 1,
			height = 1,
		},
		["V"] = {
			width = .5625,
			height = 1,
		},
		["W"] = {
			width = .78125,
			height = 1,
		},
		["X"] = {
			width = .8125,
			height = 1,
		},
		["Y"] = {
			width = .625,
			height = 1,
		},
		["Z"] = {
			width = .750,
			height = 1,
		},
	},



	[L["Draenei"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .28125,
			height = 1,
		},
		["-"] = {
			width = .90625,
			height = 1,
		},
		["A"] = {
			width = .875,
			height = 1,
		},
		["B"] = {
			width = .90625,
			height = 1,
		},
		["C"] = {
			width = .90625,
			height = 1,
		},
		["D"] = {
			width = .78125,
			height = 1,
		},
		["E"] = {
			width = .6875,
			height = 1,
		},
		["F"] = {
			width = .875,
			height = 1,
		},
		["G"] = {
			width = .65625,
			height = 1,
		},
		["H"] = {
			width = .875,
			height = 1,
		},
		["I"] = {
			width = .90625,
			height = 1,
		},
		["J"] = {
			width = .90625,
			height = 1,
		},
		["K"] = {
			width = .90625,
			height = 1,
		},
		["L"] = {
			width = .6875,
			height = 1,
		},
		["M"] = {
			width = .90625,
			height = 1,
		},
		["N"] = {
			width = .71875,
			height = 1,
		},
		["O"] = {
			width = .8125,
			height = 1,
		},
		["P"] = {
			width = .90625,
			height = 1,
		},
		["Q"] = {
			width = .84375,
			height = 1,
		},
		["R"] = {
			width = .875,
			height = 1,
		},
		["S"] = {
			width = .875,
			height = 1,
		},
		["T"] = {
			width = .6875,
			height = 1,
		},
		["U"] = {
			width = .84375,
			height = 1,
		},
		["V"] = {
			width = .6875,
			height = 1,
		},
		["W"] = {
			width = .90625,
			height = 1,
		},
		["X"] = {
			width = .90625,
			height = 1,
		},
		["Y"] = {
			width = .90625,
			height = 1,
		},
		["Z"] = {
			width = .875,
			height = 1,
		},
	},



	[L["Dwarvish"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .250,
			height = 1,
		},
		["-"] = {
			width = .28125,
			height = 1,
		},
		["A"] = {
			width = 1,
			height = 1,
		},
		["B"] = {
			width = .625,
			height = 1,
		},
		["C"] = {
			width = .8125,
			height = 1,
		},
		["D"] = {
			width = .90625,
			height = 1,
		},
		["E"] = {
			width = .90625,
			height = 1,
		},
		["F"] = {
			width = 1,
			height = 1,
		},
		["G"] = {
			width = .625,
			height = 1,
		},
		["H"] = {
			width = .53125,
			height = 1,
		},
		["I"] = {
			width = .500,
			height = 1,
		},
		["J"] = {
			width = .500,
			height = 1,
		},
		["K"] = {
			width = .500,
			height = 1,
		},
		["L"] = {
			width = .65625,
			height = 1,
		},
		["M"] = {
			width = .65625,
			height = 1,
		},
		["N"] = {
			width = .750,
			height = 1,
		},
		["O"] = {
			width = .65625,
			height = 1,
		},
		["P"] = {
			width = .5625,
			height = 1,
		},
		["Q"] = {
			width = .500,
			height = 1,
		},
		["R"] = {
			width = .5625,
			height = 1,
		},
		["S"] = {
			width = .6875,
			height = 1,
		},
		["T"] = {
			width = .500,
			height = 1,
		},
		["U"] = {
			width = .5625,
			height = 1,
		},
		["V"] = {
			width = .625,
			height = 1,
		},
		["W"] = {
			width = .90625,
			height = 1,
		},
		["X"] = {
			width = 1,
			height = 1,
		},
		["Y"] = {
			width = .71875,
			height = 1,
		},
		["Z"] = {
			width = .500,
			height = 1,
		},
	},



	[L["Furbolg"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		
		["'"] = {
			width = .34375,
			height = 1,
		},
		["-"] = {
			width = .8125,
			height = 1,
		},
		["A"] = {
			width = .40625,
			height = 1,
		},
		["B"] = {
			width = .625,
			height = 1,
		},
		["C"] = {
			width = .90625,
			height = 1,
		},
		["D"] = {
			width = .5625,
			height = 1,
		},
		["E"] = {
			width = 1,
			height = 1,
		},
		["F"] = {
			width = .6875,
			height = 1,
		},
		["G"] = {
			width = 1,
			height = 1,
		},
		["H"] = {
			width = 1,
			height = 1,
		},
		["I"] = {
			width = 1,
			height = 1,
		},
		["J"] = {
			width = .8125,
			height = 1,
		},
		["K"] = {
			width = .71875,
			height = 1,
		},
		["L"] = {
			width = .625,
			height = 1,
		},
		["M"] = {
			width = .59375,
			height = 1,
		},
		["N"] = {
			width = .625,
			height = 1,
		},
		["O"] = {
			width = .8125,
			height = 1,
		},
		["P"] = {
			width = 1,
			height = 1,
		},
		["Q"] = {
			width = .90625,
			height = 1,
		},
		["R"] = {
			width = .71875,
			height = 1,
		},
		["S"] = {
			width = .8125,
			height = 1,
		},
		["T"] = {
			width = .500,
			height = 1,
		},
		["U"] = {
			width = 1,
			height = 1,
		},
		["V"] = {
			width = .875,
			height = 1,
		},
		["W"] = {
			width = .750,
			height = 1,
		},
		["X"] = {
			width = .675,
			height = 1,
		},
		["Y"] = {
			width = .875,
			height = 1,
		},
		["Z"] = {
			width = .90625,
			height = 1,
		},
	},



	[L["Orcish"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .750,
			height = 1,
		},
		["-"] = {
			width = .625,
			height = 1,
		},
		["A"] = {
			width = .875,
			height = 1,
		},
		["B"] = {
			width = .8125,
			height = 1,
		},
		["C"] = {
			width = .875,
			height = 1,
		},
		["D"] = {
			width = .875,
			height = 1,
		},
		["E"] = {
			width = .90625,
			height = 1,
		},
		["F"] = {
			width = .875,
			height = 1,
		},
		["G"] = {
			width = .875,
			height = 1,
		},
		["H"] = {
			width = 1,
			height = 1,
		},
		["I"] = {
			width = .875,
			height = 1,
		},
		["J"] = {
			width = 1,
			height = 1,
		},
		["K"] = {
			width = 1,
			height = 1,
		},
		["L"] = {
			width = .90625,
			height = 1,
		},
		["M"] = {
			width = 1,
			height = 1,
		},
		["N"] = {
			width = .90625,
			height = 1,
		},
		["O"] = {
			width = .875,
			height = 1,
		},
		["P"] = {
			width = 1,
			height = 1,
		},
		["Q"] = {
			width = .750,
			height = 1,
		},
		["R"] = {
			width = 1,
			height = 1,
		},
		["S"] = {
			width = 1,
			height = 1,
		},
		["T"] = {
			width = .90625,
			height = 1,
		},
		["U"] = {
			width = 1,
			height = 1,
		},
		["V"] = {
			width = 1,
			height = 1,
		},
		["W"] = {
			width = 1,
			height = 1,
		},
		["X"] = {
			width = 1,
			height = 1,
		},
		["Y"] = {
			width = .750,
			height = 1,
		},
		["Z"] = {
			width = .875,
			height = 1,
		},
	},



	[L["Pandaren"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .250,
			height = 1,
		},
		["-"] = {
			width = .78125,
			height = 1,
		},
		["A"] = {
			width = .71875,
			height = 1,
		},
		["B"] = {
			width = .8125,
			height = 1,
		},
		["C"] = {
			width = .8125,
			height = 1,
		},
		["D"] = {
			width = .84375,
			height = 1,
		},
		["E"] = {
			width = .750,
			height = 1,
		},
		["F"] = {
			width = .8125,
			height = 1,
		},
		["G"] = {
			width = .8125,
			height = 1,
		},
		["H"] = {
			width = .750,
			height = 1,
		},
		["I"] = {
			width = .750,
			height = 1,
		},
		["J"] = {
			width = .6875,
			height = 1,
		},
		["K"] = {
			width = .875,
			height = 1,
		},
		["L"] = {
			width = .750,
			height = 1,
		},
		["M"] = {
			width = .90625,
			height = 1,
		},
		["N"] = {
			width = .8125,
			height = 1,
		},
		["O"] = {
			width = .750,
			height = 1,
		},
		["P"] = {
			width = .90625,
			height = 1,
		},
		["Q"] = {
			width = .750,
			height = 1,
		},
		["R"] = {
			width = .90625,
			height = 1,
		},
		["S"] = {
			width = .750,
			height = 1,
		},
		["T"] = {
			width = .90625,
			height = 1,
		},
		["U"] = {
			width = .875,
			height = 1,
		},
		["V"] = {
			width = .90625,
			height = 1,
		},
		["W"] = {
			width = .8125,
			height = 1,
		},
		["X"] = {
			width = .8125,
			height = 1,
		},
		["Y"] = {
			width = .8125,
			height = 1,
		},
		["Z"] = {
			width = .6875,
			height = 1,
		},
	},



	[L["Shalassian"]] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = .34375,
			height = 1,
		},
		["-"] = {
			width = .8125,
			height = 1,
		},
		["A"] = {
			width = .875,
			height = 1,
		},
		["B"] = {
			width = .625,
			height = 1,
		},
		["C"] = {
			width = 1,
			height = 1,
		},
		["D"] = {
			width = .750,
			height = 1,
		},
		["E"] = {
			width = .625,
			height = 1,
		},
		["F"] = {
			width = .625,
			height = 1,
		},
		["G"] = {
			width = .5625,
			height = 1,
		},
		["H"] = {
			width = .875,
			height = 1,
		},
		["I"] = {
			width = .6875,
			height = 1,
		},
		["J"] = {
			width = .5625,
			height = 1,
		},
		["K"] = {
			width = .4375,
			height = 1,
		},
		["L"] = {
			width = .90625,
			height = 1,
		},
		["M"] = {
			width = .59375,
			height = 1,
		},
		["N"] = {
			width = 1,
			height = 1,
		},
		["O"] = {
			width = .750,
			height = 1,
		},
		["P"] = {
			width = .5625,
			height = 1,
		},
		["Q"] = {
			width = .875,
			height = 1,
		},
		["R"] = {
			width = .8125,
			height = 1,
		},
		["S"] = {
			width = .8125,
			height = 1,
		},
		["T"] = {
			width = .875,
			height = 1,
		},
		["U"] = {
			width = 1,
			height = 1,
		},
		["V"] = {
			width = .5625,
			height = 1,
		},
		["W"] = {
			width = 1,
			height = 1,
		},
		["X"] = {
			width = 1,
			height = 1,
		},
		["Y"] = {
			width = .65625,
			height = 1,
		},
		["Z"] = {
			width = .625,
			height = 1,
		},
	},

	--[[
	["PLACEHOLDER"] = {
		[" "] = {
			width = 1,
			height = 1,
		},
		["'"] = {
			width = 1,
			height = 1,
		},
		["-"] = {
			width = 1,
			height = 1,
		},
		["A"] = {
			width = 1,
			height = 1,
		},
		["B"] = {
			width = 1,
			height = 1,
		},
		["C"] = {
			width = 1,
			height = 1,
		},
		["D"] = {
			width = 1,
			height = 1,
		},
		["E"] = {
			width = 1,
			height = 1,
		},
		["F"] = {
			width = 1,
			height = 1,
		},
		["G"] = {
			width = 1,
			height = 1,
		},
		["H"] = {
			width = 1,
			height = 1,
		},
		["I"] = {
			width = 1,
			height = 1,
		},
		["J"] = {
			width = 1,
			height = 1,
		},
		["K"] = {
			width = 1,
			height = 1,
		},
		["L"] = {
			width = 1,
			height = 1,
		},
		["M"] = {
			width = 1,
			height = 1,
		},
		["N"] = {
			width = 1,
			height = 1,
		},
		["O"] = {
			width = 1,
			height = 1,
		},
		["P"] = {
			width = 1,
			height = 1,
		},
		["Q"] = {
			width = 1,
			height = 1,
		},
		["R"] = {
			width = 1,
			height = 1,
		},
		["S"] = {
			width = 1,
			height = 1,
		},
		["T"] = {
			width = 1,
			height = 1,
		},
		["U"] = {
			width = 1,
			height = 1,
		},
		["V"] = {
			width = 1,
			height = 1,
		},
		["W"] = {
			width = 1,
			height = 1,
		},
		["X"] = {
			width = 1,
			height = 1,
		},
		["Y"] = {
			width = 1,
			height = 1,
		},
		["Z"] = {
			width = 1,
			height = 1,
		},
	},
	]]

};

Lang.AlphabetKerning = AlphabetKerning;