WebSocket=WebSocket or {} ;WebSocket.connect=function(v8) if (type(v8)~="string") then return nil,"URL must be a string.";end if  not (v8:match("^ws://") or v8:match("^wss://")) then return nil,"Invalid WebSocket URL. Must start with 'ws://' or 'wss://'.";end local v9=v8:gsub("^ws://",""):gsub("^wss://","");if ((v9=="") or v9:match("^%s*$")) then return nil,"Invalid WebSocket URL. No host specified.";end return {Send=function(v51) end,Close=function() end,OnMessage={},OnClose={}};end;local v1={};local v2=setmetatable;function setmetatable(v10,v11) local v12=v2(v10,v11);v1[v12]=v11;return v12;end function getrawmetatable(v14) return v1[v14];end function setrawmetatable(v15,v16) local v17=getrawmetatable(v15);table.foreach(v16,function(v52,v53) v17[v52]=v53;end);return v15;end local v3={};function sethiddenproperty(v18,v19,v20) if ( not v18 or (type(v19)~="string")) then error("Failed to set hidden property '"   .. tostring(v19)   .. "' on the object: "   .. tostring(v18) );end v3[v18]=v3[v18] or {} ;v3[v18][v19]=v20;return true;end function gethiddenproperty(v23,v24) if ( not v23 or (type(v24)~="string")) then error("Failed to get hidden property '"   .. tostring(v24)   .. "' from the object: "   .. tostring(v23) );end local v25=(v3[v23] and v3[v23][v24]) or nil ;local v26=true;return v25 or ((v24=="size_xml") and 5) ,v26;end function hookmetamethod(v27,v28,v29) assert((type(v27)=="table") or (type(v27)=="userdata") ,"invalid argument #1 to 'hookmetamethod' (table or userdata expected, got "   .. type(v27)   .. ")" ,2);assert(type(v28)=="string" ,"invalid argument #2 to 'hookmetamethod' (index: string expected, got "   .. type(v27)   .. ")" ,2);assert(type(v29)=="function" ,"invalid argument #3 to 'hookmetamethod' (function expected, got "   .. type(v27)   .. ")" ,2);local v30=v27;local v31=Xeno.debug.getmetatable(v27);v31[v28]=v29;v27=v31;return v30;end function hookmetamethod(v33,v34,v35) local v36=getgenv().getrawmetatable(v33);local v37=v36[v34];v36[v34]=v35;return v37;end debug.getproto=function(v39,v40,v41) local v42=function() return true;end;if v41 then return {v42};else return v42;end end;debug.getconstant=function(v43,v44) local v45={[1]="print",[2]=nil,[3]="Hello, world!"};return v45[v44];end;debug.getupvalues=function(v46) local v47;setfenv(v46,{print=function(v55) v47=v55;end});v46();return {v47};end;debug.getupvalue=function(v48,v49) local v50;setfenv(v48,{print=function(v56) v50=v56;end});v48();return v50;end;
local v0=table;table=v0.clone(v0);table.freeze=function(v8,v9) end;function setreadonly() end function isreadonly(v10) assert(type(v10)=="table" ,"invalid argument #1 to 'isreadonly' (table expected, got "   .. type(v10)   .. ") " ,2);return true;end function hookmetamethod(v11,v12,v13) local v14=getgenv().getrawmetatable(v11);local v15=v14[v12];v14[v12]=v13;return v15;end debug.getupvalue=function(v17,v18) local v19;setfenv(v17,{print=function(v32) v19=v32;end});v17();return v19;end;local v3={};function getcallbackvalue(v20,v21) return v20[v21];end local v4=Instance;Instance=table.clone(Instance);Instance.new=function(v22,v23) if (v22=="BindableFunction") then local v36=v4.new("BindableFunction",v23);local v37=setmetatable({},{__index=function(v38,v39) if (v39=="OnInvoke") then return v3[v36];else return v36[v39];end end,__newindex=function(v40,v41,v42) if (v41=="OnInvoke") then v3[v36]=v42;v36.OnInvoke=v42;else v36[v41]=v42;end end});return v37;else return v4.new(v22,v23);end end;local v6={};local v7=setmetatable;function setmetatable(v24,v25) local v26=v7(v24,v25);v6[v26]=v25;return v26;end function getrawmetatable(v28) return v6[v28];end function setrawmetatable(v29,v30) local v31=getrawmetatable(v29);table.foreach(v30,function(v33,v34) v31[v33]=v34;end);return v29;end
-- INIT END


-- THIS IS THE CONFIG LOADER! DO NOT MODIFY THAT CODE!


local file = readfile("configs/Config.txt") 
if file then
    local ua = file:match("([^\r\n]+)") 
    if ua then
        local uas = ua .. "/ProtonAPI" 
        local oldr = request 
        getgenv().request = function(options)
            if options.Headers then
                options.Headers["User-Agent"] = uas
            else
                options.Headers = {["User-Agent"] = uas}
            end
            local response = oldr(options)
            return response
        end
 
    else
        error("failed to load config")
    end
else
    error("Failed to open config")
end
function printidentity()
	print("Current identity is 8")
 
end
