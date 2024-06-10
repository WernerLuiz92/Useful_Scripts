import argparse
from fractions import Fraction
from math import gcd
from functools import reduce

def kelvin_to_celsius(kelvin):
    """
    Converts a temperature in Kelvin to Celsius.

    Args:
        kelvin (float): The temperature in Kelvin.

    Returns:
        float: The temperature in Celsius.

    Example:
        >>> kelvin_to_celsius(293.15)
        20.0
    """
    return kelvin - 273.15

def celsius_to_kelvin(celsius):
    """
    Converts a temperature in Celsius to Kelvin.

    Args:
        celsius (float): The temperature in Celsius.

    Returns:
        float: The temperature in Kelvin.

    Example:
        >>> celsius_to_kelvin(20.0)
        293.15
    """
    return celsius + 273.15

# Dicionário de materias primas
raw_materials = {
    "ItemCoalOre": {
        "id": 1724793494,
        "name": "Coal Ore",
        "type": "ore"
    },
    "ItemCobaltOre": {
        "id": -983091249,
        "name": "Cobalt Ore",
        "type": "ore"
    },
    "ItemCopperOre": {
        "id": -707307845,
        "name": "Copper Ore",
        "type": "ore"
    },
    "ItemGoldOre": {
        "id": -1348105509,
        "name": "Gold Ore",
        "type": "ore"
    },
    "ItemIronOre": {
        "id": 1758427767,
        "name": "Iron Ore",
        "type": "ore"
    },
    "ItemLeadOre": {
        "id": -190236170,
        "name": "Lead Ore",
        "type": "ore"
    },
    "ItemNickelOre": {
        "id": 1830218956,
        "name": "Nickel Ore",
        "type": "ore"
    },
    "ItemSiliconOre": {
        "id": 1103972403,
        "name": "Silicon Ore",
        "type": "ore"
    },
    "ItemSilverOre": {
        "id": -916518678,
        "name": "Silver Ore",
        "type": "ore"
    },
    "ItemUraniumOre": {
        "id": -1516581844,
        "name": "Uranium Ore",
        "type": "ore"
    },
    "Charcoal": {
        "id": 252561409,
        "name": "Charcoal",
        "type": "ore"
    },
    "Biomass": {
        "id": -831480639,
        "name": "Biomass",
        "type": "organic"
    },
    "ItemIce": {
        "id": 1217489948,
        "name": "Water Ice",
        "type": "ice"
    },
    "ItemNitrice": {
        "id": -1499471529,
        "name": "Nitrice",
        "type": "ice"
    },
    "ItemOxite": {
        "id": -1805394113,
        "name": "Oxite",
        "type": "ice"
    },
    "ItemVolatiles": {
        "id": 1253102035,
        "name": "Volatiles",
        "type": "ice"
    }
}

