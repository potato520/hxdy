<?php

namespace App\Http\Controllers\View;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\PdtContent;
use App\Models\PdtImages;
use App\Models\Product;

class BookController extends Controller
{
    public function toCategory()
    {
        $categorys = Category::where('parent_id', '=', 0)->get();
        return view('category', compact('categorys'));
    }

    public function toProduct($category_id)
    {
        $products = Product::where('category_id', '=', $category_id)->get();
        return view('product', compact('products'));
    }

    public function toPdtContent($product_id)
    {
        $product = Product::find($product_id);
        $pdt_content = PdtContent::where('product_id', '=', $product_id)->first();
        $pdt_images = PdtImages::where('product_id', '=', $product_id)->get();
        return view('pdt_content', compact('product', 'pdt_content', 'pdt_images'));
    }


}