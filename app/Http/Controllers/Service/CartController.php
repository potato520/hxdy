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

    // 删除购物车商品
    public function deleteCart(Request $request)
    {
        $m3_result = new M3Result();

        $product_ids = $request->input('product_ids', '');
        if($product_ids == ''){
            $m3_result->status = 1;
            $m3_result->message = '书籍id为空';
            return $m3_result->toJson();
        }
        // 获取到的id 字符串转换为数组
        $product_ids_arr = explode(',', $product_ids);

        //获取cookie 里面购物车的数据
        $bk_cart = $request->cookie('bk_cart');

        // php cookie里面的数据变成商品id 转换数组
        $bk_cart_arr = ($bk_cart != null ? explode(',', $bk_cart): array());

        foreach ($bk_cart_arr as $key => $value){
            $index = strpos($value, ':');
            $product_id = substr($value, 0, $index);

            //存在 删除
            if(in_array($product_id, $product_ids_arr)){
                array_splice($bk_cart_arr, $key, 1);
                continue;
            }
        }

        $m3_result->status = 0;
        $m3_result->message = '删除成功';

        // 修改之后的cookie 重新存放到模板中，将cookie的内容转化成数组
        return response($m3_result->toJson())->cookie('bk_cart', implode(',', $bk_cart_arr));



    }
}
