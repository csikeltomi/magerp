FixBlips = {
  -- Example {title="", colour=, id=, x=, y=, z=},
-- Postes de polices
  {title="Ház",safe = false, colour=29, id=40,x = 387.29586791992,   y = 3.1076402664185, z = 91.415824890137},
  {title="Ház",safe = false, colour=5, id=40,x = -1550.427734375,   y = 210.12954711914, z = 58.855800628662},
  {title="Ház",safe = false, colour=1, id=40,x = 2520.8088378906,   y = -415.9889831543, z = 94.124420166016},
  {title="Ház",safe = false, colour=2, id=40,x = 1078.8021240234,   y = -689.06921386719, z = 57.618068695068},
  {title="Bahama Mamas",safe = true, colour=2, id=93,x = -1388.2147216797,   y = -587.02972412109, z = 30.217758178711},
  {title="Élet templom",safe = true, colour=1, id=674,x = -806.70703125,   y = 175.46215820313, z = 76.740798950195},
  {title="Idö templom",safe = true, colour=5, id=674,x = -1803.7697753906,   y = 428.90768432617, z = 132.31079101563},
  {title="Ös templom",safe = true, colour=3, id=674,x = -1889.4301757813,   y = 2065.2863769531, z = 140.98413085938},
  {title="Gyógyító templom",safe = true, colour=2, id=674,x = -892.73822021484,   y = -1454.9733886719, z = 7.5268158912659},
}

Citizen.CreateThread(function()

  for _, info in pairs(FixBlips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.9)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)
