<?php

namespace App\Http\Controllers\Service;

use App\Http\Controllers\Controller;
use App\Models\M3Result;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;


class CartController extends Controller
{
    public function addCart(Request $request, $product_id)
    {
        /* 打开注释查看当前的cookie进行调试
        $bk_cart = $request->cookie('bk_cart');
        return $bk_cart;
        */

        // 获取购物车cookie
        $bk_cart = $request->cookie('bk_cart');
        $bk_cart_arr = ($bk_cart != null ? explode(',', $bk_cart) : array());

        $count = 1;
        foreach ($bk_cart_arr as &$value){ // &引用传值修改数组
            $index = strpos($value, ':');
            if(substr($value, 0, $index) == $product_id){
                $count = (int) substr($value, $index+1) + 1;
                $value = $product_id . ':' . $count;
                break;
            }
        }
        if($count == 1) {
            array_push($bk_cart_arr, $product_id . ':' . $count);
        }
        $m3_result = new M3Result();
        $m3_result->status = 0;
        $m3_result->message = '添加成功';
        return response($m3_result->toJson())->cookie('bk_cart', implode(',', $bk_cart_arr));
    }
}
