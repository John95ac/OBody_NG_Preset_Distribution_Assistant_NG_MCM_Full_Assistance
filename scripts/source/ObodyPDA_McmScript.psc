scriptName ObodyPDA_McmScript extends SKI_ConfigBase

Int buttonAdvancedMCM
Int buttonAbout
Int useImage

function OnConfigOpen()
	Pages = new String[1]
	Pages[0] = "Overview"
endFunction

function OnOptionSelect(Int option)
	if option == buttonAdvancedMCM
		ObodyPDA_NativeScript.ActivateAdvancedMCM()
		ShowMessage("Press OK to activate Advanced Configuration", false)
		debug.Trace("[OBodyPDA] Advanced MCM button pressed", 0)
	elseIf option == buttonAbout
		; No action needed, just informational
	endIf
endFunction

function OnPageReset(String page)
	self.SetCursorFillMode(self.LEFT_TO_RIGHT)
	self.SetCursorPosition(0)
	
	if page == ""
		self.DisplaySplashScreen()
	else
		self.UnloadCustomContent()
		if page == "Overview"
			self.DisplayOverview()
		endIf
	endIf
endFunction

function DisplayOverview()
	self.AddHeaderOption("OBody PDA Settings", 1)
	self.AddHeaderOption("", 1)
	
	buttonAdvancedMCM = self.AddTextOption("Activate Advanced MCM", "", 0)
	self.AddTextOption("Activates the advanced configuration panel", "", 1)

	self.AddEmptyOption()

	buttonAbout = self.AddTextOption("About", "", 0)
	self.AddTextOption("Version 3.0.0", "", 0)
	self.AddTextOption("John95ac: I hope this is useful to you,", "", 1)
	self.AddTextOption("I had fun creating this control interface", "", 1)
	self.AddTextOption("for Skyrim, they have been very useful", "", 1)
	self.AddTextOption("in my games.", "", 1)

	self.AddEmptyOption()
	
	self.AddHeaderOption("About Advanced Configuration", 1)
	self.AddTextOption("Panel with options for NPC monitoring,", "", 1)
	self.AddTextOption("INI configuration, JSON config with backup", "", 1)
	self.AddEmptyOption()
	
	self.AddTextOption("Updatable NPC tracking system with refresh", "", 1)
	self.AddEmptyOption()
	
	self.AddTextOption("Read complete plugins: names, factions,", "", 1)
	self.AddTextOption("IDs and more custom elements", "", 1)
	
	self.AddEmptyOption()
endFunction

function DisplaySplashScreen()
	if useImage == 0
		self.LoadCustomContent("ObodyPDA/OBodyNGPDA1.dds", 0.000000, 0.000000)
		useImage = 1
	elseIf useImage == 1
		self.LoadCustomContent("ObodyPDA/OBodyNGPDA2.dds", 0.000000, 0.000000)
		useImage = 2
	else
		self.LoadCustomContent("ObodyPDA/OBodyNGPDA3.dds", 0.000000, 0.000000)
		useImage = 0
	endIf
endFunction