# Dicionário de materiais processados
processed_materials = {
    "ItemCopperIngot": {
        "id": -404336834,
        "name": "Copper Ingot",
        "ingredients": {
            "ItemCopperOre": 1
        },
        "result": 1,
        "temp_min": 600,
        "temp_max": 100000,
        "press_min": 100,
        "press_max": 100000,
        "type": "Ingot"
    },
    "ItemGoldIngot": {
        "id": 226410516,
        "name": "Gold Ingot",
        "ingredients": {
            "ItemGoldOre": 1
        },
        "result": 1,
        "temp_min": 600,
        "temp_max": 100000,
        "press_min": 100,
        "press_max": 100000,
        "type": "Ingot"
    },
    "ItemIronIngot": {
        "id": -1301215609,
        "name": "Gold Ingot",
        "ingredients": {
            "ItemIronOre": 1
        },
        "result": 1,
        "temp_min": 800,
        "temp_max": 100000,
        "press_min": 100,
        "press_max": 100000,
        "type": "Ingot"
    },
    "ItemLeadIngot": {
        "id": 2134647745,
        "name": "Lead Ingot",
        "ingredients": {
            "ItemLeadOre": 1
        },
        "result": 1,
        "temp_min": 400,
        "temp_max": 100000,
        "press_min": 100,
        "press_max": 100000,
        "type": "Ingot"
    },
    "ItemNickelIngot": {
        "id": -1406385572,
        "name": "Nickel Ingot",
        "ingredients": {
            "ItemNickelOre": 1
        },
        "result": 1,
        "temp_min": 800,
        "temp_max": 100000,
        "press_min": 100,
        "press_max": 100000,
        "type": "Ingot"
    },
    "ItemSiliconIngot": {
        "id": -290196476,
        "name": "Silicon Ingot",
        "ingredients": {
            "ItemSiliconOre": 1
        },
        "result": 1,
        "temp_min": 900,
        "temp_max": 100000,
        "press_min": 100,
        "press_max": 100000,
        "type": "Ingot"
    },
    "ItemSilverIngot": {
        "id": -929742000,
        "name": "Silver Ingot",
        "ingredients": {
            "ItemSilverOre": 1
        },
        "result": 1,
        "temp_min": 600,
        "temp_max": 100000,
        "press_min": 100,
        "press_max": 100000,
        "type": "Ingot"
    },
    "ItemSolidFuel": {
        "id": -365253871,
        "name": "Solid Fuel",
        "ingredients": {
            "ItemCoalOre": 1,
            "ItemVolatiles": 1
        },
        "result": 1,
        "temp_min": 950,
        "temp_max": 100000,
        "press_min": 1000,
        "press_max": 100000,
        "type": "Ingot"
    },
    "ItemConstantanIngot": {
        "id": 1058547521,
        "name": "Constantan Alloy",
        "ingredients": {
            "ItemCopperOre": 0.5,
            "ItemNickelOre": 0.5
        },
        "result": 1,
        "temp_min": 1000,
        "temp_max": 100000,
        "press_min": 20000,
        "press_max": 100000,
        "type": "Alloy"
    },
    "ItemElectrumIngot": {
        "id": 502280180,
        "name": "Electrum Alloy",
        "ingredients": {
            "ItemGoldOre": 0.5,
            "ItemSilverOre": 0.5
        },
        "result": 1,
        "temp_min": 600,
        "temp_max": 100000,
        "press_min": 800,
        "press_max": 2400,
        "type": "Alloy"
    },
    "ItemInvarIngot": {
        "id": -297990285,
        "name": "Invar Alloy",
        "ingredients": {
            "ItemIronOre": 0.5,
            "ItemNickelOre": 0.5
        },
        "result": 1,
        "temp_min": 1200,
        "temp_max": 1500,
        "press_min": 18000,
        "press_max": 20000,
        "type": "Alloy"
    },
    "ItemSolderIngot": {
        "id": -82508479,
        "name": "Solder Alloy",
        "ingredients": {
            "ItemIronOre": 0.5,
            "ItemLeadOre": 0.5
        },
        "result": 1,
        "temp_min": 350,
        "temp_max": 550,
        "press_min": 1000,
        "press_max": 100000,
        "type": "Alloy"
    },
    "ItemSteelIngot": {
        "id": -654790771,
        "name": "Steel Alloy",
        "ingredients": {
            "ItemIronOre": 0.75,
            "ItemCoalOre": 0.25
        },
        "result": 1,
        "temp_min": 900,
        "temp_max": 100000,
        "press_min": 1000,
        "press_max": 100000,
        "type": "Alloy"
    },
    "ItemAstroloyIngot": {
        "id": 412924554,
        "name": "Astroloy SuperAlloy",
        "ingredients": {
            "ItemCopperOre": 0.25,
            "ItemSteelIngot": 0.5,
            "ItemCobaltOre": 0.25
        },
        "result": 1,
        "temp_min": 1000,
        "temp_max": 100000,
        "press_min": 30000,
        "press_max": 40000,
        "type": "SuperAlloy"
    },
    "ItemHastelloyIngot": {
        "id": 1579842814,
        "name": "Hastelloy SuperAlloy",
        "ingredients": {
            "ItemSilverOre": 0.5,
            "ItemNickelOre": 0.25,
            "ItemCobaltOre": 0.25,
        },
        "result": 1,
        "temp_min": 950,
        "temp_max": 1000,
        "press_min": 25000,
        "press_max": 30000,
        "type": "SuperAlloy"
    },
    "ItemInconelIngot": {
        "id": -787796599,
        "name": "Inconel SuperAlloy",
        "ingredients": {
            "ItemGoldOre": 0.5,
            "ItemSteelIngot": 0.25,
            "ItemNickelOre": 0.25
        },
        "result": 1,
        "temp_min": 600,
        "temp_max": 100000,
        "press_min": 23500,
        "press_max": 24000,
        "type": "SuperAlloy"
    },
    "ItemStelliteIngot": {
        "id": -1897868623,
        "name": "Stellite SuperAlloy",
        "ingredients": {
            "ItemSilverOre": 0.25,
            "ItemSiliconOre": 0.5,
            "ItemCobaltOre": 0.25
        },
        "result": 1,
        "temp_min": 1800,
        "temp_max": 100000,
        "press_min": 10000,
        "press_max": 20000,
        "type": "SuperAlloy"
    },
    "ItemWaspaloyIngot": {
        "id": 156348098,
        "name": "Waspaloy SuperAlloy",
        "ingredients": {
            "ItemSilverOre": 0.25,
            "ItemNickelOre": 0.25,
            "ItemLeadOre": 0.5
        },
        "result": 1,
        "temp_min": 400,
        "temp_max": 800,
        "press_min": 50000,
        "press_max": 100000,
        "type": "SuperAlloy"
    }
}

