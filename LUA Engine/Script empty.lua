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
		playMusic("Aatrox.wav")
		setBackground("Castle.jpg")
		createTextfield("Caught in a storm, you seek refuge in a mysterious castle. The clock strikes midnight. In the distance, an old mansion stands. What will you do?")
		createButton("exit", "Decide this might be the right time to jump into that hole a few miles back.")
		createButton("entrance", "Enter the mansion")
	end
	if(aName == "entrance") then
		if(entered == false) then
			playSound("creaky_door.wav")
			entered = true;
		else
			playSound("footstep.wav")
		end
		CLS();
		setBackground("eerieHallway.jpg");
		createTextfield("You've entered an eerie hallway, dimly lit by flickering candles.")
		createButton("leftHallway", "Go left towards a faint light");
		createButton("rightHallway", "Go right, where shadows dance");
		createButton("upStairs", "Ascend the grand staircase");
	end
	if(aName == "leftHallway") then
		playSound("footstep.wav")
		CLS();
		setBackground("hauntedRoom.jpg")
		createTextfield("You discover a room filled with ancient artifacts. A locked door stands in front of you.")
		createButton("entrance", "Return to the hallway");
		if(hasKey == false) then
			createButton("searchRoom", "Search the room for a key")
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
		setBackground("darkChamber.jpg")
		createTextfield("You enter a dark chamber with a foreboding atmosphere.")
		createButton("entrance", "Leave the ominous chamber")
		if(hasKey == true and unlockedDoor == false) then
			createButton("unlockDoor", "Use the rusty key to unlock the mysterious door")
		end
	end
	if(aName == "unlockDoor") then
		CLS()
		playSound("unlock_door.wav")
		createTextfield("The rusty key fits perfectly, unlocking the mysterious door.")
		unlockedDoor = true;
		createButton("entrance", "Return to the hallway")
	end
	if(aName == "upStairs") then
		CLS()
		playSound("footstep.wav")
		if(unlockedDoor == true) then
			setBackground("enchantedRoom.jpg")
			createTextfield("You reach an enchanted room, where a mystical being awaits.")
			createButton("exit", "Embrace the mystical being's offer and unlock your hidden potential")
		else
			setBackground("sinisterRoom.jpg")
			createTextfield("You encounter a sinister presence that blocks your path.")
			createButton("exit", "Confront the sinister presence and face the consequences")
		end
	end
	if(aName == "exit") then
		exitGame();
	end
end


