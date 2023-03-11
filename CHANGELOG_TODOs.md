# tasks
- please write a better InputControl util module. Add mobile compatibility!
# 0.x

## 0.4 - WORKING
2. [TODO] Port popups
1. [TODO] Create a dialogue inferface

### 0.3.1 - CURRENT (dev)
1. [DONE] fixed Slider to work with standards
   - now it can be called as `Slider {props}

2. [DONE] **CHANGELOG_TODOs.md** fixes
   - now logs now use an ascending oder (1 to bigger, instead of bigger to 1)
   - now each "note" under a log (like this line). Will have an indentation to help visualization
   - added a # 0.x header to indicate all these versions belong inside this version

## 0.3 - CURRENT (main)
1. [DONE] Undertand how wally works
   - it uses your default.project.json and .gitignore to publish
2. [DONE] Publish to wally
3. [DONE] Make a better README.md file
   - just adds a basic installation and usage page. 
4. [DONE] Port my workflow to work with wally

### 0.2.1
1. [DONE] Applied stylua over all the code. Stylized all the way!
2. [DONE] Remove slider Behaviour

## 0.2
1. [DONE] changes to how afui works
   - <!> Objects are actual instances, these can always be changed later.
   - What was previous known as "objects" are now "Behaviours" which can be acquired from afui.Behaviours
   - the new objects use these behaviours. 
   - For making custom objects it is recommended to use the behaviour instead of changing the Object file (because it's gonna be overwritten by package managers)
2. [NOPE] Porting Slider (the behaviour) to work with the new Behaviour/Object workflow.
   - `Slider.lua` is now: `SliderBehaviour.lua` @ inside Assets.Behaviours
   - `testslider.lua` is now: `Slider.lua` @ Assets.Objects
   - finished making the slider behaviour & object 
   - `slidertest.story.lua` is now: `slider.story.lua` @ interface.Assets 
   - `slider.story.lua` now requires an object instead of `Slider.lua` (the old *Object*, which is now at Assets.Objects)
   - Stopped doing this. There is only one Slider.lua in Objects now.
3. [DONE] Adding input controls for the slider
   - Created `InputArea` inside Slider and then detect the inpur from there.
   - I tried implementing a InputControler utility, but it's too complicated for a something that won't always be noticed. Maybe in the future but not now. (issue is that mouseup doesnt detect mouseup if its gone)
   - I have to finish this slider, ffs!
4. [DONE] Again, changes on how it works.
   - I decided having a "behaviour" is just stupid. The whole point was compatibility.
   - However I found myself using Fusion as how it should be, and realised that is way better.
   - Behaviours won't disappear for now, because I think they could be great for certain interfaces, but sliderbehaviour is GONE.
5. [DONE] port, for the last time, Slider.lua
   - Removed SliderBehaviour.lua
   - Implemented the logic inside Slider.lua
6. [DONE] Add the palette module. I NEED IT!
   - added it at "Common"
   - added the nord palette. Specially the white, black and accent. Not colors

## 0.1
1.  [DONE] Make an interface loader
    - new folder "interface" in src, init.client.lua that loads the stuff. in-game its called "Mounter"
    - 2 new folders inside interface: Assets, Screens
    - Inside Assets are most interfaces i make.
    - Inside Screens are the ScreenGuis to put ui interfaces in.
    - Made an example interface, "test.lua", alonside "test.story.lua" (.story for hoarcekat)
2.  [DONE] Figure out how to make afui
    - make a buncha functions that return what I need
    - use a module for effects & objects
    - add them on a New function with fusion.Children
3.  [DONE] Make an inheritable module using fusion (or just use Turbo's)
    - made `RoundCorners()`
4.  [DONE] Write afui to return every needed module
    - done, use a manual setup, Meaning I have to type each new component on the table
    - this way I can see the function params when typing anything.
5.  [NOPE] Think how to make popup work and also port it. 
    - Putting popups aside, it requires a bit more knowledge.
6.  [DONE] fixes
    - the whole module is now at `shared/Common`
    - made a bunch of snippets because they're cool :sunglasses:
7.  [DONE] Add basic constraints
    - added `Padding()`, though I gotta improve it.
8.  [DONE] Make a slider template
    - made a template to fill slider. it can be called with afui.Objects.Slider
    - every interface must have: `self.Body`, `self:Update()`, `self:Destroy()`
9. [DONE] Finish the Slider module (and the slidertest.lua example)
   - however this is the behaviour, not an actual object.
   - this is gonna be changed in the next version.

## 0.0.0
1. [DONE] Setup rojo/aftman/wally/fusion
   - first build
   - loaded aftman, rojo, wally, fusion
2. [DONE] fixes
   - removed selene because I don't see the point if I already have roblox-lsp haha