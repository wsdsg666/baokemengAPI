
from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from typing import List

app = FastAPI()

# 挂载静态文件，只挂载宝可梦图片目录
app.mount("/static/images/pokemon", StaticFiles(directory="public/images/pokemon"), name="pokemon_images")

class ImageService:
    @staticmethod
    def get_pokemon_image_url(
        pokemon_index: str,
        form_name: str,
        is_mega: bool = False,
        is_gmax: bool = False,
        is_shiny: bool = False
    ) -> str:
        base_url = "/static/images/pokemon"
        
        if is_mega:
            subdir = "mega"
        elif is_gmax:
            subdir = "gmax"
        elif is_shiny:
            subdir = "shiny"
        else:
            subdir = "normal"
            
        filename = f"{pokemon_index}-{form_name}"
        if is_mega:
            filename += "-mega"
        elif is_gmax:
            filename += "-gmax"
        if is_shiny:
            filename += "-shiny"
        filename += ".png"
        
        return f"{base_url}/{subdir}/{filename}"

@app.get("/pokemon/{pokemon_id}")
async def get_pokemon(pokemon_id: int):
    # Example of a Pokémon response
    pokemon = {
        "index": str(pokemon_id).zfill(4),
        "forms": [
            {"name": "normal", "image_url": ImageService.get_pokemon_image_url(pokemon_id, "normal")},
            {"name": "shiny", "image_url": ImageService.get_pokemon_image_url(pokemon_id, "shiny", is_shiny=True)}
        ]
    }
    return pokemon
