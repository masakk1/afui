## 0.3
2. [TODO] Create a  
1. [TODO] Create a dialogue inferface

## 0.2
4. [TODO] Publish to wally
3. [TODO] Port my workflow to work with wally
2. [TODO] Undertand how wally works
1. [TODO] Finish the Slider module (and the slidertest.lua example)

## 0.1 - CURRENT
8. [DONE] Make a slider template
- made a template to fill slider. it can be called with afui.Objects.Slider
- every interface must have: `self.Body`, `self:Update()`, `self:Destroy()`

7. [DONE] Add basic constraints
- added `Padding()`, though I gotta improve it.

6. [DONE] fixes
- the whole module is now at `shared/Common`
- made a bunch of snippets because they're cool :sunglasses:

5. [NOPE] Think how to make popup work and also port it. 
- Putting popups aside, it requires a bit more knowledge.

4. [DONE] Write afui to return every needed module
- done, use a manual setup, Meaning I have to type each new component on the table
- this way I can see the function params when typing anything.

3. [DONE] Make an inheritable module using fusion (or just use Turbo's)
- made `RoundCorners()`

2. [DONE] Figure out how to make afui
- make a buncha functions that return what I need
- use a module for effects & objects
- add them on a New function with fusion.Children

1. [DONE] Make an interface loader
- new folder "interface" in src, init.client.lua that loads the stuff. in-game its called "Mounter"
- 2 new folders inside interface: Assets, Screens
- Inside Assets are most interfaces i make.
- Inside Screens are the ScreenGuis to put ui interfaces in.
- Made an example interface, "test.lua", alonside "test.story.lua" (.story for hoarcekat)

# 0.0.0
2. [DONE] fixes
- removed selene because I don't see the point if I already have roblox-lsp haha
1. [DONE] Setup rojo/aftman/wally/fusion
- first build
- loaded aftman, rojo, wally, fusion
