local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

_G.Bhop = true -- Automatically enable bhop when script is executed

RunService.RenderStepped:Connect(function()
if _G.Bhop == true then
if LocalPlayer.Character ~= nil and UserInputService:IsKeyDown(Enum.KeyCode.Space) and LocalPlayer.PlayerGui.GUI.Main.GlobalChat.Visible == false then
LocalPlayer.Character.Humanoid.Jump = true
local Speed = _G.BhopSpeed or 100
local Dir = Camera.CFrame.LookVector * Vector3.new(1, 0, 1)
local Move = Vector3.new()

Move = UserInputService:IsKeyDown(Enum.KeyCode.W) and Move + Dir or Move
Move = UserInputService:IsKeyDown(Enum.KeyCode.S) and Move - Dir or Move
Move = UserInputService:IsKeyDown(Enum.KeyCode.D) and Move + Vector3.new(-Dir.Z, 0, Dir.X) or Move
Move = UserInputService:IsKeyDown(Enum.KeyCode.A) and Move + Vector3.new(Dir.Z, 0, -Dir.X) or Move
if Move.Unit.X == Move.Unit.X then
Move = Move.Unit
LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(Move.X * Speed, LocalPlayer.Character.HumanoidRootPart.Velocity.Y, Move.Z * Speed)
end
end
end
task.wait()
end)