item_recipes = {}

def output_recipe(recipe, qty=None):
    """
    Outputs the recipe information to the console.

    Args:
        recipe (dict): The recipe dictionary.
        qty (float, optional): The quantity of the recipe. Defaults to None.

    Returns:
        None
    """
    if qty is None:
        qty = recipe['result']
    print(f" - - - - - \n")
    print(f"Recipe: {recipe['name'][:recipe['name'].find(' ')]} x {round(qty, 2)}")
    print(f"\n\tIngredients:")
    for ingredient, amount in recipe["ingredients"].items():
        # Se o material não for encontrado no dicionário raw_materials, verifica se é um material do dicionário processed_materials
        if ingredient not in raw_materials:
            if ingredient in processed_materials:
                print(f"\t\t{processed_materials[ingredient]['name'][:processed_materials[ingredient]['name'].find(' ')]} x {round(amount*qty, 4)}")
                for key, value in processed_materials[ingredient]["ingredients"].items():
                    print(f"\t\t\t{raw_materials[key]['name'][:raw_materials[key]['name'].find(' ')]} x {round(value*round(amount*qty, 4), 4)}")
            else:
                print(f"\t\t{ingredient} not found")
                continue
        else:
            print(f"\t\t{raw_materials[ingredient]['name'][:raw_materials[ingredient]['name'].find(' ')]} x {round(amount*qty, 4)}")
    
    # Se as temperaturas forem menores que 1000, exibe em Kelvins, senão, exibe em kKelvins
    min_temp_k = f"{round(recipe['temp_min'], 2)} K" if recipe["temp_min"] < 1000 else f"{round(recipe['temp_min']/1000, 2)} kK"
    min_temp_c = f"{round(kelvin_to_celsius(recipe['temp_min']), 2)} ºC" if kelvin_to_celsius(recipe["temp_min"]) < 1000 else f"{round(kelvin_to_celsius(recipe['temp_min'])/1000, 2)} kºC"
    max_temp_k = f"{round(recipe['temp_max'], 2)} K" if recipe["temp_max"] < 1000 else f"{round(recipe['temp_max']/1000, 2)} kK"
    max_temp_c = f"{round(kelvin_to_celsius(recipe['temp_max']), 2)} ºC" if kelvin_to_celsius(recipe["temp_max"]) < 1000 else f"{round(kelvin_to_celsius(recipe['temp_max'])/1000, 2)} kºC"
    min_press = f"{recipe['press_min']} kPa" if recipe["press_min"] < 1000 else f"{recipe['press_min']/1000} MPa"
    max_press = f"{recipe['press_max']} kPa" if recipe["press_max"] < 1000 else f"{recipe['press_max']/1000} MPa"

    print(f"\n\tTemperature Range (In Kelvin / Celsius): \n\t\t{min_temp_k} => {max_temp_k}\n\t\t{min_temp_c} => {max_temp_c}")
    print(f"\n\tPressure Range (In Pascals): \n\t\t{min_press} => {max_press}")
    print(f"\n")

def print_recipe(recipe_name = "", qty = 1):
    """
    Prints the recipe with the given recipe name and quantity. If no recipe name is provided, prints all recipes.
    
    Parameters:
        recipe_name (str): The name of the recipe to print. Default is an empty string.
        qty (int): The quantity of the recipe to print. Default is 1.
    
    Returns:
        None
    
    Raises:
        None
    
    Example:
        >>> print_recipe("Coal Ore", 5)
        Desired Quantity: 5 (Minimum viable quantity is 5)
        
        Selected Recipe: Coal Ore
        
        ItemCoalOre: 5
    """
    if recipe_name != "":
        for idx, recipe in processed_materials.items():
            if recipe['name'].find(recipe_name) != -1:
                break
    else:
        for idx, recipe in processed_materials.items():
            output_recipe(recipe)

    if recipe_name != "" and recipe['name'].find(recipe_name) == -1:
        print("Recipe not found")
        return

    qty_old = qty
    qty = calculate_minimum_recipe(recipe, qty)
    
    if qty_old != qty:
        print(f"Desired Quantity: {qty_old} (Minimum viable quantity is {qty})\n")
    else:
        print(f"Desired Quantity: {qty}\n")

    print(f"Selected Recipe: {recipe['name']}\n\n")

    output_recipe(recipe, qty)

