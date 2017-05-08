@extends('master')

@section('title', $product->name)

@section('content')
    <!--page bk_content 这个div是在底部浮动一个空白区域，用来放置购买按钮-->
    <div class="page bk_content" style="top: 0;">

    <!--轮播图 star-->
    <link rel="stylesheet" href="{{ asset('css/swipe.css') }}">
    <div class="addWrap">
        <div class="swipe" id="mySwipe">
            <div class="swipe-wrap">
                @foreach($pdt_images as $pdt_image)
                    <div>
                        <a href="javascript:;"><img class="img-responsive" src="{{ url($pdt_image->image_path) }}" /></a>
                    </div>
                @endforeach
            </div>
        </div>
        <ul id="position">
            @foreach($pdt_images as $index => $pdt_image)
                <li class={{$index == 0 ? 'cur' : ''}}></li>
            @endforeach
        </ul>
    </div>
    <!--轮播图 end-->

    <div class="weui_cells_title">
        <span class="bk_title">{{$product->name}}</span>
        <span class="bk_price" style="float: right">￥ {{$product->price}}</span>
    </div>
    <div class="weui_cells">
        <div class="weui_cell">
            <p class="bk_summary">{{$product->summary}}</p>
        </div>
    </div>

    <div class="weui_cells_title">详细介绍</div>
    <div class="weui_cells">
        <div class="weui_cell">
            <!--解析html字符-->
            <p>{!!$pdt_content->content!!}</p>
        </div>
    </div>

    </div>

    <!--底部浮动的购买按钮 star-->
    <div class="bk_fix_bottom">
        <div class="bk_half_area">
            <button class="weui_btn weui_btn_primary" onclick="_addCart();">加入购物车</button>
        </div>
        <div class="bk_half_area">
            <button class="weui_btn weui_btn_default" onclick="_toCart()">查看购物车(<span id="cart_num" class="m3_price">1</span>)</button>
        </div>
    </div>
    <!--底部浮动的购买按钮 end-->

@endsection

@section('my-js')
    <!--轮播图 star-->
    <script src="{{ asset('js/swipe.min.js') }}"></script>
    <script type="text/javascript">
        var bullets = document.getElementById('position').getElementsByTagName('li');
        Swipe(document.getElementById('mySwipe'), {
            auto: 2000,
            continuous: true,
            disableScroll: false,
            callback: function(pos) {
                var i = bullets.length;
                while (i--) {
                    bullets[i].className = '';
                }
                bullets[pos].className = 'cur';
            }
        });
    </script>
    <!--轮播图 end-->

@endsection