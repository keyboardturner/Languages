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
	"^%[Draconic%]",

	"^%[Demonic%]",
	"^%[Titan%]",
	"^%[Kalimag%]",
	"^%[Shath'Yar%]",
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

	},

	["Pandaren"] = { -- this is probably being reworked entirely.

		[1] = {"om", "nom"},
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
	["^%[Draconic%]"] = "[Draconic]",

	["^%[Demonic%]"] = "[Demonic]",
	["^%[Titan%]"] = "[Titan]",
	["^%[Kalimag%]"] = "[Kalimag]",
	["^%[Shath'Yar%]"] = "[Shath'Yar]",
	--["^%[Sprite%]"] = "[Sprite]",
	--["^%[Nerglish%]"] = "[Nerglish]",
	--["^%[Moonkin%]"] = "[Moonkin]",
	--["^%[Complex Cipher%]"] = "[Complex Cipher]",
	--["^%[Basic Cipher%]"] = "[Basic Cipher]",
	--["^%[Furbolg%]"] = "[Furbolg]",
	--["^%[Ancient Pandaren%]"] = "[Ancient Pandaren]",
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
	["^%[Draconic%]"] = "Draconic",

	["^%[Demonic%]"] = "Demonic",
	["^%[Titan%]"] = "Titan",
	["^%[Kalimag%]"] = "Kalimag",
	["^%[Shath'Yar%]"] = "Shath'Yar",
	--["^%[Sprite%]"] = "Sprite",
	--["^%[Nerglish%]"] = "Nerglish",
	--["^%[Moonkin%]"] = "Moonkin",
	--["^%[Complex Cipher%]"] = "Complex Cipher",
	--["^%[Basic Cipher%]"] = "Basic Cipher",
	--["^%[Furbolg%]"] = "Furbolg",
	--["^%[Ancient Pandaren%]"] = "Ancient Pandaren",
	--["^%[Mogu%]"] = "Mogu",

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