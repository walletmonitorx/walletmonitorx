from fastapi import FastAPI
from pydantic import BaseModel

app = FastAPI()

@app.get('/')
def home():
    return {'message': '🚀 Dropship Tool Running Successfully!'}

class Item(BaseModel):
    title: str
    price: float
    description: str

@app.post('/list-item')
def list_item(item: Item):
    return {
        'status': 'success',
        'message': f"Item '{item.title}' is ready to be listed on eBay!",
        'item_details': item.dict()
    }
