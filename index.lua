local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

local Window = Luna:CreateWindow({
	Name = "XentaurHub",
	Subtitle = nil,
	LogoID = "96513335118849",
	LoadingEnabled = true,
	LoadingTitle = "XentaurHub",
	LoadingSubtitle = "by ArmansyahOfc",

	ConfigSettings = {
		RootFolder = nil,
		ConfigFolder = "XentaurHub"
	},

	KeySettings = {
		Title = "Xentaur Key",
		Subtitle = "Key System",
		Note = "enter key here",
		SaveInRoot = false,
		SaveKey = true,
		Key = {"ok", "ArmansyahKeceAnjir"},
		SecondAction = {
			Enabled = true,
			Type = "none",
			Parameter = ""
		}
	}
})

-- Deteksi key yang dipakai
_G.CurrentKey = ""
for _, key in ipairs({"ok", "ArmansyahKeceAnjir"}) do
	local KeyFolder = (Window.KeySettings.SaveInRoot and ".Rayfield") or "Rayfield"
	local KeyFile = KeyFolder .. "/" .. Window.KeySettings.FileName .. ".txt"
	
	if isfile(KeyFile) then
		local SavedKey = readfile(KeyFile)
		if SavedKey == key then
			_G.CurrentKey = key
			break
		end
	end
end

-- Load file utama setelah key benar
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_GITHUB/XentaurHub/main/asli.lua", true))()