def calculate_minimum_recipe(recipe, qty):    
    """
    Calculates the minimum quantity of ingredients needed to make a given recipe, ensuring that all ingredient ratios are integers.

    Parameters:
    - recipe (dict): A dictionary representing the recipe, with 'ingredients' as a dictionary of ingredient names and amounts.
    - qty (int): The desired quantity of the recipe.

    Returns:
    - int: The minimum quantity of the recipe needed to ensure all ingredient ratios are integers.
    """
    
    def least_common_multiple(x, y):
        return x * y // gcd(x, y)
    
    def least_common_multiple_in_list(numbers):
        """
        Calculates the least common multiple of a list of numbers.

        Args:
            numbers (List[int]): A list of integers.

        Returns:
            int: The least common multiple of the input numbers.

        Example:
            >>> least_common_multiple_in_list([4, 6, 8])
            24

        Note:
            This function uses the `reduce` function from the `functools` module to calculate the least common multiple.
        """
        from functools import reduce
        return reduce(least_common_multiple, numbers)
    
    # Get a list of ratios and return the fraction of each ratio
    def get_fractions(ratios):
        """
        Returns a list of fractions by converting a list of ratios to fractions and limiting the denominator.

        Parameters:
        - ratios (list): A list of ratios to be converted to fractions.

        Returns:
        - fractions (list): A list of fractions with limited denominators.
        """
        return [Fraction(v).limit_denominator() for v in ratios]
    
    # Extract the denominator of each ratio and return the list of denominators
    def get_denominators(fractions):
        """
        Returns a list of denominators from a list of fractions.

        Parameters:
        - fractions (list): A list of fractions.

        Returns:
        - list: A list of denominators.
        """
        return [frac.denominator for frac in fractions]
    
    def get_all_ingredient_ratios(recipe, processed_materials):
        """
        Calculates the ratios of all ingredients in a given recipe by recursively traversing the nested structure of ingredients.

        Args:
            recipe (dict): A dictionary representing the recipe, with 'ingredients' as a dictionary of ingredient names and amounts.
            processed_materials (dict): A dictionary representing the processed materials, with ingredient names as keys and their corresponding sub-recipes as values.

        Returns:
            list: A list of ratios for all ingredients in the recipe. The ratios are calculated by multiplying the amount of each ingredient with the ratio of its sub-recipe (if any).

        Example:
            >>> recipe = {
            ...     'name': 'Recipe A',
            ...     'ingredients': {
            ...         'Ingredient 1': 2,
            ...         'Ingredient 2': 3,
            ...         'Ingredient 3': {
            ...             'Ingredient 4': 4,
            ...             'Ingredient 5': 5
            ...         }
            ...     }
            ... }
            >>> processed_materials = {
            ...     'Ingredient 3': {
            ...         'Ingredient 4': {
            ...             'name': 'Sub-Recipe A',
            ...             'ingredients': {
            ...                 'Ingredient 6': 6
            ...             }
            ...         },
            ...         'Ingredient 5': {
            ...             'name': 'Sub-Recipe B',
            ...             'ingredients': {
            ...                 'Ingredient 7': 7
            ...             }
            ...         }
            ...     }
            ... }
            >>> get_all_ingredient_ratios(recipe, processed_materials)
            [2, 3, 4, 5, 6, 7]
        """
        ratios = []
        for ingredient, amount in recipe['ingredients'].items():
            if ingredient in processed_materials:
                sub_recipe = processed_materials[ingredient]
                sub_ratios = get_all_ingredient_ratios(sub_recipe, processed_materials)
                ratios.extend([amount * sub_amount for sub_amount in sub_ratios])
            else:
                ratios.append(amount)
        return ratios
    
    # Obtém todas as proporções de ingredientes (incluindo sub-receitas)
    ratios = get_all_ingredient_ratios(recipe, processed_materials)
    fractions = get_fractions(ratios)
    denominators = get_denominators(fractions)
    recipe_multiplier = least_common_multiple_in_list(denominators)

    adjusted_qty = (qty + recipe_multiplier - 1) // recipe_multiplier * recipe_multiplier
    
    return adjusted_qty

def main():
    parser = argparse.ArgumentParser(description='Calculate materials required to produce a desired quantity of a given recipe.')
    parser.add_argument('quantity', type=int, help='Quantity of the desired item to produce', default=1, nargs='?')
    parser.add_argument('recipe', type=str, help='Name of the recipe to use', default="", nargs='?')

    args = parser.parse_args()
    print_recipe(args.recipe, args.quantity)

if __name__ == "__main__":
    main()
