local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

-- Storage untuk menyimpan scripts
local SavedScripts = {}
local CurrentKey = _G.CurrentKey or ""

local Window = Luna:GetWindow() or Luna:CreateWindow({
	Name = "XentaurHub",
	Subtitle = nil,
	LogoID = "96513335118849",
	LoadingEnabled = false,
	LoadingTitle = "XentaurHub",
	LoadingSubtitle = "by ArmansyahOfc",

	ConfigSettings = {
		RootFolder = nil,
		ConfigFolder = "XentaurHub"
	}
})

-- Home Tab
Window:CreateHomeTab({
	SupportedExecutors = {},
	DiscordInvite = "1234",
	Icon = 2,
})

-- Tab Add Script
local AddScriptTab = Window:CreateTab({
	Name = "Add Script",
	Icon = "add",
	ImageSource = "Material",
	ShowTitle = true
})

AddScriptTab:CreateParagraph({
	Title = "Add Your Script",
	Text = "Tambahkan script custom kamu disini"
})

local ScriptNameInput = ""
local ScriptCodeInput = ""
local ScriptByInput = ""

AddScriptTab:CreateInput({
	Name = "Nama Script",
	PlaceholderText = "Contoh: Xperi",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		ScriptNameInput = Text
	end,
})

AddScriptTab:CreateInput({
	Name = "Script",
	PlaceholderText = "Contoh: loadstring(game:HttpGet(...))()",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		ScriptCodeInput = Text
	end,
})

AddScriptTab:CreateInput({
	Name = "By",
	PlaceholderText = "Contoh: ArmansyahOfc",
	RemoveTextAfterFocusLost = false,
	Callback = function(Text)
		ScriptByInput = Text
	end,
})

AddScriptTab:CreateButton({
	Name = "+",
	Description = "Tambah script baru",
	Callback = function()
		if ScriptNameInput ~= "" and ScriptCodeInput ~= "" and ScriptByInput ~= "" then
			table.insert(SavedScripts, {
				Name = ScriptNameInput,
				Code = ScriptCodeInput,
				By = ScriptByInput
			})
			Luna:Notification({
				Title = "Berhasil!",
				Content = "Script '" .. ScriptNameInput .. "' berhasil ditambahkan!",
				Image = "check_circle",
				Time = 3
			})
			ScriptNameInput = ""
			ScriptCodeInput = ""
			ScriptByInput = ""
			RefreshAllScriptsTab()
		else
			Luna:Notification({
				Title = "Error!",
				Content = "Semua field harus diisi!",
				Image = "error",
				Time = 3
			})
		end
	end
})

-- Tab All Scripts
local AllScriptsTab = Window:CreateTab({
	Name = "All Script",
	Icon = "list",
	ImageSource = "Material",
	ShowTitle = true
})

local ScriptElements = {}

function RefreshAllScriptsTab()
	for _, element in pairs(ScriptElements) do
		if element and element.Destroy then
			pcall(function() element:Destroy() end)
		end
	end
	ScriptElements = {}
	
	if #SavedScripts == 0 then
		local emptyLabel = AllScriptsTab:CreateLabel({
			Text = "Belum ada script tersimpan",
			Style = 2
		})
		table.insert(ScriptElements, emptyLabel)
	else
		for i, script in ipairs(SavedScripts) do
			local scriptBtn = AllScriptsTab:CreateButton({
				Name = script.Name,
				Description = "By: " .. script.By,
				Callback = function()
					ShowScriptDetail(i, script)
				end
			})
			table.insert(ScriptElements, scriptBtn)
		end
	end
end

