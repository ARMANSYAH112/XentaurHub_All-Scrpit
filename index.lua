local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Nebula-Softworks/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

-- Deteksi key dari file sebelum window dibuat
_G.CurrentKey = ""
local KeyFile = "XentaurHub/key.txt"

if isfile(KeyFile) then
	local SavedKey = readfile(KeyFile)
	if SavedKey == "ok" or SavedKey == "ArmansyahKeceAnjir" then
		_G.CurrentKey = SavedKey
	end
end

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

-- Update CurrentKey setelah key berhasil divalidasi
if isfile(KeyFile) then
	local SavedKey = readfile(KeyFile)
	_G.CurrentKey = SavedKey
end

-- Load file utama setelah key benar
loadstring(game:HttpGet("https://raw.githubusercontent.com/YOUR_GITHUB/XentaurHub/main/asli.lua", true))()
