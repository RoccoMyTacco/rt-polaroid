# RT-polaroid

# Items

["polaroid"] 		 	 		= {["name"] = "polaroid", 						["label"] = "Polaroid Camera", 			["weight"] = 1000, 	["type"] = "item", 			["image"] = "polaroid png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "Hey cool camera bro or bro-et"},
["polaroidfilm"] 			 	= {["name"] = "polaroidfilm", 			 	  	["label"] = "Polaroid", 				["weight"] = 20, 	["type"] = "item", 			["image"] = "pitem.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A perfectly taken photo.. wonder what this one is?"},
["yellowfilm"] 			 		= {["name"] = "yellowfilm", 					["label"] = "Pack of Yellow Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["orangefilm"] 			 		= {["name"] = "orangefilm", 					["label"] = "Pack of Orange Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["greyfilm"] 			 		= {["name"] = "greyfilm", 						["label"] = "Pack of Grey Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["blackfilm"] 			 		= {["name"] = "blackfilm", 						["label"] = "Pack of Black Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["pureblackfilm"] 			 	= {["name"] = "pureblackfilm", 					["label"] = "Pack of PBlack Film", 	["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["lightbluefilm"] 			 	= {["name"] = "lightbluefilm", 					["label"] = "Pack of LBlue Film", 	["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["greenfilm"] 			 		= {["name"] = "greenfilm", 						["label"] = "Pack of Green Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["pinkfilm"] 			 		= {["name"] = "pinkfilm", 						["label"] = "Pack of Pink Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["redfilm"] 			 		= {["name"] = "redfilm", 						["label"] = "Pack of Red Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["bluefilm"] 			 		= {["name"] = "bluefilm", 						["label"] = "Pack of Blue Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["purpfilm"] 			 		= {["name"] = "purpfilm", 						["label"] = "Pack of Purple Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["byefilm"] 			 		= {["name"] = "byefilm", 						["label"] = "Pack of Yellow Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},
["randfilm"] 			 		= {["name"] = "randfilm", 						["label"] = "Pack of Random Film", 		["weight"] = 20, 	["type"] = "item", 			["image"] = "pfilm.png", 				["unique"] = true, 		["useable"] = true, 		["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "A pack of 5 films"},

# New Items

To Create a new film you need to name the .png to "film" followed by the next number ie "film13.png" and so on. When you create the new item in the sv_configable you then take the number you put after film and put it at the end of rt-polaroid:client:use-film.