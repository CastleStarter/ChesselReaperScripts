-- Function: Split selected items at grid and delete every other resulting item 
-- Do odd numbered items 

function main()
local ParentTrack
local SelItem
local ItemCount

if reaper.CountSelectedMediaItems(0) > 0 then -- If there are selected items 
reaper.Main_OnCommandEx(40932, 0 , 0) -- Split items at grid 

ItemCount = reaper.CountSelectedMediaItems(0) -- Count the number of selected items
if ItemCount % 2 == 0 then
ItemCount = ItemCount - 1 -- If we have an even number of items then start from the penultimate item 
end 

for i = ItemCount-1,0, -2 do
SelItem = reaper.GetSelectedMediaItem( 0, i )
if SelItem then 
ParentTrack = reaper.GetMediaItemTrack( SelItem )
reaper.DeleteTrackMediaItem (ParentTrack, SelItem )
end -- If SelItem 
end -- end of for item for loop 
end --If selected items 
end
main()
