RegisterNetEvent("Dialog:Open")AddEventHandler("Dialog:Open",function(a,b,c)Open(a,b,c)end)function Open(a,b,c)SetNuiFocus(true,true)Wait(500)SendNUIMessage({action='Display',Title=a,text=b,resource=c})end;RegisterNUICallback('Close',function()SetNuiFocus(false,false)end)RegisterNUICallback('Accept',function(d)TriggerEvent(d.resource..":Nui",d.value)end)
