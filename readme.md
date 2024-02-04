A free burgershot script that features over 30 items and many different interaction points.

This supports other locations, but the default one is Gabz Burgershot. You'll need to adjust all of the polyzones if you wish to use another MLO with it

# Dependencies:

QBCore
Ox_Inventory
Ox_Lib
Ox_Target

## Installation Guide:

# Job Installation
- First, navigate to your qb-core/shared/jobs.lua and paste in:
```lua
    ['burgershot'] = {
		label = 'Burgershot',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Trainee',
                payment = 100
            },
			['1'] = {
                name = 'Cook',
                payment = 150
            },
			['2'] = {
                name = 'Manager',
				isboss = true,
                payment = 200
            },
            ['3'] = {
                name = 'Owner',
				isboss = true,
                payment = 300
            },
        },
	},
```

# Store Installation OX_INVENTORY
- Navigate to your ox_inventory/data/shops.lua and paste in:
```lua
	burgershot = {
		name = 'Burgershot',
		inventory = {
			{ name = 'rawbeef', price = 10},
			{ name = 'rawchicken', price = 10},
			{ name = 'rawpotato', price = 10},
			{ name = 'rawonion', price = 10},
			{ name = 'rawbacon', price = 10},
			{ name = 'salt', price = 10},
			{ name = 'breadcrumbs', price = 10},
			{ name = 'burgerbun', price = 10},
			{ name = 'cheese', price = 10},
			{ name = 'cola', price = 10},
			{ name = 'emptycup', price = 10},
			{ name = 'coffeebeans', price = 10},
			{ name = 'creamer', price = 10},
			{ name = 'burgerbag', price = 10},
		},
	},
```

# To Go Bag Installation OX_INVENTORY
- Navigate to your ox_inventory/modules/items/containers.lua and paste in the following near line 65:
```lua
setContainerProperties('burgerbag', {
	slots = 10,
	maxWeight = 2500,
	whitelist = { 
		'burger_fries',
		'burger_shotrings',
		'burger_shotnuggets',
		'bacon_cheeseburger',
		'burger_bleeder',
		'burger_heartstopper',
		'burger_moneyshot',
		'burger_torpedo',
		'burger_softdrink',
		'burger_coffee',
	}
})
```

# Image Installation
- Navigate to your ox_inventory/web/images and paste in the images from the [images] folder provided with this script

# Item Installation OX_INVENTORY
- Next, navigate to your ox_inventory/data/items.lua and paste in:
```lua
	['burgerbag'] = {
		label = 'To Go Bag',
		weight = 100,
		stack = false,
		description = "To go bag from Burgershot container your food!"
	},

	["rawbeef"] = {
		label = "Raw Beef",
		weight = 100,
		stack = true,
		description = "Raw beef!!",
	},

	["rawchicken"] = {
		label = "Raw Chicken",
		weight = 100,
		stack = true,
		description = "Raw chicken breast!",
	},

	["rawpotato"] = {
		label = "Raw Potato",
		weight = 100,
		stack = true,
		description = "Uncooked Potato!",
	},

	["rawonion"] = {
		label = "Raw Onion",
		weight = 100,
		stack = true,
		description = "Uncooked Onion!",
	},

	["slicedonion"] = {
		label = "Sliced Onion",
		weight = 100,
		stack = true,
		description = "Onion Slices!",
	},

	["rawbacon"] = {
		label = "Raw Bacon",
		weight = 100,
		stack = true,
		description = "Raw BACON!!",
	},

	["cookedbacon"] = {
		label = "Cooked Bacon",
		weight = 100,
		stack = true,
		description = "Cooked Bacon!",
	},

	["burgerpatty"] = {
		label = "Burger Patty",
		weight = 100,
		stack = true,
		description = "Cooked Burger Patty!",
	},

	["salt"] = {
		label = "Salt",
		weight = 100,
		stack = true,
		description = "Salt!",
	},

	["breadcrumbs"] = {
		label = "Breadcrumbs",
		weight = 100,
		stack = true,
	},

	["burger_shotnuggets"] = {
		label = "Burgershot Chicken Nuggets",
		weight = 100,
		stack = true,
		description = "Best nuggets in town!",
	},

	["burger_fries"] = {
		label = "Burgershot Fries",
		weight = 100,
		stack = true,
		description = "Best fries in town!",
	},

	["burger_shotrings"] = {
		label = "Burgershot Onion Rings",
		weight = 100,
		stack = true,
		description = "Best onion rings in town!",
	},

	["bacon_cheeseburger"] = {
		label = "Bacon Cheeseburger",
		weight = 100,
		stack = true,
		description = "Burgershots finest!",
	},

	["burger_bleeder"] = {
		label = "Bleeder Burger",
		weight = 100,
		stack = true,
		description = "Bleeder burger!",
	},

	["burger_heartstopper"] = {
		label = "Heartstopper Burger",
		weight = 100,
		stack = true,
		description = "Heartstopper burger!",
	},

	["burger_moneyshot"] = {
		label = "Moneyshot Burger",
		weight = 100,
		stack = true,
		description = "Moneyshot burger!",
	},

	["burger_torpedo"] = {
		label = "Torpedo Burger",
		weight = 100,
		stack = true,
		description = "Torpedo burger!",
	},

	["burgerbun"] = {
		label = "Burger Buns",
		weight = 100,
		stack = true,
	},

	["cheese"] = {
		label = "Cheese",
		weight = 100,
		stack = true,
	},

	["burger_softdrink"] = {
		label = "Soft Drink",
		weight = 100,
		stack = true,
	},

	["burger_coffee"] = {
		label = "Coffee",
		weight = 100,
		stack = true,
	},

	["cola"] = {
		label = "Cola",
		weight = 100,
		stack = true,
	},

	["emptycup"] = {
		label = "Empty Cup",
		weight = 100,
		stack = true,
	},

	["coffeebeans"] = {
		label = "Coffee Beans",
		weight = 100,
		stack = true,
	},

	["creamer"] = {
		label = "Creamer",
		weight = 100,
		stack = true,
	},

	["groundbeef"] = {
		label = "Ground Beef",
		weight = 100,
		stack = true,
	},

	["groundchicken"] = {
		label = "Ground Chicken",
		weight = 100,
		stack = true,
	},

	["slicedpotato"] = {
		label = "Sliced Potatoes",
		weight = 100,
		stack = true,
	},
```

