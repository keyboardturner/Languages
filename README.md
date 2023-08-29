# Languages
A work-in-progress addon that aims to bring in "speakable" ingame languages in a lightweight and accessible way.

This addon intentionally only obfuscates messages on the user side. As an example, if a player said "[Orcish] Hello friend", the addon skins it over and the user sees it as "[Orcish] Mokra zugzug" (or some other combination of languages). Non-addon users would not see this obfuscation, and instead see the original message, "[Orcish] Hello friend". This is done for a few reasons **(ie this is NOT what the addon does)**:
1. Obfuscating the messages forces users to install the addon. Not only does this prevent reporting harmful messages, but starting off an addon as an exclusive club will be very difficult to get moving and can create dangerous cliques.
2. Sending translations to players requires addon data. It'd still be miniscule and mostly insignificant, but every bit counts especially in an environment that's high population where user bandwidth may be throttled. This addon intentionally doesn't utilize any addon bandwidth at all. Any information gathered from TRP3 is solely from its API or via Saved Variables. This addon is made simple to intentionally work with other addons like CrossRP and with ingame items like Elixir of Tongues without sending addon data to translate.
3. This isn't a true translator. While a dictionary (is planned), this simply runs words of a certain letter count through a parser. The sole purpose is to match a 3 letter word to another 3 letter word and make sure that the word stays the same every time it's used. This is what is known as the "hash" for this addon, and ensures something like "lol" will always translate to Orcish "kek" instead of randomly choosing "lok", "mok", or any other 3 letter example.
4. This addon doesn't translate true ingame languages. If somebody is speaking genuine Orcish, you as an Alliance player likely won't be able to see this translation. Likewise, this will not translate your own true Shalassian to non-Nightborne. Unfortunately this is just simply a limitation and runs into that area of sending translations via addon messages. If you want to avoid this issue, request that players instead use items like the [Elixir of Tongues](https://www.wowhead.com/item=2460/elixir-of-tongues), join group with the player (grouped messages translate), or OOC speak in Common (or other languages) while IC speaking in another language. Likewise, it's outside of the addon capability to translate ingame languages you don't know, such as an NPC speaking Titan.

There are many things to do:
- ~~Functional conversion of messages into image textures per-character~~
- ~~Convert heiroglyphs into atlas textures~~
- ~~Fix over-character limit issue~~
- Dialect converter (ie "dwarven accent")
- Potentially adjust for "true languages" ie Horde characters speaking Orcish where the language tag isn't actually detected - possibly add option to hide the default language tag
- option to remove language tags from speech bubbles
- Set up profiling system
  - Text color selection option
  - "Languages learned" options
  - TRP3 Profile Integration
  - Heiroglyph toggles
- ~~Build frames for options~~
- Slash commands
- Create dictionary (ie "Giant's Heart" = "Grommash")
- ~~Find decent integration into the UI, minimap button? character tab? skill section?~~
- Figure out how to treat default languages
