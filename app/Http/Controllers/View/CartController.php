<?php

namespace App\Http\Controllers\View;

use App\Http\Controllers\Controller;

use App\Models\CartItem;
use App\Models\M3Result;
use App\Models\Product;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function toCart(Request $request)
    {
        $cart_arrs = array();

        // 获取购物车cookie
        $bk_cart = $request->cookie('bk_cart');
        $bk_cart_arr = ($bk_cart != null ? explode(',', $bk_cart) : array());

        foreach ($bk_cart_arr as $key =>$value){ // &引用传值修改数组
            $index = strpos($value, ':');

            $cart_item = new CartItem;
            $cart_item->id = $key;
            $cart_item->product_id = substr($value, 0, $index);
            $cart_item->count = (int) substr($value, $index+1);
            $cart_item->product = Product::find($cart_item->product_id);
            if($cart_item->product != null){
                array_push($cart_arrs, $cart_item);
            }
        }

        return view('cart',compact('cart_arrs'));
    }

}