function ShowScriptDetail(index, script)
	local DetailTab = Window:CreateTab({
		Name = script.Name .. " Detail",
		Icon = "description",
		ImageSource = "Material",
		ShowTitle = true
	})
	
	DetailTab:CreateButton({
		Name = "Kembali",
		Description = "Kembali ke All Script",
		Callback = function()
			pcall(function() DetailTab:Destroy() end)
		end
	})
	
	DetailTab:CreateLabel({
		Text = "By: " .. script.By,
		Style = 2
	})
	
	DetailTab:CreateLabel({
		Text = "Name Script: " .. script.Name,
		Style = 2
	})
	
	DetailTab:CreateLabel({
		Text = "Script: " .. script.Code,
		Style = 1
	})
	
	DetailTab:CreateButton({
		Name = "Copy Script",
		Description = "Copy script ke clipboard",
		Callback = function()
			setclipboard(script.Code)
			Luna:Notification({
				Title = "Copied!",
				Content = "Script berhasil di copy!",
				Image = "content_copy",
				Time = 2
			})
		end
	})
	
	DetailTab:CreateButton({
		Name = "Execute",
		Description = "Auto run script",
		Callback = function()
			local success, err = pcall(function()
				loadstring(script.Code)()
			end)
			if success then
				Luna:Notification({
					Title = "Success!",
					Content = "Script berhasil dijalankan!",
					Image = "check_circle",
					Time = 3
				})
			else
				Luna:Notification({
					Title = "Error!",
					Content = "Gagal menjalankan script!",
					Image = "error",
					Time = 5
				})
			end
		end
	})
	
	-- Tombol Delete cuma muncul kalau pakai key ArmansyahKeceAnjir
	if CurrentKey == "ArmansyahKeceAnjir" then
		DetailTab:CreateButton({
			Name = "Delete",
			Description = "Hapus script ini",
			Callback = function()
				table.remove(SavedScripts, index)
				Luna:Notification({
					Title = "Deleted!",
					Content = "Script '" .. script.Name .. "' berhasil dihapus!",
					Image = "delete",
					Time = 3
				})
				pcall(function() DetailTab:Destroy() end)
				RefreshAllScriptsTab()
			end
		})
	end
end

RefreshAllScriptsTab()

-- Tab Example (Original)
local Tab = Window:CreateTab({
	Name = "Tab Example",
	Icon = "view_in_ar",
	ImageSource = "Material",
	ShowTitle = true
})

local Paragraph = Tab:CreateParagraph({
	Title = "info",
	Text = "idk how to change icon"
})

local Button = Tab:CreateButton({
	Name = "Button Example!",
	Description = nil,
	Callback = function()
		-- The function that takes place when the button is pressed
	end
})

local ColorPicker = Tab:CreateColorPicker({
	Name = "Color Picker Example",
	Color = Color3.fromRGB(86, 171, 128),
	Flag = "ColorPicker1",
	Callback = function(Value)
		-- The function that takes place every time the color picker is moved/changed
		-- The variable (Value) is a Color3fromRGB value based on which color is selected
	end
}, "ColorPicker")

local Slider = Tab:CreateSlider({
	Name = "Slider Example",
	Range = {0, 200},
	Increment = 5,
	CurrentValue = 100,
	Callback = function(Value)
		-- The function that takes place when the slider changes
		-- The variable (Value) is a number which correlates to the value the slider is currently at
	end
}, "Slider")

local Dropdown = Tab:CreateDropdown({
	Name = "Dropdown Example",
	Description = nil,
	Options = {"Option 1","Option 2"},
	CurrentOption = {"Option 1"},
	MultipleOptions = false,
	SpecialType = nil,
	Callback = function(Options)
		-- The function that takes place when the selected option is changed
		-- If MultipleOptions is true then The variable (Options) is a table of strings for the current selected options. Else, it is a string of the currentoption
	end
}, "Dropdown")

local Toggle = Tab:CreateToggle({
	Name = "Toggle Example",
	Description = nil,
	CurrentValue = false,
	Callback = function(Value)
		-- The function that takes place when the toggle is switched
		-- The variable (Value) is a boolean on whether the toggle is true or false
	end
}, "Toggle")

local Bind = Tab:CreateBind({
	Name = "Bind Example",
	Description = nil,
	CurrentBind = "Q",
	HoldToInteract = false,
	Callback = function(BindState)
		-- The function that takes place when the keybind is pressed
		-- The variable (BindState) is a boolean for whether the Bind is being held or not (HoldToInteract needs to be true) OR it is whether the Bind is active
	end,
	OnChangedCallback = function(Bind)
		-- The function that takes place when the binded key changes
		-- The variable (Bind) is a Enum.KeyCode for the new Binded Key
	end,
}, "Bind")

local Label = Tab:CreateLabel({
	Text = "Label Example",
	Style = 2
})