ESX=nil;Citizen.CreateThread(function()while ESX==nil do TriggerEvent("esx:getSharedObject",function(a)ESX=a end)Citizen.Wait(0)end end)Citizen.CreateThread(function()RequestModel("hei_prop_hei_cash_trolly_01")RequestModel("v_61_lng_mesh_fireplace")Citizen.Wait(100)Trolley1=CreateObject(269934519,257.44,215.07,100.68,1,0,0)fire=CreateObject(845861283,224.2399597168,209.16255187988,105.53018951416,1,0,0)Trolley2=CreateObject(269934519,262.34,213.28,100.68,1,0,0)Trolley3=CreateObject(269934519,263.45,216.05,100.68,1,0,0)local b=GetEntityHeading(Trolley3)SetEntityHeading(Trolley3,b+150)RequestModel("hei_prop_hei_cash_trolly_01")RequestModel("ch_prop_gold_trolly_01a")Citizen.Wait(100)Trolley1=CreateObject(269934519,257.44,215.07,100.68,1,0,0)Trolley2=CreateObject(269934519,262.34,213.28,100.68,1,0,0)Trolley3=CreateObject(269934519,263.45,216.05,100.68,1,0,0)Trolley4=CreateObject(2007413986,266.02,215.34,100.68,1,0,0)Trolley5=CreateObject(881130828,265.11,212.05,100.68,1,0,0)local b=GetEntityHeading(Trolley3)local c=GetEntityHeading(Trolley4)SetEntityHeading(Trolley3,b+150)SetEntityHeading(Trolley4,c+150)end)
