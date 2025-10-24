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
			Type = "loadstring",
			Parameter = "https://raw.githubusercontent.com/YOUR_GITHUB/XentaurHub/main/asli.lua"
		}
	}
})

-- Deteksi key yang dipakai dan simpan ke _G
task.wait(0.5)
local KeyFile = "XentaurHub/key.txt"
if isfile(KeyFile) then
	_G.CurrentKey = readfile(KeyFile)
else
	_G.CurrentKey = ""
end
