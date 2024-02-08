--[[
The program will launch the function "story" with the button label as argument.

The following functions have been exposed to lua:

	set the background to the texture in the folder textures (JPG):
		setBackground(string aPath);
		
	add a button to the current screen:
		createButton(string areaName, string buttonText);

	add a textfield to the top of the screen:
		createTextfield(string text);
	
	Clear the screen:
		CLS();
		
	Exit the game:
		exitGame();
	
	Play a sound (wav) in the folder sounds:
		playSound(string aPath);
		
	Play music (wav) in the folder music:
		playMusic(string aPath);
		
	----------------------------------------------------------------------------------------------------------
	
	SYNTAX:
		LUA does not use many special characters but does accept some.
		
		Example:
		if(aName == "start") then
			playMusic("background.wav")
		end
		
	----------------------------------------------------------------------------------------------------------
		
		LUA also accepts variables in global scope and are interpreted during runtime
		
		Example:
		
		entered = false
		number = 5;
		
		and they can be used like any other variable:
		if(entered == false) then
			playSound("door.wav")
		end
	
	---------------------------------------------------------------------------------------------------------
]]--

entered = false;
hasKey = false;
unlockedDoor = false;

function story(aName)
    if(aName == "start") then
        playSound("storm.wav")
        setBackground("Castle.jpg")
        createTextfield("Caught in a storm, you seek refuge in a mysterious castle. \nA dark cloud hovers over the land. What will you do?")
        createButton("exit", "Decide this might be the right time to go back to top lane.")
        createButton("entrance", "Enter the Castle")
    end
    if(aName == "entrance") then
        if(entered == false) then
            playSound("door.wav")
            entered = true;
        else
            playSound("footstep.wav")
        end
        CLS();
        setBackground("entrance.jpg");
        createTextfield("You've entered an eerie hallway, dimly lit by flickering candles.\nYou see a magical door at the top of the stairs.")
        createButton("leftHallway", "Go left towards a faint light");
        createButton("rightHallway", "Go right, where shadows dance");
        createButton("upStairs", "Ascend the grand staircase");
        if(hasKey == true and unlockedDoor == false) then
            createButton("unlockDoor", "Use the rusty key to unlock the mysterious door")
        end
    end
    if(aName == "leftHallway") then
        playSound("footstep.wav")
        CLS();
        setBackground("Darkroom.jpg")
        createTextfield("You discover a room. There might be a key somewhere?.")
        createButton("entrance", "Return to the hallway");
        if(hasKey == false) then
            createButton("searchRoom", "Search the room for a key to the mysterious door")
        end
    end
    if(aName == "searchRoom") then
        CLS();
        playSound("rummage.wav")
        createTextfield("You find a rusty key hidden among the artifacts.")
        createButton("entrance", "Return to the hallway")
        hasKey = true;
    end
    if(aName == "rightHallway") then
        CLS()
        playSound("footstep.wav")
        setBackground("Scaryroom.jpg")
        createTextfield("You enter a dark chamber,\n you search for the key but you find nothing.")
        createButton("entrance", "Leave the ominous chamber")
    end
    if(aName == "unlockDoor") then
        CLS()
        playSound("door.wav")
        setBackground("magicaldoor.jpg")
        createTextfield("The rusty key fits perfectly, unlocking the mysterious door.")
        unlockedDoor = true;
        createButton("entrance", "Return to the hallway")
        createButton("upStairs", "Enter the mysterious room")
    end
    if(aName == "upStairs") then
        CLS()
        playSound("footstep.wav")
        if(unlockedDoor == true) then
            setBackground("mystical.jpg")
            playSound("Mystical.wav")
            createTextfield("You reach an enchanted room, where a mystical being awaits.")
            createButton("unlockPotential", "Choose to unlock your full potential")
            createButton("worldEnder", "Embrace the role of the World Ender")
        else
            setBackground("Hallway.jpg")
            createTextfield("You encounter a sinister presence that blocks your path.")
            createButton("exit", "Confront the sinister presence and face the consequences")
        end
    end
    if(aName == "unlockPotential") then
        CLS()
        playSound("mysterious.wav")
        setBackground("fullpotential.jpg")
        createTextfield("The mystical being empowers you, unlocking your full potential.")
        createButton("exit", "Embrace the newfound power and leave the enchanted room")
    end
    if(aName == "worldEnder") then
        CLS()
        playSound("worldEnder.wav")
        setBackground("worldEnder.jpg")
        createTextfield("You accept the role of the World Ender, destined to bring destruction.")
        createButton("exit", "Embrace the darkness and leave the enchanted room")
    end
    if(aName == "exit") then
        exitGame();
    end
end




